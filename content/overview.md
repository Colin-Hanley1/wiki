---
title: Overview
type: overview
updated: 2026-04-06
---

# Overview

This wiki covers topics in quantum computing, probabilistic inference, and mathematical statistics.

## Current Focus

**Quantum speedups for probabilistic inference.** The foundational source is [[Quantum Inference on Bayesian Networks]] (Low, Yoder, Chuang 2014), which demonstrates that the graphical structure of [[Bayesian Networks]] can be exploited to build efficient quantum circuits for approximate inference. The core technique — [[Amplitude Amplification]] applied to a [[Q-Sample]] encoding of the joint distribution — yields a square-root improvement in sampling cost when evidence is rare. This is formalized as [[Quantum Rejection Sampling]].

**Mathematical statistics fundamentals.** Coursework from MATH 451/551 covers core estimation and probability concepts. [[Method of Moments]] provides a general approach to point estimation. The foundations of [[Joint Probability Distribution]] and [[Independence of Random Variables]] underpin both classical statistics and the probabilistic models used in quantum inference.

## Open Questions

- Does a full quantum probability distribution function (qpdf) exist — one that is pure, q-sampleable, and q-stochastic? The [[Q-Sample]] satisfies the first two but not the third.
- Can similar square-root speedups be obtained for other sampling algorithms (Metropolis-Hastings, Gibbs sampling)?
- What are the practical implications for quantum machine learning, particularly reinforcement learning in quantum settings?
