---
title: Q-Sample
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, probability, quantum-states]
sources: [QuantumInferenceonBayesianNetworks.pdf]
---

# Q-Sample

The q-sample of a joint distribution P(x_1, ..., x_n) over n binary variables is the n-qubit pure state:

|psi_P> = sum_{x_1,...,x_n} sqrt(P(x_1,...,x_n)) |x_1 ... x_n>

Measuring all qubits yields a classical sample from P. Measuring a subset of qubits yields a sample from the corresponding marginal distribution.

## Properties

The q-sample satisfies two of the three properties proposed for a quantum probability distribution function (qpdf):

1. **Purity** — it is a pure state.
2. **Q-sampling** — measurement produces classical samples, including from marginals.
3. **Q-stochasticity** — NOT satisfied. Not every classical stochastic matrix can be lifted to a unitary acting on q-samples. This is shown by a single-qubit counterexample (Source: [[Quantum Inference on Bayesian Networks]]).

Whether a representation satisfying all three properties exists is an open question.

## Efficient Preparation on Bayesian Networks

For a general distribution, preparing the q-sample requires O(2^n) gates. For a [[Bayesian Networks|Bayesian network]] with max indegree m, the graph structure allows preparation in O(n 2^m) gates — each node's conditional probability table maps to a uniformly controlled rotation on at most m control qubits.

## See Also

- [[Amplitude Amplification]]
- [[Quantum Rejection Sampling]]
- [[Bayesian Networks]]
- [[Quantum Inference on Bayesian Networks]]
