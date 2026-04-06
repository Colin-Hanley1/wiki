---
title: "MATH 451∕551 - Homework 3"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [mathematical-statistics, homework, maximum-likelihood-estimation, consistency, order-statistics, sufficient-statistics, relative-efficiency]
sources: [HW3_MATH451_551_Spring2026_v7_solutions.pdf]
---

# MATH 451∕551 — Homework 3

**Course:** MATH 451∕551 Mathematical Statistics, Spring 2026
**Due:** February 7, 2026

## Key Topics

- [[Maximum Likelihood Estimation]] via monotone likelihood (Pareto-type distributions)
- Order statistics and their distributional properties
- Consistency of estimators
- Relative efficiency comparisons
- [[Sufficient Statistics]] via conditioning (exponential/Gamma)

## Summary of Important Problems and Results

### MLE via Monotone Likelihood

For distributions where the likelihood is monotone in the parameter (e.g., Pareto-type), the MLE is found at the boundary of the parameter space rather than by solving a score equation. This typically yields an order statistic as the MLE.

### Order Statistics Variance

For the maximum order statistic $Y_{(n)}$ from a suitable distribution:

$$V(Y_{(n)}) = \frac{n}{(n+2)(n+1)^2}$$

This result is derived using the Beta-distribution representation of order statistics and standard moment formulas.

### Consistency

- An estimator $\hat{\theta}_n$ is consistent if $\hat{\theta}_n \xrightarrow{p} \theta$ as $n \to \infty$.
- **Beta distribution example:** Demonstrates consistency by showing bias $\to 0$ and variance $\to 0$.
- **$Y_{(1)}$ is not consistent** in certain settings — the minimum order statistic can converge to a boundary value rather than the target parameter.

### Sufficient Statistics via Conditioning

$\bar{Y}$ is shown to be sufficient for $\theta$ in the exponential distribution by verifying that the conditional distribution of the sample given $\bar{Y}$ does not depend on $\theta$. The proof uses the fact that $n\bar{Y} \sim \text{Gamma}(n, \theta)$ and applies the conditioning argument directly.

## See Also

- [[Maximum Likelihood Estimation]]
- [[Sufficient Statistics]]
- [[Joint Probability Distribution]]
- [[math-stats-hw2]]
- [[math-stats-hw4]]
