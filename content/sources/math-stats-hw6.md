---
title: "MATH 451/551 - Homework 6"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [mathematical-statistics, homework, confidence-intervals, two-sample-inference, pooled-t-test]
sources: [HW6_MATH451_551_Spring2026_v7.pdf]
---

# MATH 451/551 — Homework 6

**Course:** MATH 451/551 Mathematical Statistics
**Due:** March 7, 2026

## Key Topics

- Small-sample confidence intervals for a single mean using the $t$-distribution
- Two-sample confidence intervals for the difference of means (pooled $t$-procedure)
- Pooled sample variance $S_p^2$ and its role in two-sample inference
- Upper confidence bounds for the population standard deviation $\sigma$
- Assumptions: normality, equal variances, independence of samples

## Important Results

**Two-sample CI for difference of means:**

$$\bar{Y}_1 - \bar{Y}_2 \pm t_{\alpha/2} \, S_p \sqrt{\frac{1}{n_1} + \frac{1}{n_2}}$$

where $S_p^2 = \frac{(n_1 - 1)S_1^2 + (n_2 - 1)S_2^2}{n_1 + n_2 - 2}$ is the pooled sample variance with $n_1 + n_2 - 2$ degrees of freedom.

**Upper confidence bound for $\sigma$:**

$$\sigma \leq \sqrt{\frac{(n-1)S^2}{\chi^2_{1-\alpha}}}$$

derived from the chi-squared distribution of $(n-1)S^2/\sigma^2$ under normality.

## Summary of Problems

- Construction of small-sample $t$-intervals for a population mean with unknown variance.
- Derivation and application of pooled two-sample $t$-intervals under the equal-variance assumption.
- One-sided confidence bounds for $\sigma$ using the $\chi^2$ distribution.
- Verification of assumptions required for each procedure (normality, independence, homoscedasticity).

## See Also

- [[Confidence Intervals]]
- [[Hypothesis Testing]]
- [[Sufficient Statistics]]
- [[Maximum Likelihood Estimation]]
- [[Method of Moments]]
