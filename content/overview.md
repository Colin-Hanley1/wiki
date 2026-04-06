---
title: Overview
type: overview
updated: 2026-04-06
---

# Overview

This wiki covers topics in quantum computing, probabilistic inference, mathematical statistics, complex analysis, and deep learning.

## Current Focus

**Quantum speedups for probabilistic inference.** The foundational source is [[Quantum Inference on Bayesian Networks]] (Low, Yoder, Chuang 2014), which demonstrates that the graphical structure of [[Bayesian Networks]] can be exploited to build efficient quantum circuits for approximate inference. The core technique — [[Amplitude Amplification]] applied to a [[Q-Sample]] encoding of the joint distribution — yields a square-root improvement in sampling cost when evidence is rare. This is formalized as [[Quantum Rejection Sampling]].

**Mathematical statistics (MATH 451∕551).** A full semester of coursework covering the core pipeline of statistical inference:

1. **Estimation:** [[Method of Moments]] and [[Maximum Likelihood Estimation]] for point estimation. MLE's invariance property and connection to [[Sufficient Statistics]] via the factorization criterion.
2. **Estimator properties:** Bias, MSE, efficiency, consistency, and unbiasedness — criteria for comparing estimators.
3. **Interval estimation:** [[Confidence Intervals]] via pivotal quantities ($Z$, $t$, $\chi^2$, $F$), covering both small-sample (normal theory) and large-sample (CLT-based) settings. Sample size determination.
4. **Hypothesis testing:** [[Hypothesis Testing]] framework — null/alternative hypotheses, Type I/II errors, p-values, rejection regions. One-sample and two-sample $t$-tests, $F$-test for variances, binomial tests. Duality between CIs and hypothesis tests.

The probability foundations — [[Joint Probability Distribution]], [[Independence of Random Variables]] — underpin both the statistics coursework and the Bayesian network structure used in the quantum computing work.

**Applied stochastic processes (MATH 457∕557).** A full semester of coursework covering:

1. **Discrete-time [[Markov Chains]]:** Transition matrices, path probabilities, multi-step transitions, state classification (communication, irreducibility, periodicity).
2. **Equilibrium:** [[Stationary Distributions]] — existence/uniqueness for irreducible chains, long-run fractions, convergence conditions (irreducible + aperiodic + positive recurrent).
3. **[[Recurrence and Transience]]:** Hitting and return times, first-step analysis, chain decomposition into transient states and irreducible closed sets, absorption probabilities, fundamental matrix.
4. **Continuous-time:** [[Poisson Process]] — exponential inter-arrivals, memorylessness, merging, thinning, exponential races, queueing applications.

The stochastic processes material builds directly on the probability foundations from MATH 451∕551 ([[Independence of Random Variables]], [[Joint Probability Distribution]]). The Markov chain framework also connects to [[Bayesian Networks]] in the quantum computing work — both encode conditional independence structure.

**Complex analysis (MATH 485∕585).** Lecture notes from [[Lukas Bundrock]] at the [[University of Alabama]] covering the theory of functions of a complex variable:

1. **Foundations:** [[Complex Numbers]] as a field, arithmetic, absolute value, conjugate, polar form, de Moivre's formula.
2. **Functions and sequences:** Complex-valued functions decomposed into real/imaginary parts. Convergence, $\varepsilon$-$\delta$ limits, sequential characterization of continuity.
3. **Topology:** Open/closed sets, boundary, compactness in $\mathbb{C} \cong \mathbb{R}^2$.
4. **Differentiation:** [[Holomorphic Functions]] and the [[Cauchy-Riemann Equations]] — the tight constraint that makes complex differentiability far stronger than real differentiability.
5. **Integration:** [[Complex Integration]] via contours. [[Cauchy's Integral Theorem]] (holomorphic functions integrate to zero on closed contours) and Cauchy's integral formula.
6. **Series:** [[Power Series (Complex Analysis)|Power series]], Taylor and Laurent expansions — holomorphic functions are analytic.

The course emphasizes computation and worked examples over formal proof. Contour integration techniques connect to real analysis (evaluating improper integrals) and, more distantly, to the quantum computing work (path integrals, characteristic functions in probability).

**Deep learning architectures.** Two foundational papers:

1. **[[Attention Is All You Need]]** (Vaswani et al., 2017) introduced the [[Transformer]] — an encoder-decoder architecture built entirely on [[Self-Attention]] and [[Multi-Head Attention]], replacing recurrence and convolution. The Transformer is now the backbone of LLMs (GPT, BERT, LLaMA), vision models (ViT), and protein structure prediction (AlphaFold).
2. **[[Instant Neural Graphics Primitives with a Multiresolution Hash Encoding]]** (Müller et al., SIGGRAPH 2022) introduced trainable hash table encodings that reduce [[NeRF]] training from hours to seconds. The [[Multiresolution Hash Encoding]] replaces the Transformer's sinusoidal positional encoding with a spatially adaptive, learned alternative for neural rendering.

These connect to the quantum computing work via shared mathematical foundations: attention mechanisms are weighted sums (cf. [[Bayesian Networks]] marginalization), and the hash encoding's multiresolution structure parallels the multi-scale decompositions in signal processing.

## Open Questions

- Does a full quantum probability distribution function (qpdf) exist — one that is pure, q-sampleable, and q-stochastic? The [[Q-Sample]] satisfies the first two but not the third.
- Can similar square-root speedups be obtained for other sampling algorithms (Metropolis-Hastings, Gibbs sampling)?
- What are the practical implications for quantum machine learning, particularly reinforcement learning in quantum settings?
