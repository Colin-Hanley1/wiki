---
title: Sufficient Statistics
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [mathematical-statistics, estimation, sufficient-statistics]
sources: [HW3.pdf, Solution_HW4.pdf]
---

# Sufficient Statistics

## Definition

A statistic $T = T(Y_1, \dots, Y_n)$ is **sufficient** for a parameter $\theta$ if the conditional distribution of the sample $Y_1, \dots, Y_n$ given $T$ does not depend on $\theta$. Intuitively, $T$ captures all the information in the sample about $\theta$; once $T$ is known, the remaining randomness is uninformative about $\theta$.

## Factorization Criterion (Theorem 9.4)

$T(\mathbf{Y})$ is sufficient for $\theta$ if and only if the likelihood can be factored as

$$L(\mathbf{y};\theta) = g\bigl(T(\mathbf{y}),\,\theta\bigr) \cdot h(\mathbf{y}),$$

where $g$ depends on the data only through $T$ and $h$ is free of $\theta$.

## Exponential Family

If the density belongs to the one-parameter exponential family,

$$f(y \mid \theta) = a(\theta)\,b(y)\,\exp\!\bigl[-c(\theta)\,d(y)\bigr],$$

then $\sum_{i=1}^{n} d(Y_i)$ is a sufficient statistic for $\theta$.

## Key Examples

| Distribution | Sufficient Statistic | Reasoning |
|---|---|---|
| Normal$(\mu, \sigma^2)$ ($\sigma^2$ known) | $\bar{Y}$ | Exponential family with $d(y)=y$ |
| Poisson$(\lambda)$ | $\sum Y_i$ | Exponential family with $d(y)=y$ |
| Uniform$(0, \theta)$ | $Y_{(n)}$ | $L = \theta^{-n}\,I(Y_{(n)} \le \theta)$; factorization with $g = \theta^{-n}\,I(Y_{(n)} \le \theta)$ |
| Shifted exponential $(\theta, \infty)$ | $Y_{(1)}$ | Likelihood involves $\exp\!\bigl[-(y_i - \theta)\bigr]$ with indicator $I(Y_{(1)} \ge \theta)$ |

## Connection to MLE

The MLE often depends on the data only through a sufficient statistic. This is not a coincidence: maximizing $L(\mathbf{y};\theta) = g(T,\theta)\cdot h(\mathbf{y})$ over $\theta$ is equivalent to maximizing $g(T,\theta)$, which depends on the data only through $T$.

## Connection to Efficient Information Encoding

There is a conceptual parallel with the [[Q-Sample]] framework in quantum computing: both sufficient statistics and quantum sampling address the problem of efficiently encoding probability distributions. A sufficient statistic compresses a classical sample into a lower-dimensional summary without losing information about the parameter, while quantum sampling explores how quantum states can encode distributional information.

## See Also

- [[Maximum Likelihood Estimation]]
- [[Bayesian Networks]]
