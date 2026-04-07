---
title: QML Textbook — Ch. 1 Foundations of Quantum Computing
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, quantum-ML, textbook, qubits, quantum-gates]
sources: [QuantumMLTextbook.pdf]
---

# QML Textbook — Ch. 1: Foundations of Quantum Computing

**Book:** *A Practical Guide to Quantum Machine Learning and Quantum Optimization*
**Authors:** Elías F. Combarro, Samuel González-Castillo
**Publisher:** Packt Publishing, 2023
**ISBN:** 978-1-80461-383-2

## Overview

Chapter 1 introduces the quantum circuit model from scratch: qubits, quantum gates, measurements, entanglement, and universality. The treatment is hands-on — every concept connects to Qiskit/PennyLane code in Chapter 2. Prerequisites are only basic linear algebra and complex numbers.

## Key Concepts and Formulas

### 1.1 The Big Picture

Quantum computing exploits **superposition**, **entanglement**, and **interference** to accelerate certain computational tasks. Key algorithms: Shor's (factoring, exponential speedup), Grover's (search, quadratic speedup), HHL (linear systems). Current hardware is NISQ (noisy intermediate-scale quantum) — motivating variational/hybrid algorithms like QAOA, VQE, QSVMs, and QNNs.

### 1.2 The Quantum Circuit Model

Three elements: **qubits** (data), **quantum gates** (operations), **measurements** (output). Circuits read left to right; wires represent qubits; boxes represent gates; gauge symbols represent measurements. After measurement, the wire becomes classical (double line).

### 1.3 Working with One Qubit

**[[Qubit]] state:** A 2-dimensional complex vector satisfying normalization:

$$|\psi\rangle = a|0\rangle + b|1\rangle, \quad |a|^2 + |b|^2 = 1$$

where $|0\rangle = \begin{pmatrix}1\\0\end{pmatrix}$, $|1\rangle = \begin{pmatrix}0\\1\end{pmatrix}$ form the **computational basis**.

**Measurement:** Probabilistic — $P(\text{outcome } 0) = |a|^2$, $P(\text{outcome } 1) = |b|^2$. After measurement, the qubit **collapses** to the observed basis state.

**Dirac notation:** Kets $|v\rangle$ are column vectors; bras $\langle v|$ are conjugate-transpose row vectors. Inner product:

$$\langle\psi_1|\psi_2\rangle = a^*c + b^*d$$

where $|\psi_1\rangle = a|0\rangle + b|1\rangle$ and $|\psi_2\rangle = c|0\rangle + d|1\rangle$. The computational basis is orthonormal: $\langle 0|0\rangle = \langle 1|1\rangle = 1$, $\langle 0|1\rangle = \langle 1|0\rangle = 0$.

**[[Quantum Gates]]:** Unitary matrices $U$ satisfying $U^\dagger U = UU^\dagger = I$. Unitarity preserves normalization. For one qubit, gates are $2 \times 2$ unitary matrices.

Key single-qubit gates:

| Gate | Matrix | Action |
|---|---|---|
| $X$ (NOT) | $\begin{pmatrix}0&1\\1&0\end{pmatrix}$ | $\|0\rangle \leftrightarrow \|1\rangle$ |
| $Z$ | $\begin{pmatrix}1&0\\0&-1\end{pmatrix}$ | Phase flip: $\|1\rangle \to -\|1\rangle$ |
| $H$ (Hadamard) | $\frac{1}{\sqrt{2}}\begin{pmatrix}1&1\\1&-1\end{pmatrix}$ | Creates superposition |

**Schrödinger equation** (time-independent):

$$H|\psi(t)\rangle = i\hbar \frac{\partial}{\partial t}|\psi(t)\rangle$$

where $H$ is the Hamiltonian, $\hbar$ is the reduced Planck constant. Solutions are always unitary transformations — hence why quantum gates must be unitary.

### 1.4 Two Qubits and Entanglement

Two-qubit states live in $\mathbb{C}^4$ (tensor product $\mathbb{C}^2 \otimes \mathbb{C}^2$). The CNOT gate and entanglement (Bell states) are covered. The **no-cloning theorem** prohibits copying arbitrary quantum states.

### 1.5 Multiple Qubits and Universality

$n$-qubit states are vectors in $\mathbb{C}^{2^n}$. A set of gates is **universal** if any unitary can be approximated to arbitrary precision using gates from that set.

## Exercises from the Text

**Exercise 1.1:** For $|\psi\rangle = \sqrt{1/3}|0\rangle + \sqrt{2/3}|1\rangle$, $P(0) = 1/3$ and $P(1) = 2/3$.

**Exercise 1.3:** $X$ is unitary because $X^\dagger X = X^2 = I$. The inverse of $X$ is $X$ itself. On a general state: $X(a|0\rangle + b|1\rangle) = b|0\rangle + a|1\rangle$.

## See Also

- [[Qubit]]
- [[Quantum Gates]]
- [[Amplitude Amplification]]
- [[Q-Sample]]
- [[Quantum Rejection Sampling]]
- [[Bayesian Networks]]
