---
title: "QML Textbook — Ch. 4 Adiabatic QC and Quantum Annealing"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, adiabatic-quantum-computing, quantum-annealing, d-wave, optimization]
sources: [qml_ch4]
---

## Overview

Chapter 4 introduces adiabatic quantum computing (AQC) and its practical restriction, quantum annealing. It covers the theoretical foundations (time-dependent Hamiltonians, the adiabatic theorem, spectral gap), the connection to Ising/QUBO optimization, and hands-on use of D-Wave quantum annealers via the Ocean library.

## Key Concepts and Formulas

### Time-Dependent Schrodinger Equation

$$
H(t) \lvert \psi(t) \rangle = i\hbar \frac{\partial}{\partial t} \lvert \psi(t) \rangle
$$

### Adiabatic Quantum Computing

The core idea: start with a simple Hamiltonian $H_0$ whose ground state is easy to prepare, then slowly evolve toward a problem Hamiltonian $H_1$ whose ground state encodes the solution. The time-dependent Hamiltonian interpolates:

$$
H(t) = A(t) H_0 + B(t) H_1
$$

with boundary conditions $A(0) = B(T) = 1$ and $A(T) = B(0) = 0$. A common choice is $A(t) = 1 - t/T$ and $B(t) = t/T$.

### The Adiabatic Theorem

If the evolution is slow enough, the system remains in the instantaneous ground state throughout. The required total time $T$ is inversely proportional to the square of the **spectral gap** $\Delta$, the minimum energy difference between the ground state and first excited state during evolution:

$$
T \propto \frac{1}{\Delta^2}
$$

AQC is polynomially equivalent to the quantum circuit model (Aharonov et al.).

### Quantum Annealing

A practical restriction of AQC with two key deviations:

1. **Restricted final Hamiltonian**: $H_1$ is typically an Ising Hamiltonian $-\sum_{j,k} J_{jk} Z_j Z_k - \sum_j h_j Z_j$ with user-selectable coefficients $J_{jk}$ and $h_j$.
2. **Non-adiabatic evolution**: The process is not guaranteed to be adiabatic (computing the spectral gap can be harder than solving the original problem).

The initial Hamiltonian is fixed to $H_0 = -\sum_{j=0}^{n-1} X_j$, with ground state $\bigotimes_{i=0}^{n-1} \lvert + \rangle$.

The full annealing Hamiltonian:

$$
H(t) = -A(t) \sum_{j=0}^{n-1} X_j - B(t) \sum_{j,k} J_{jk} Z_j Z_k - B(t) \sum_j h_j Z_j
$$

where $A$ and $B$ form the **annealing schedule**.

### D-Wave Hardware

- D-Wave One (2011): 128 qubits, first commercial quantum annealer.
- D-Wave Advantage: 5000+ qubits, available via D-Wave Leap cloud service.
- Problems specified using `dimod.BinaryQuadraticModel` with Ising (`dimod.SPIN`) or QUBO (`dimod.BINARY`) variables.
- Solutions obtained via `EmbeddingComposite(DWaveSampler()).sample(problem, num_reads=N)`.

### Connection to Classical Simulated Annealing

Quantum annealing can be viewed as a quantum analog of classical simulated annealing. Both use thermal/quantum fluctuations to escape local minima, but quantum annealing exploits quantum tunneling through energy barriers rather than thermally hopping over them.

## Key Takeaways

- Adiabatic QC is a universal model of quantum computation, polynomially equivalent to quantum circuits.
- Quantum annealing sacrifices universality for practical scalability (thousands of qubits).
- The spectral gap governs the required evolution time; small gaps require slow evolution and make problems hard.
- D-Wave provides accessible cloud-based quantum annealers; problems must be expressed as Ising or QUBO instances.
- Multiple annealing runs are typical since results are probabilistic and evolution may not be fully adiabatic.

## See Also

- [[Quantum Annealing]]
- [[QUBO]]
- [[QML Textbook — Ch. 3 QUBO Problems]]
- [[QML Textbook — Ch. 2 Tools of the Trade]]
- [[QML Textbook — Ch. 1 Foundations of Quantum Computing]]
