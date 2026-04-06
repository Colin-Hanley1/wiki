---
title: Amplitude Amplification
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, quantum-algorithms, grovers-algorithm]
sources: [QuantumInferenceonBayesianNetworks.pdf]
---

# Amplitude Amplification

A generalization of Grover's algorithm. Given a quantum circuit $\hat{A}$ that prepares a state $|\psi\rangle = \alpha|\psi_t\rangle + \beta|\bar{\psi}_t\rangle$, amplitude amplification rotates this state toward the target component $|\psi_t\rangle$ using repeated applications of a Grover iterate $\hat{G} = -\hat{A}\hat{S}_0\hat{A}^\dagger\hat{S}_e$.

## Mechanism

- $\hat{S}_e$: phase flip on states matching evidence $e$.
- $\hat{S}_0$: phase flip on the initial state $|0^n\rangle$.
- Each application of $\hat{G}$ rotates by angle $\theta \approx 2|\alpha|$ in the target/non-target plane.
- After $\mathcal{O}(1/|\alpha|)$ iterations, the target state is obtained with high probability.

When $|\alpha|$ is unknown, exponential search (applying $\hat{G}^{2^k}$ for $k = 0, 1, 2, \ldots$) achieves the same $\mathcal{O}(1/|\alpha|)$ cost on average (Source: [[Quantum Inference on Bayesian Networks]]).

## Role in Quantum Bayesian Inference

Amplitude amplification is the source of the square-root speedup in [[Quantum Rejection Sampling]]. Applied to a [[Q-Sample]] of a [[Bayesian Networks|Bayesian network]], it boosts the probability of measuring the correct evidence from $P(e)$ to $\mathcal{O}(1)$, at a cost of $\mathcal{O}(P(e)^{-1/2})$ applications of the state-preparation circuit.

## See Also

- [[Quantum Rejection Sampling]]
- [[Q-Sample]]
- [[Bayesian Networks]]
- [[Quantum Inference on Bayesian Networks]]
