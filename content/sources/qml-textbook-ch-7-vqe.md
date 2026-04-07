---
title: "QML Textbook — Ch. 7 VQE"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, optimization, vqe, variational, quantum-chemistry]
sources: [qml_ch7]
---

# QML Textbook — Ch. 7 VQE

**Source**: Combarro, E. F. & González-Castillo, S. (2023). *A Practical Guide to Quantum Machine Learning and Quantum Optimization*. Chapter 7: VQE — Variational Quantum Eigensolver.

## Overview

Chapter 7 introduces the Variational Quantum Eigensolver ([[VQE]]), a generalization of [[QAOA]] for finding the ground state of an arbitrary Hamiltonian. VQE is especially relevant for quantum chemistry, where Hamiltonians describe molecular electronic structure and are not restricted to diagonal (Ising) form.

## Key Claims and Findings

- VQE was introduced by Peruzzo et al. (2014), predating QAOA. QAOA is a special case of VQE with a specific ansatz structure.
- The **variational principle** guarantees $\langle \psi(\vec{\theta}) \mid H \mid \psi(\vec{\theta}) \rangle \geq E_0$ for all $\vec{\theta}$, where $E_0$ is the true ground state energy.
- VQE requires the Hamiltonian $H$ to be expressed as a linear combination of tensor products of Pauli matrices, enabling expectation-value estimation via measurements in different bases.
- The **ansatz** (variational form) $V(\vec{\theta})$ is a parameterized circuit chosen with domain knowledge. The trial state is $|\psi(\vec{\theta})\rangle = V(\vec{\theta})|0\rangle$.
- Expectation values of non-diagonal Pauli terms (e.g., $X \otimes Z$) are estimated by changing measurement basis: apply $H$ (Hadamard) before measuring qubits where $X$ appears, and $R_X(\pi/2)$ where $Y$ appears.
- A classical optimizer updates $\vec{\theta}$ to minimize the estimated energy, forming a quantum-classical feedback loop.
- **Excited states** can be found via the deflation method: modify $H' = H + C|\psi_0\rangle\langle\psi_0|$ to penalize overlap with the known ground state, then re-run VQE.
- Applications demonstrated include molecular ground-state energy computation (e.g., $\text{H}_2$ molecule) using Qiskit and PennyLane.
- VQE is more robust to noise than Quantum Phase Estimation (QPE), making it better suited to NISQ hardware.

## Relevance

VQE extends the wiki's coverage of variational quantum algorithms beyond combinatorial optimization into quantum chemistry and physics. It generalizes [[QAOA]] and contrasts with [[Grover's Algorithm]] (fault-tolerant approach).

## See Also

- [[VQE]]
- [[QAOA]]
- [[Grover's Algorithm]]
- [[Quantum Gates]]
- [[QML Textbook — Ch. 1 Foundations of Quantum Computing]]
