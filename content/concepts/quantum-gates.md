---
title: Quantum Gates
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, quantum-gates, unitary-matrices]
sources: [QuantumMLTextbook.pdf]
---

# Quantum Gates

**Quantum gates** are the operations used to manipulate [[Qubit|qubits]] in the quantum circuit model. Mathematically, they are **unitary matrices**: $U^\dagger U = UU^\dagger = I$.

## Why Unitary?

The evolution of a quantum system follows the Schrödinger equation, whose solutions are always unitary transformations. Unitarity ensures:

1. **Normalization is preserved:** If $|\psi\rangle$ is a valid state ($\||\psi\rangle\| = 1$), then $U|\psi\rangle$ is also valid.
2. **Reversibility:** Every gate $U$ has inverse $U^\dagger$. Quantum computation is inherently reversible (unlike classical gates like AND/OR).

## Common Single-Qubit Gates

| Gate | Matrix | Action | Notes |
|---|---|---|---|
| $I$ | $\begin{pmatrix}1&0\\0&1\end{pmatrix}$ | Identity | Does nothing |
| $X$ | $\begin{pmatrix}0&1\\1&0\end{pmatrix}$ | Bit flip: $\|0\rangle \leftrightarrow \|1\rangle$ | Quantum NOT gate |
| $Y$ | $\begin{pmatrix}0&-i\\i&0\end{pmatrix}$ | $\|0\rangle \to i\|1\rangle$, $\|1\rangle \to -i\|0\rangle$ | Combines bit + phase flip |
| $Z$ | $\begin{pmatrix}1&0\\0&-1\end{pmatrix}$ | Phase flip: $\|1\rangle \to -\|1\rangle$ | Leaves $\|0\rangle$ unchanged |
| $H$ | $\frac{1}{\sqrt{2}}\begin{pmatrix}1&1\\1&-1\end{pmatrix}$ | Creates superposition | $H\|0\rangle = \|+\rangle$, $H\|1\rangle = \|-\rangle$ |

The gates $X$, $Y$, $Z$ are the **Pauli matrices** — they are Hermitian ($U = U^\dagger$), unitary, and involutory ($U^2 = I$).

## Worked Examples

### Example 1: Verifying Unitarity of $X$

**Problem:** Show that $X = \begin{pmatrix}0&1\\1&0\end{pmatrix}$ is unitary.

**Solution:** Compute $X^\dagger = X^T = X$ (since $X$ is real and symmetric). Then:

$$X^\dagger X = X^2 = \begin{pmatrix}0&1\\1&0\end{pmatrix}\begin{pmatrix}0&1\\1&0\end{pmatrix} = \begin{pmatrix}1&0\\0&1\end{pmatrix} = I \checkmark$$

So $X$ is its own inverse: $X^{-1} = X$.

### Example 2: Hadamard Gate Creates Superposition

**Problem:** Apply $H$ to $|0\rangle$ and $|1\rangle$.

**Solution:**

$$H|0\rangle = \frac{1}{\sqrt{2}}\begin{pmatrix}1&1\\1&-1\end{pmatrix}\begin{pmatrix}1\\0\end{pmatrix} = \frac{1}{\sqrt{2}}\begin{pmatrix}1\\1\end{pmatrix} = \frac{1}{\sqrt{2}}(|0\rangle + |1\rangle) = |+\rangle$$

$$H|1\rangle = \frac{1}{\sqrt{2}}\begin{pmatrix}1&1\\1&-1\end{pmatrix}\begin{pmatrix}0\\1\end{pmatrix} = \frac{1}{\sqrt{2}}\begin{pmatrix}1\\-1\end{pmatrix} = \frac{1}{\sqrt{2}}(|0\rangle - |1\rangle) = |-\rangle$$

Measuring $|+\rangle$ gives $0$ or $1$ each with probability $1/2$ — the qubit is in an equal superposition.

### Example 3: Action of $X$ on a General State

**Problem:** What does $X$ do to $|\psi\rangle = a|0\rangle + b|1\rangle$?

**Solution:**

$$X(a|0\rangle + b|1\rangle) = a \cdot X|0\rangle + b \cdot X|1\rangle = a|1\rangle + b|0\rangle = b|0\rangle + a|1\rangle$$

The amplitudes are swapped — this is the quantum analogue of a NOT gate.

(Source: [[QML Textbook — Ch. 1 Foundations of Quantum Computing]])

## Multi-Qubit Gates

- **CNOT (Controlled-NOT):** Flips the target qubit if the control qubit is $|1\rangle$. Essential for creating entanglement.
- **Toffoli (CCNOT):** Universal for classical reversible computation.
- A gate set is **universal** if any unitary can be approximated to arbitrary precision using gates from that set. Example: $\{H, T, \text{CNOT}\}$.

## See Also

- [[Qubit]]
- [[QML Textbook — Ch. 1 Foundations of Quantum Computing]]
- [[Amplitude Amplification]] — uses Grover's iterate, built from reflections (quantum gates)
- [[Complex Numbers]] — gate matrices have complex entries
