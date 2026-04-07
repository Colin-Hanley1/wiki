---
title: "QAOA"
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, optimization, variational, qaoa]
sources: [qml-textbook-ch-5-qaoa]
---

# QAOA

The **Quantum Approximate Optimization Algorithm** (QAOA) is a hybrid quantum-classical algorithm for finding approximate solutions to combinatorial optimization problems. Introduced by Farhi, Goldstone, and Gutmann (2014), it discretizes adiabatic quantum evolution into a fixed-depth parameterized circuit, making it suitable for near-term (NISQ) quantum hardware.

## Core Idea

QAOA encodes an optimization problem into a **cost Hamiltonian** $H_C$ (also called $H_1$), whose ground state corresponds to the optimal solution. It then uses a variational quantum circuit to prepare a state that approximately minimizes $\langle \psi \mid H_C \mid \psi \rangle$.

The algorithm alternates between two unitaries:

1. **Cost unitary**: $e^{-i\gamma_k H_C}$, which imprints the problem structure.
2. **Mixer unitary**: $e^{-i\beta_k H_M}$, which explores the solution space.

The standard mixer Hamiltonian is $H_M = \sum_{j=0}^{n-1} X_j$.

## Parameterized State

Starting from the ground state of $H_M$, which is $|+\rangle^{\otimes n}$, QAOA with depth $p$ prepares

$$
|\vec{\beta}, \vec{\gamma}\rangle = \prod_{k=1}^{p} e^{-i\beta_k H_M} e^{-i\gamma_k H_C} \; |+\rangle^{\otimes n}
$$

where $\vec{\gamma} = (\gamma_1, \dots, \gamma_p)$ and $\vec{\beta} = (\beta_1, \dots, \beta_p)$ are $2p$ real parameters.

## Algorithm Loop

1. Choose depth $p$ and initial parameters $\vec{\beta}_0, \vec{\gamma}_0$.
2. **Quantum step**: Prepare $|\vec{\beta}, \vec{\gamma}\rangle$ on the quantum computer.
3. **Measurement**: Measure the state $M$ times to estimate the energy

$$
E(\vec{\beta}, \vec{\gamma}) = \langle \vec{\beta}, \vec{\gamma} \mid H_C \mid \vec{\beta}, \vec{\gamma} \rangle \approx \sum_x \frac{m_x}{M} \langle x \mid H_C \mid x \rangle
$$

4. **Classical optimization**: Update $\vec{\beta}, \vec{\gamma}$ to reduce $E$.
5. Repeat until convergence; measure the final state $|\vec{\beta}^*, \vec{\gamma}^*\rangle$ to obtain an approximate solution.

## Circuit Decomposition

For an Ising cost Hamiltonian $H_C = -\sum_{j,k} J_{jk} Z_j Z_k - \sum_j h_j Z_j$:

- **Mixer layer** ($e^{-i\beta_k H_M}$): Apply $R_X(2\beta_k)$ to every qubit (the $X_j$ operators all commute).
- **Linear $Z$ terms** ($e^{i\gamma h_j Z_j}$): Apply $R_Z(2\gamma h_j)$ to qubit $j$.
- **Quadratic $ZZ$ terms** ($e^{-i\gamma J_{jk} Z_j Z_k}$): Use the CNOT-$R_Z$-CNOT gadget:
  - CNOT from qubit $j$ to qubit $k$
  - $R_Z(2\gamma J_{jk})$ on qubit $k$
  - CNOT from qubit $j$ to qubit $k$

The initial state $|+\rangle^{\otimes n}$ is prepared by a layer of Hadamard gates.

## Connection to Adiabatic Computing

In the adiabatic model, the system evolves continuously under $H(t) = (1 - t/T)\,H_M + (t/T)\,H_C$. QAOA discretizes this into $p$ steps with tunable parameters, recovering the adiabatic limit as $p \to \infty$ with appropriate parameter schedules.

## HOBO Extension

QAOA can natively handle **Higher Order Binary Optimization** (HOBO/PUBO) problems. For terms like $Z_{j_1} Z_{j_2} \cdots Z_{j_m}$, the CNOT-$R_Z$-CNOT gadget generalizes: apply a cascade of CNOTs from qubits $j_1, \dots, j_{m-1}$ into qubit $j_m$, apply $R_Z(2a)$ on $j_m$, then reverse the CNOT cascade.

## Worked Examples

### Example 1: QAOA Circuit for 2-Node Max-Cut

**Problem.** Consider a graph with 2 nodes (qubits 0 and 1) connected by a single edge. The Max-Cut cost function counts the number of edges crossing the partition. The corresponding Ising Hamiltonian is

$$
H_C = \frac{1}{2}(I - Z_0 Z_1)
$$

Since the constant $\frac{1}{2}I$ does not affect optimization, we can work with $H_C' = -\frac{1}{2}Z_0 Z_1$ (minimizing $H_C'$ maximizes the cut).

**QAOA circuit with $p = 1$.** We have parameters $\gamma_1$ and $\beta_1$.

**Step 1 -- Prepare $|+\rangle^{\otimes 2}$:**

Apply $H$ to both qubits: $|00\rangle \to |{+}{+}\rangle$.

**Step 2 -- Cost layer $e^{-i\gamma_1 H_C'}$:**

We need $e^{i(\gamma_1/2) Z_0 Z_1}$. Using the CNOT-$R_Z$-CNOT gadget with parameter $a = \gamma_1 / 2$:

- CNOT (control = 0, target = 1)
- $R_Z(\gamma_1)$ on qubit 1
- CNOT (control = 0, target = 1)

**Step 3 -- Mixer layer $e^{-i\beta_1 H_M}$:**

Apply $R_X(2\beta_1)$ to qubit 0 and $R_X(2\beta_1)$ to qubit 1.

**Step 4 -- Measure both qubits.**

The full circuit is: $H \otimes H \;\to\; \text{CNOT}_{01} \;\to\; R_Z(\gamma_1)_1 \;\to\; \text{CNOT}_{01} \;\to\; R_X(2\beta_1)_0 \otimes R_X(2\beta_1)_1 \;\to\; \text{Measure}$.

**Energy evaluation.** For outcome $x = 01$: $\langle 01 \mid Z_0 Z_1 \mid 01 \rangle = (1)(-1) = -1$, so $\langle 01 \mid H_C' \mid 01 \rangle = 1/2$. This corresponds to a cut of size 1 (optimal). Similarly $x = 10$ gives cut size 1, while $x = 00$ and $x = 11$ give cut size 0.

At optimal parameters (e.g., $\gamma_1 = \pi/4$, $\beta_1 = \pi/8$), the circuit concentrates probability on the $|01\rangle$ and $|10\rangle$ outcomes, which are the two maximum cuts.

### Example 2: Energy Evaluation for a 3-Qubit Ising Hamiltonian

**Problem.** Given $H_1 = 3Z_0 Z_2 - Z_1 Z_2 + 2Z_0$, evaluate $\langle 101 \mid H_1 \mid 101 \rangle$.

**Solution.** For basis state $|101\rangle$, qubit 0 is in state $|1\rangle$, qubit 1 in $|0\rangle$, qubit 2 in $|1\rangle$.

Recall $\langle x \mid Z_j \mid x \rangle = +1$ if qubit $j$ is 0, and $-1$ if qubit $j$ is 1. Also, $\langle x \mid Z_j Z_k \mid x \rangle = +1$ if qubits $j$ and $k$ match, and $-1$ if they differ.

- $\langle 101 \mid Z_0 Z_2 \mid 101 \rangle$: qubits 0 and 2 are both 1 (match) $\Rightarrow +1$.
- $\langle 101 \mid Z_1 Z_2 \mid 101 \rangle$: qubits 1 and 2 differ (0 vs 1) $\Rightarrow -1$.
- $\langle 101 \mid Z_0 \mid 101 \rangle$: qubit 0 is 1 $\Rightarrow -1$.

Therefore:

$$
\langle 101 \mid H_1 \mid 101 \rangle = 3(1) - (-1) + 2(-1) = 3 + 1 - 2 = 2
$$

## See Also

- [[VQE]]
- [[Grover's Algorithm]]
- [[Amplitude Amplification]]
- [[Quantum Gates]]
- [[QML Textbook — Ch. 5 QAOA]]
