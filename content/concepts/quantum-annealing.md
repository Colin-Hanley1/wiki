---
title: "Quantum Annealing"
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, optimization, adiabatic-quantum-computing, d-wave]
sources: [qml_ch4]
---

## Overview

**Quantum annealing** is a metaheuristic for solving combinatorial optimization problems using quantum mechanics. It is a practical, restricted form of adiabatic quantum computing (AQC) in which a quantum system is evolved from an easily prepared initial state toward the ground state of a problem Hamiltonian. Unlike full AQC, quantum annealing does not guarantee adiabatic evolution and restricts the problem Hamiltonian to Ising form (Source: [[QML Textbook — Ch. 4 Adiabatic QC and Quantum Annealing]]).

## The Adiabatic Theorem

The theoretical foundation of quantum annealing is the **adiabatic theorem** (Born and Fock, 1928). It states that a quantum system initialized in the ground state of a Hamiltonian $H_0$ will remain in the instantaneous ground state as the Hamiltonian changes, *provided the change is sufficiently slow*. The required evolution time $T$ scales as:

$$
T \propto \frac{1}{\Delta^2}
$$

where $\Delta$ is the **spectral gap**---the minimum energy difference between the ground state and the first excited state of $H(t)$ across the entire evolution.

## Time-Dependent Hamiltonian

In adiabatic quantum computing, the system evolves under:

$$
H(t) = A(t) H_0 + B(t) H_1
$$

where:

- $H_0$ is the **initial Hamiltonian** with an easily prepared ground state.
- $H_1$ is the **problem Hamiltonian** whose ground state encodes the solution.
- $A(t)$ and $B(t)$ satisfy boundary conditions: $A(0) = B(T) = 1$ and $A(T) = B(0) = 0$.
- A common linear schedule is $A(t) = 1 - t/T$ and $B(t) = t/T$.

Introducing the normalized parameter $s = t/T \in [0, 1]$, the Hamiltonian is often written as:

$$
H(s) = (1 - s) H_0 + s \, H_P
$$

where $H_P \equiv H_1$ is the problem Hamiltonian.

## Quantum Annealing Specifics

Quantum annealing deviates from full AQC in two key ways:

### 1. Restricted Problem Hamiltonian

The final Hamiltonian must be an Ising Hamiltonian:

$$
H_1 = -\sum_{j,k} J_{jk} Z_j Z_k - \sum_j h_j Z_j
$$

where the user selects the coupling coefficients $J_{jk}$ and local field strengths $h_j$ within hardware-imposed ranges. This restriction means quantum annealing is **not universal** (unlike full AQC), but it enables scaling to thousands of qubits.

### 2. Non-Adiabatic Evolution

The evolution is not guaranteed to be adiabatic because:

- Computing the spectral gap $\Delta$ can be harder than the original problem.
- Even when $\Delta$ is known, the required time $T \propto 1/\Delta^2$ may be impractically large.

Instead, the annealer runs for a fixed time and the process is repeated multiple times. Since measurement collapses the state, any run has a nonzero probability of yielding a good (or optimal) solution.

### Initial Hamiltonian and Ground State

The standard initial Hamiltonian is:

$$
H_0 = -\sum_{j=0}^{n-1} X_j
$$

Its ground state is the uniform superposition $\bigotimes_{i=0}^{n-1} \lvert + \rangle$, which is easy to prepare (apply Hadamard to each qubit initialized in $\lvert 0 \rangle$).

### Full Annealing Hamiltonian

$$
H(t) = -A(t) \sum_{j=0}^{n-1} X_j - B(t) \sum_{j,k} J_{jk} Z_j Z_k - B(t) \sum_j h_j Z_j
$$

The functions $A(t)$ and $B(t)$ constitute the **annealing schedule**.

## Connection to Classical Simulated Annealing

Classical simulated annealing explores solution spaces by probabilistically accepting worse solutions at high "temperatures," then gradually cooling. Quantum annealing replaces thermal fluctuations with quantum fluctuations: the transverse field ($H_0$ terms) enables **quantum tunneling** through energy barriers, potentially allowing escape from local minima that would trap classical methods. As the transverse field is reduced (decreasing $A(t)$), the system settles into a low-energy state of the problem Hamiltonian.

## D-Wave Hardware

D-Wave Systems commercialized the first quantum annealers:

| Device | Year | Qubits |
|---|---|---|
| D-Wave One | 2011 | 128 |
| D-Wave Advantage | ~2020 | 5000+ |

Access is provided through **D-Wave Leap**, a cloud service with free monthly computing time. The **Ocean** Python library provides tools for problem formulation (`dimod`), embedding (`dwave.system`), and sampling.

## Worked Examples

### Example 1: Setting Up a Max-Cut Annealing Problem

**Problem**: Solve the Max-Cut problem for a 3-vertex path graph with edges $\{(0,1), (0,2)\}$ using quantum annealing.

**Step 1 --- Identify the Ising Hamiltonian**: The Max-Cut objective is:

$$
\text{Minimize } z_0 z_1 + z_0 z_2
$$

In operator form, this is $H_1 = Z_0 Z_1 + Z_0 Z_2$, so $J_{01} = 1$, $J_{02} = 1$, and all $h_j = 0$.

**Step 2 --- Specify the problem in Ocean**:

```python
import dimod

J = {(0, 1): 1, (0, 2): 1}
h = {}
problem = dimod.BinaryQuadraticModel(h, J, 0.0, dimod.SPIN)
```

**Step 3 --- Run on a D-Wave sampler**:

```python
from dwave.system import DWaveSampler, EmbeddingComposite

sampler = EmbeddingComposite(DWaveSampler())
result = sampler.sample(problem, num_reads=100)

for sample, energy in result.data(['sample', 'energy']):
    print(sample, energy)
```

**Step 4 --- Interpret results**: The annealer returns spin assignments. An optimal solution is $z_0 = 1, z_1 = -1, z_2 = -1$ (or equivalently $z_0 = -1, z_1 = 1, z_2 = 1$), both giving energy $-2$, meaning both edges are cut.

**What happens physically**: The system starts in $\lvert + \rangle^{\otimes 3}$ (ground state of $H_0 = -(X_0 + X_1 + X_2)$). Over the annealing time $T$, the transverse field ($X$ terms) is reduced while the Ising couplings ($Z_j Z_k$ terms) are increased. If the evolution is slow enough relative to the spectral gap, the system tracks the instantaneous ground state and ends near the ground state of $H_1$.

### Example 2: QUBO Formulation on a D-Wave Annealer

**Problem**: Solve the binary optimization problem: minimize $-5x_0 + 3x_1 - 2x_2$ subject to $x_0 + x_2 \leq 1$, using a quantum annealer.

**Step 1 --- Convert to QUBO via penalty method**: Introduce slack variable $y_0$ and penalty $B = 10$:

$$
\text{Minimize } -5x_0 + 3x_1 - 2x_2 + 10(x_0 + x_2 + y_0 - 1)^2
$$

**Step 2 --- Expand the penalty term**:

$$
10(x_0 + x_2 + y_0 - 1)^2 = 10(x_0^2 + x_2^2 + y_0^2 + 2x_0 x_2 + 2x_0 y_0 + 2x_2 y_0 - 2x_0 - 2x_2 - 2y_0 + 1)
$$

Using $x_j^2 = x_j$:

$$
= 10x_0 + 10x_2 + 10y_0 + 20x_0 x_2 + 20x_0 y_0 + 20x_2 y_0 - 20x_0 - 20x_2 - 20y_0 + 10
$$

$$
= -10x_0 - 10x_2 - 10y_0 + 20x_0 x_2 + 20x_0 y_0 + 20x_2 y_0 + 10
$$

**Step 3 --- Combine with objective** (dropping constant):

$$
\text{Minimize } -15x_0 + 3x_1 - 12x_2 - 10y_0 + 20x_0 x_2 + 20x_0 y_0 + 20x_2 y_0
$$

**Step 4 --- Specify as QUBO in Ocean**:

```python
Q = {(0, 0): -15, (1, 1): 3, (2, 2): -12, (3, 3): -10,
     (0, 2): 20, (0, 3): 20, (2, 3): 20}
problem = dimod.BinaryQuadraticModel.from_qubo(Q)
```

The annealer finds $x_0 = 1, x_1 = 0, x_2 = 0, y_0 = 0$ with objective value $-5$, which satisfies the constraint and is optimal.

## See Also

- [[QUBO]]
- [[QML Textbook — Ch. 4 Adiabatic QC and Quantum Annealing]]
- [[QML Textbook — Ch. 3 QUBO Problems]]
- [[Quantum Gates]]
- [[Qubit]]
