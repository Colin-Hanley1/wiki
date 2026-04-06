---
title: Bayesian Networks
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [probabilistic-graphical-models, machine-learning, inference, complexity-theory]
sources: [QuantumInferenceonBayesianNetworks.pdf]
---

# Bayesian Networks

A Bayesian network is a directed acyclic graph (DAG) that represents a joint probability distribution over $n$ variables. Each node stores a conditional probability table (CPT) for its variable given its parents.

## Factorization

The joint distribution factorizes as:

$$P(x_1, \ldots, x_n) = P(x_1) \prod_{i=2}^{n} P(x_i \mid \text{parents}(X_i))$$

This reduces storage from $\mathcal{O}(2^n)$ to $\mathcal{O}(n \cdot 2^m)$, where $m$ is the maximum number of parents (indegree) of any node.

## Inference

- **Exact inference** — computing $P(\mathcal{Q}|\mathcal{E}=e)$ — is \#P-hard in general (Source: [[Quantum Inference on Bayesian Networks]]).
- **Approximate inference** via rejection sampling takes $\mathcal{O}(nm \cdot P(e)^{-1})$ time classically, where $P(e)$ is the marginal probability of the evidence. This becomes expensive when evidence is unlikely.
- Quantum approaches achieve a square-root speedup: $\mathcal{O}(n \cdot 2^m \cdot P(e)^{-1/2})$ (Source: [[Quantum Inference on Bayesian Networks]]).

## Applications

Bayesian networks are used in system modeling, model learning, data analysis, decision making, and as the backbone of Partially Observable Markov Decision Processes (POMDPs).

## See Also

- [[Quantum Inference on Bayesian Networks]]
- [[Amplitude Amplification]]
- [[Q-Sample]]
- [[Quantum Rejection Sampling]]
