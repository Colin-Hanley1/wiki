---
title: Overview
type: overview
updated: 2026-04-06
---

# Overview

This wiki covers topics in quantum computing, probabilistic inference, and mathematical statistics.

## Current Focus

**Quantum speedups for probabilistic inference.** The foundational source is [[Quantum Inference on Bayesian Networks]] (Low, Yoder, Chuang 2014), which demonstrates that the graphical structure of [[Bayesian Networks]] can be exploited to build efficient quantum circuits for approximate inference. The core technique — [[Amplitude Amplification]] applied to a [[Q-Sample]] encoding of the joint distribution — yields a square-root improvement in sampling cost when evidence is rare. This is formalized as [[Quantum Rejection Sampling]].

**Mathematical statistics (MATH 451/551).** A full semester of coursework covering the core pipeline of statistical inference:

1. **Estimation:** [[Method of Moments]] and [[Maximum Likelihood Estimation]] for point estimation. MLE's invariance property and connection to [[Sufficient Statistics]] via the factorization criterion.
2. **Estimator properties:** Bias, MSE, efficiency, consistency, and unbiasedness — criteria for comparing estimators.
3. **Interval estimation:** [[Confidence Intervals]] via pivotal quantities ($Z$, $t$, $\chi^2$, $F$), covering both small-sample (normal theory) and large-sample (CLT-based) settings. Sample size determination.
4. **Hypothesis testing:** [[Hypothesis Testing]] framework — null/alternative hypotheses, Type I/II errors, p-values, rejection regions. One-sample and two-sample $t$-tests, $F$-test for variances, binomial tests. Duality between CIs and hypothesis tests.

The probability foundations — [[Joint Probability Distribution]], [[Independence of Random Variables]] — underpin both the statistics coursework and the Bayesian network structure used in the quantum computing work.

## Open Questions

- Does a full quantum probability distribution function (qpdf) exist — one that is pure, q-sampleable, and q-stochastic? The [[Q-Sample]] satisfies the first two but not the third.
- Can similar square-root speedups be obtained for other sampling algorithms (Metropolis-Hastings, Gibbs sampling)?
- What are the practical implications for quantum machine learning, particularly reinforcement learning in quantum settings?
