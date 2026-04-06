---
title: "Quantum Inference on Bayesian Networks"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, bayesian-networks, approximate-inference, amplitude-amplification, complexity-theory]
sources: [QuantumInferenceonBayesianNetworks.pdf]
---

# Quantum Inference on Bayesian Networks

**Authors:** [[Guang Hao Low]], [[Theodore J. Yoder]], [[Isaac L. Chuang]]
**Affiliation:** [[MIT]]
**Date:** March 3, 2014
**arXiv:** 1402.7359 [quant-ph]

## Summary

This paper presents an unrelativized (no oracle) square-root quantum speedup for approximate inference on [[Bayesian Networks]]. The authors construct explicit quantum circuits that sample from the conditional distribution $P(\mathcal{Q}|\mathcal{E}=e)$ in time $\mathcal{O}(n \cdot 2^m \cdot P(e)^{-1/2})$, compared to the classical $\mathcal{O}(nm \cdot P(e)^{-1})$, where $n$ is the number of nodes and $m$ is the maximum indegree.

## Key Claims and Findings

- **Exact inference** on Bayesian networks is \#P-hard; even approximate inference by sampling is NP-hard in general.
- Classical rejection sampling on a Bayes net with $n$ nodes and max indegree $m$ takes $\mathcal{O}(nm \cdot P(e)^{-1})$ time per sample, bottlenecked by the marginal probability of the evidence $P(e)$.
- The authors implement **[[Quantum Rejection Sampling]]** by:
  1. Encoding the joint distribution as a quantum state (a **[[Q-Sample]]**), where measurement yields a classical sample.
  2. Applying **[[Amplitude Amplification]]** to boost the amplitude of states matching the evidence, yielding a square-root improvement in the dependence on $P(e)$.
- The Bayesian network's DAG structure allows efficient circuit construction: the state-preparation operator decomposes into $n$ uniformly controlled rotations, each acting on at most $m$ control qubits, giving circuit complexity $\mathcal{O}(n \cdot 2^m)$ — linear in $n$ for bounded $m$.
- The speedup is **unrelativized**: they count primitive gates (CNOTs + single-qubit rotations) rather than oracle queries, unlike the prior oracle-relative result of Ozols, Roetteler, and Roland (2012).

## Conceptual Contributions

- **Quantum probability distribution function (qpdf):** A proposed formalization with three properties — purity, q-sampling, and q-stochasticity. The q-sample satisfies the first two but not q-stochasticity (stochastic matrices cannot always be lifted to unitaries on q-samples). Whether a full qpdf exists is left open.
- The analogy: quantum states are to probability distributions as measurement is to sampling and unitaries are to stochastic updates.

## Circuit Constructions

| Operator | Complexity | Notes |
|----------|-----------|-------|
| General q-sample prep $\hat{A}_P$ | $\mathcal{O}(2^n)$ | Exponential — expected |
| Bayesian q-sample prep $\hat{A}_\mathcal{B}$ | $\mathcal{O}(n \cdot 2^m)$ | Exploits graph structure |
| Phase flip $\hat{S}_0$ | $\mathcal{O}(n)$ | With $\mathcal{O}(n)$ ancillas |
| Phase flip $\hat{S}_e$ | $\mathcal{O}(|\mathcal{E}|)$ | With $\mathcal{O}(|\mathcal{E}|)$ ancillas |

Total time per sample: $\mathcal{O}(n \cdot 2^m \cdot P(e)^{-1/2})$.

## Future Directions Noted

- Square-root speedups for Metropolis-Hastings, Gibbs sampling, and Bayesian learning via similar amplitude amplification techniques.
- Quantum reinforcement learning — exploration/exploitation tradeoffs in quantum settings.
- Adaptive quantum error correcting codes as a form of implicit learning.
- Proof-of-principle experiment: inference on a two-node Bayes net requires only two qubits (ion trap feasible).

## See Also

- [[Bayesian Networks]]
- [[Amplitude Amplification]]
- [[Q-Sample]]
- [[Quantum Rejection Sampling]]
- [[Guang Hao Low]]
- [[Theodore J. Yoder]]
- [[Isaac L. Chuang]]
- [[MIT]]
