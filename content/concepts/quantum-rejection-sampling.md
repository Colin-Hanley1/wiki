---
title: Quantum Rejection Sampling
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, quantum-algorithms, sampling, inference]
sources: [QuantumInferenceonBayesianNetworks.pdf]
---

# Quantum Rejection Sampling

A quantum algorithm for approximate inference that achieves a square-root speedup over classical rejection sampling. Originally proposed by Ozols, Roetteler, and Roland (2012) in an oracle-relative setting; made unrelativized for [[Bayesian Networks]] by Low, Yoder, and Chuang (2014).

## Algorithm

1. Prepare the [[Q-Sample]] |psi_P> encoding the joint distribution P(Q, E).
2. Decompose: |psi_P> = sqrt(P(e))|Q>|e> + sqrt(1-P(e))|Q_bar, e_bar>.
3. Apply [[Amplitude Amplification]] with exponential search (G^{2^k} for k = 0, 1, ...) to boost the evidence-matching component.
4. Measure evidence qubits; if E = e, measure query qubits to obtain a sample from P(Q|E=e).

## Complexity

- **Classical rejection sampling:** O(nm P(e)^{-1}) per sample.
- **Quantum rejection sampling on a Bayes net:** O(n 2^m P(e)^{-1/2}) per sample.

The improvement in P(e) dependence from inverse to inverse-square-root is the core speedup, and it matters most when evidence is rare (P(e) exponentially small in |E|).

## See Also

- [[Amplitude Amplification]]
- [[Q-Sample]]
- [[Bayesian Networks]]
- [[Quantum Inference on Bayesian Networks]]
