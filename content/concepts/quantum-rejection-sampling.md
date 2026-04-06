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

1. Prepare the [[Q-Sample]] $|\psi_P\rangle$ encoding the joint distribution $P(\mathcal{Q}, \mathcal{E})$.
2. Decompose: $|\psi_P\rangle = \sqrt{P(e)}\,|\mathcal{Q}\rangle|e\rangle + \sqrt{1 - P(e)}\,|\overline{\mathcal{Q}, e}\rangle$.
3. Apply [[Amplitude Amplification]] with exponential search ($\hat{G}^{2^k}$ for $k = 0, 1, \ldots$) to boost the evidence-matching component.
4. Measure evidence qubits; if $\mathcal{E} = e$, measure query qubits to obtain a sample from $P(\mathcal{Q}|\mathcal{E}=e)$.

## Complexity

- **Classical rejection sampling:** $\mathcal{O}(nm \cdot P(e)^{-1})$ per sample.
- **Quantum rejection sampling on a Bayes net:** $\mathcal{O}(n \cdot 2^m \cdot P(e)^{-1/2})$ per sample.

The improvement in $P(e)$ dependence from inverse to inverse-square-root is the core speedup, and it matters most when evidence is rare ($P(e)$ exponentially small in $|\mathcal{E}|$).

## See Also

- [[Amplitude Amplification]]
- [[Q-Sample]]
- [[Bayesian Networks]]
- [[Quantum Inference on Bayesian Networks]]
