---
title: "QML Textbook — Ch. 5 QAOA"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, optimization, qaoa, variational]
sources: [qml_ch5]
---

# QML Textbook — Ch. 5 QAOA

**Source**: Combarro, E. F. & González-Castillo, S. (2023). *A Practical Guide to Quantum Machine Learning and Quantum Optimization*. Chapter 5: QAOA — Quantum Approximate Optimization Algorithm.

## Overview

Chapter 5 introduces the Quantum Approximate Optimization Algorithm ([[QAOA]]), a hybrid quantum-classical algorithm for approximately solving combinatorial optimization problems. QAOA is presented as a discretization of adiabatic quantum computing that can run on gate-based quantum hardware.

## Key Claims and Findings

- QAOA discretizes the continuous adiabatic evolution into $p$ layers, each parameterized by angles $\vec{\gamma} = (\gamma_1, \dots, \gamma_p)$ and $\vec{\beta} = (\beta_1, \dots, \beta_p)$.
- The algorithm prepares the parameterized state

$$
|\vec{\beta}, \vec{\gamma}\rangle = e^{i\beta_p H_0} e^{i\gamma_p H_1} \cdots e^{i\beta_1 H_0} e^{i\gamma_1 H_1} |\psi_0\rangle
$$

  where $H_0 = -\sum_j X_j$ is the mixer Hamiltonian and $H_1$ is the cost (Ising) Hamiltonian encoding the optimization problem.

- The ground state of $H_0$ is $|+\rangle^{\otimes n}$, prepared by Hadamard gates on all qubits.
- The mixer layer $e^{i\beta_k H_0}$ decomposes into single-qubit $R_X(2\beta_k)$ gates because the $X_j$ operators commute.
- The cost layer $e^{i\gamma_l H_1}$ decomposes into $R_Z$ rotations and CNOT-$R_Z$-CNOT gadgets for $Z_j Z_k$ interaction terms.
- Energy estimation is done by repeated measurement: $\langle \vec{\beta}, \vec{\gamma} \mid H_1 \mid \vec{\beta}, \vec{\gamma}\rangle \approx \sum_x (m_x / M) \langle x \mid H_1 \mid x \rangle$.
- When first introduced (Farhi et al., 2014), QAOA provided the best known polynomial-time approximation ratio for Max-Cut, though a classical algorithm soon matched it.
- QAOA can handle Higher Order Binary Optimization (HOBO/PUBO) problems directly, without reducing to QUBO, by generalizing the $ZZ$ circuit gadgets to multi-qubit $Z$ tensor products.
- Implementation details are provided for both Qiskit and PennyLane.

## Relevance

This chapter provides the circuit-level details needed to implement [[QAOA]] for combinatorial problems such as Max-Cut and SAT. It connects to [[Amplitude Amplification]] (Grover-based approaches in Ch. 6) and generalizes naturally to [[VQE]] (Ch. 7).

## See Also

- [[QAOA]]
- [[VQE]]
- [[Grover's Algorithm]]
- [[QML Textbook — Ch. 1 Foundations of Quantum Computing]]
