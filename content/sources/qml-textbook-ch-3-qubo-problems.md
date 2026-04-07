---
title: "QML Textbook — Ch. 3 QUBO Problems"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, optimization, qubo, ising-model, max-cut]
sources: [qml_ch3]
---

## Overview

Chapter 3 introduces Quadratic Unconstrained Binary Optimization (QUBO) problems and their equivalence with the Ising model. It shows how classical combinatorial optimization problems (Max-Cut, Subset Sum, Knapsack, binary linear programming) can be formulated as QUBO instances, making them amenable to quantum algorithms.

## Key Concepts and Formulas

### From Classical Variables to Qubits

The chapter bridges classical optimization and quantum mechanics by showing that the $Z$ gate eigenvalues ($+1$ and $-1$) naturally encode spin variables. For a basis state $\lvert x \rangle$:

$$
\langle x \mid Z_j Z_k \mid x \rangle = \begin{cases} -1 & \text{if edge } (j,k) \text{ is cut} \\ +1 & \text{otherwise} \end{cases}
$$

### Max-Cut as a Quantum Problem

For a graph with vertex set $V$ (size $n$) and edge set $E$, the Max-Cut problem becomes:

$$
\text{Minimize } \sum_{(j,k) \in E} \langle \psi \mid Z_j Z_k \mid \psi \rangle
$$

where $\lvert \psi \rangle$ ranges over all $n$-qubit quantum states. The minimum is always attained on a computational basis state (the **variational principle**).

### Ising Model (Quantum Form)

$$
\text{Minimize } -\sum_{(j,k) \in E} J_{jk} \langle \psi \mid Z_j Z_k \mid \psi \rangle - \sum_j h_j \langle \psi \mid Z_j \mid \psi \rangle
$$

### QUBO Definition

A QUBO problem minimizes a quadratic polynomial $q(x_0, \dots, x_m)$ over binary variables $x_j \in \{0, 1\}$. QUBO problems are $NP$-hard.

### Ising-to-QUBO Conversion

Using the substitution $z_j = 1 - 2x_j$ (where $z_j \in \{-1, +1\}$ and $x_j \in \{0, 1\}$), any Ising energy function becomes a quadratic polynomial in binary variables. The reverse substitution $x_j = (1 - z_j)/2$ converts QUBO to Ising, noting that $z_j^2 = 1$ and constant terms can be dropped for optimization.

### Penalty Method for Constraints

To convert a constrained problem to QUBO:

1. Introduce **slack variables** to convert inequalities to equalities.
2. Square each equality constraint and multiply by a penalty coefficient $B$.
3. Add penalty terms to the objective function: $f(\vec{x}) + B \cdot (\text{constraint}_1)^2 + B \cdot (\text{constraint}_2)^2 + \cdots$
4. Choose $B$ large enough that violating any constraint always costs more than any feasible objective value.

### Computing Expectation Values in Qiskit

- States built with `Statevector` objects and tensor products (`^` operator).
- Hamiltonians built with `Pauli` and `PauliOp` objects or shorthand `(Z^Z^I) + (Z^I^Z)`.
- Expectation values computed via `psi.expectation_value(H)`.

## Key Takeaways

- Combinatorial optimization problems can be systematically recast as ground-state problems of Ising Hamiltonians or QUBO instances.
- The variational principle guarantees that the minimum energy is always achieved on a basis state, justifying optimization over all quantum states.
- The Ising and QUBO formalisms are interconvertible; the choice depends on convenience and the target quantum hardware.
- The penalty method is the standard technique for embedding constraints into unconstrained formulations.

## See Also

- [[QUBO]]
- [[Quantum Annealing]]
- [[QML Textbook — Ch. 2 Tools of the Trade]]
- [[QML Textbook — Ch. 4 Adiabatic QC and Quantum Annealing]]
- [[Quantum Gates]]
