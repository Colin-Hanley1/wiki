---
title: "QML Textbook — Ch. 6 Grover Adaptive Search"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, optimization, grovers-algorithm, grover-adaptive-search]
sources: [qml_ch6]
---

# QML Textbook — Ch. 6 Grover Adaptive Search

**Source**: Combarro, E. F. & González-Castillo, S. (2023). *A Practical Guide to Quantum Machine Learning and Quantum Optimization*. Chapter 6: GAS — Grover Adaptive Search.

## Overview

Chapter 6 covers [[Grover's Algorithm]] and its adaptation to combinatorial optimization via the Durr-Hoyer method, collectively called Grover Adaptive Search (GAS). Unlike [[QAOA]] and [[VQE]], GAS is not a NISQ algorithm — it requires fault-tolerant quantum hardware to realize its full potential.

## Key Claims and Findings

- **Grover's algorithm** searches an unsorted collection of $N = 2^n$ elements for those satisfying a Boolean function $f$, using only $O(\sqrt{N})$ oracle calls versus $O(N)$ classically.
- A **quantum oracle** $O_f$ acts as $O_f |x\rangle |y\rangle = |x\rangle |y \oplus f(x)\rangle$. This is reversible and unitary.
- The **phase kickback** trick uses an ancilla in state $|{-}\rangle$ to convert $O_f$ into a phase oracle: $O_f$ maps $|x\rangle |{-}\rangle \to (-1)^{f(x)} |x\rangle |{-}\rangle$.
- **Grover's diffusion operator** implements inversion about the mean, amplifying marked-state amplitudes ([[Amplitude Amplification]]).
- The state after $m$ Grover iterations (single marked element) is $\cos((2m+1)\theta)|x_0\rangle + \sin((2m+1)\theta)|x_1\rangle$, where $\sin\theta = 1/\sqrt{N}$.
- The optimal iteration count is $m = \lfloor (\pi/4)\sqrt{N/k} \rfloor$ for $k$ marked elements (when $k \ll N$).
- Overshooting iterations causes the success probability to oscillate back toward zero.
- The **Durr-Hoyer algorithm** adapts Grover search to find function minima: repeatedly search for elements with cost lower than the current best, updating the oracle threshold each round.
- **Quantum oracles for QUBO/HOBO** use the Quantum Fourier Transform (QFT) to perform arithmetic in phase encoding, enabling efficient evaluation of polynomial cost functions.
- Two's complement representation is used for encoding signed integers in oracle registers.
- Implementation is demonstrated using Qiskit's GAS module.

## Relevance

GAS provides a provable quadratic speedup for brute-force optimization but requires fault-tolerant hardware. It serves as a benchmark for comparing NISQ algorithms like [[QAOA]] and [[VQE]].

## See Also

- [[Grover's Algorithm]]
- [[Amplitude Amplification]]
- [[QAOA]]
- [[VQE]]
- [[QML Textbook — Ch. 1 Foundations of Quantum Computing]]
