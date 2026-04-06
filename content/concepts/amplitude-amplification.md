---
title: Amplitude Amplification
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, quantum-algorithms, grovers-algorithm]
sources: [QuantumInferenceonBayesianNetworks.pdf]
---

# Amplitude Amplification

A generalization of Grover's algorithm. Given a quantum circuit A that prepares a state |psi> = alpha|psi_t> + beta|psi_t_perp>, amplitude amplification rotates this state toward the target component |psi_t> using repeated applications of a Grover iterate G = -A S_0 A^dag S_e.

## Mechanism

- **S_e**: phase flip on states matching evidence e.
- **S_0**: phase flip on the initial state |0^n>.
- Each application of G rotates by angle theta ~ 2|alpha| in the target/non-target plane.
- After O(1/|alpha|) iterations, the target state is obtained with high probability.

When |alpha| is unknown, exponential search (applying G^{2^k} for k = 0, 1, 2, ...) achieves the same O(1/|alpha|) cost on average (Source: [[Quantum Inference on Bayesian Networks]]).

## Role in Quantum Bayesian Inference

Amplitude amplification is the source of the square-root speedup in [[Quantum Rejection Sampling]]. Applied to a [[Q-Sample]] of a [[Bayesian Networks|Bayesian network]], it boosts the probability of measuring the correct evidence from P(e) to O(1), at a cost of O(P(e)^{-1/2}) applications of the state-preparation circuit.

## See Also

- [[Quantum Rejection Sampling]]
- [[Q-Sample]]
- [[Bayesian Networks]]
- [[Quantum Inference on Bayesian Networks]]
