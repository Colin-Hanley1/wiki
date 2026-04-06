---
title: "MATH 451/551 - Homework 2"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [mathematical-statistics, homework, maximum-likelihood-estimation, likelihood-function, bias, MSE, efficiency, invariance-property]
sources: [Solution_HW2_MATH451_551_Spring2026_v2.pdf]
---

# MATH 451/551 — Homework 2

**Course:** MATH 451/551 Mathematical Statistics, Spring 2026
**Due:** January 31, 2026

## Key Topics

- [[Maximum Likelihood Estimation]] for standard distributions (uniform, Poisson, geometric, exponential)
- Likelihood functions and log-likelihood maximization
- Invariance property of MLE
- Bias $B(\hat{\theta})$, mean squared error (MSE), and unbiased estimators
- Relative efficiency of estimators
- Sum of deviations identities

## Summary of Important Problems and Results

### MLE Derivations

- **Uniform$(0, 2\theta)$:** The MLE is $\hat{\theta} = \max\{Y_i\}/2 = Y_{(n)}/2$. The likelihood is maximized by choosing the smallest $\theta$ consistent with the data, yielding an order-statistic-based estimator.
- **Poisson$(\lambda)$:** The MLE is $\hat{\lambda} = \bar{Y}$, derived by differentiating the log-likelihood and solving the score equation.
- **Geometric and Exponential:** Similar score-equation approaches produce closed-form MLEs tied to sample means or sufficient statistics.

### Invariance Property

If $\hat{\theta}$ is the MLE of $\theta$, then the MLE of any function $g(\theta)$ is $g(\hat{\theta})$. This is applied to derive MLEs of transformed parameters without re-optimizing the likelihood.

### Bias and MSE

- Bias of an estimator: $B(\hat{\theta}) = E[\hat{\theta}] - \theta$.
- If $E[\hat{\theta}] = a\theta + b$, then the bias-corrected estimator is $\hat{\theta}^* = (\hat{\theta} - b)/a$, which is unbiased.
- MSE decomposes as $\text{MSE}(\hat{\theta}) = V(\hat{\theta}) + [B(\hat{\theta})]^2$.
- Relative efficiency compares two estimators via the ratio of their MSEs.

### Sum of Deviations Identities

Algebraic identities relating $\sum(Y_i - c)^2$ to $\sum(Y_i - \bar{Y})^2 + n(\bar{Y} - c)^2$ are used to simplify variance and MSE calculations.

## See Also

- [[Maximum Likelihood Estimation]]
- [[Sufficient Statistics]]
- [[Method of Moments]]
- [[math-stats-hw3]]
