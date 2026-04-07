---
title: Qubit
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, qubits, quantum-information]
sources: [QuantumMLTextbook.pdf]
---

# Qubit

A **qubit** (quantum bit) is the fundamental unit of quantum information. Unlike a classical bit (0 or 1), a qubit can exist in a **superposition** of both states simultaneously.

## Mathematical Definition

A qubit state is a normalized vector in $\mathbb{C}^2$:

$$|\psi\rangle = a|0\rangle + b|1\rangle, \quad a, b \in \mathbb{C}, \quad |a|^2 + |b|^2 = 1$$

where $|0\rangle = \begin{pmatrix}1\\0\end{pmatrix}$ and $|1\rangle = \begin{pmatrix}0\\1\end{pmatrix}$ form the **computational basis**, and $a, b$ are called **amplitudes** (Source: [[QML Textbook — Ch. 1 Foundations of Quantum Computing]]).

## Measurement

Measuring a qubit in the computational basis yields a classical bit:

- Outcome $0$ with probability $|a|^2$
- Outcome $1$ with probability $|b|^2$

After measurement, the qubit **collapses** to the observed state — subsequent measurements give the same result. This is irreversible and destroys the superposition.

## Dirac Notation

| Symbol | Name | Meaning |
|---|---|---|
| $\|v\rangle$ | Ket | Column vector |
| $\langle v\|$ | Bra | Conjugate-transpose row vector ($\|v\rangle^\dagger$) |
| $\langle u\|v\rangle$ | Bra-ket | Inner product |
| $\|u\rangle\langle v\|$ | Outer product | Matrix |

**Inner product:** For $|\psi_1\rangle = a|0\rangle + b|1\rangle$ and $|\psi_2\rangle = c|0\rangle + d|1\rangle$:

$$\langle\psi_1|\psi_2\rangle = a^*c + b^*d$$

The computational basis is orthonormal: $\langle 0|0\rangle = \langle 1|1\rangle = 1$ and $\langle 0|1\rangle = \langle 1|0\rangle = 0$.

## Worked Examples

### Example 1: Measurement Probabilities

**Problem:** A qubit is in state $|\psi\rangle = \sqrt{1/3}\,|0\rangle + \sqrt{2/3}\,|1\rangle$. Find the probability of each measurement outcome.

**Solution:**

$$P(0) = \left|\sqrt{1/3}\right|^2 = \frac{1}{3}, \quad P(1) = \left|\sqrt{2/3}\right|^2 = \frac{2}{3}$$

Check: $1/3 + 2/3 = 1$ ✓

### Example 2: Inner Product Computation

**Problem:** Compute $\langle\psi_1|\psi_2\rangle$ where $|\psi_1\rangle = \frac{1}{\sqrt{2}}|0\rangle + \frac{1}{\sqrt{2}}|1\rangle$ and $|\psi_2\rangle = \frac{1}{\sqrt{2}}|0\rangle - \frac{1}{\sqrt{2}}|1\rangle$.

**Solution:**

$$\langle\psi_1|\psi_2\rangle = \frac{1}{\sqrt{2}} \cdot \frac{1}{\sqrt{2}} + \frac{1}{\sqrt{2}} \cdot \left(-\frac{1}{\sqrt{2}}\right) = \frac{1}{2} - \frac{1}{2} = 0$$

These two states are **orthogonal** — they form the Hadamard basis $\{|+\rangle, |-\rangle\}$.

## Multi-Qubit States

An $n$-qubit system lives in $\mathbb{C}^{2^n}$ (tensor product of $n$ copies of $\mathbb{C}^2$). The state space grows **exponentially** — this is the fundamental source of quantum computational power.

A two-qubit state that **cannot** be written as a tensor product $|\psi_1\rangle \otimes |\psi_2\rangle$ is called **entangled**. Example: the Bell state $\frac{1}{\sqrt{2}}(|00\rangle + |11\rangle)$.

## Connection to Existing Wiki Concepts

The qubit formalism connects to:
- [[Q-Sample]] — encodes classical probability distributions as quantum amplitudes ($\sqrt{p_i}$)
- [[Amplitude Amplification]] — manipulates qubit amplitudes to boost measurement probability of target states
- [[Complex Numbers]] — qubit amplitudes are complex numbers; $|a|^2 + |b|^2 = 1$ is the unit sphere in $\mathbb{C}^2$

## See Also

- [[Quantum Gates]]
- [[QML Textbook — Ch. 1 Foundations of Quantum Computing]]
- [[Q-Sample]]
- [[Amplitude Amplification]]
- [[Complex Numbers]]
