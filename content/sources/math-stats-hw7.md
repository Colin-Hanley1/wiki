---
title: "MATH 451∕551 - Homework 7"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [mathematical-statistics, homework, confidence-intervals, large-sample-inference, sample-size-determination, central-limit-theorem]
sources: [HW7_MATH451_551_Spring2026_v9.pdf]
---

# MATH 451∕551 — Homework 7

**Course:** MATH 451∕551 Mathematical Statistics
**Due:** March 14, 2026

## Key Topics

- Large-sample confidence intervals for proportions (Bernoulli mean)
- CLT-based inference for means and proportions
- Sample size determination for a desired margin of error
- Two-sample large-sample confidence intervals
- Shortest CI optimality via symmetric quantile choice for normal distributions
- Conservative sample size bound using $p(1-p) \leq 1/4$

## Important Results

**Large-sample CI for a proportion:**

$$\hat{p} \pm z_{\alpha/2} \sqrt{\frac{\hat{p}\hat{q}}{n}}$$

where $\hat{q} = 1 - \hat{p}$ and the approximation is justified by the Central Limit Theorem.

**Sample size for desired margin of error $E$:**

$$n = \frac{z_{\alpha/2}^2 \cdot \sigma^2}{E^2}$$

When $\sigma^2$ is unknown for a proportion, the conservative bound $p(1-p) \leq 1/4$ gives:

$$n = \frac{z_{\alpha/2}^2}{4E^2}$$

This guarantees the margin of error requirement regardless of the true $p$.

## Summary of Problems

- Constructing Wald-type confidence intervals for binomial proportions.
- Determining the minimum sample size to achieve a specified margin of error, using both estimated and conservative variance bounds.
- Two-sample large-sample intervals for the difference of two proportions or two means.
- Proving that the symmetric choice of quantiles yields the shortest confidence interval for a normal pivot.

## See Also

- [[Confidence Intervals]]
- [[Hypothesis Testing]]
- [[Maximum Likelihood Estimation]]
- [[Sufficient Statistics]]
- [[Method of Moments]]
