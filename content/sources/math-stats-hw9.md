---
title: "MATH 451/551 - Homework 9"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [mathematical-statistics, homework, hypothesis-testing, two-sample-t-test, f-test, p-value]
sources: [HW9_MATH451_551_Spring2026_v14_sol.pdf]
---

# MATH 451/551 — Homework 9

**Course:** MATH 451/551 Mathematical Statistics
**Due:** April 4, 2026

## Key Topics

- Two-sample $t$-tests for difference of means (small sample, pooled variance)
- P-value bounds from $t$-distribution tables
- $F$-test for equality of variances ($H_0: \sigma_1^2 = \sigma_2^2$)
- Duality between hypothesis tests and confidence intervals
- Assumptions: normality, independence, equal variances

## Important Results

**Two-sample $t$-test statistic:**

$$T = \frac{\bar{Y}_1 - \bar{Y}_2}{S_p \sqrt{\dfrac{1}{n_1} + \dfrac{1}{n_2}}}$$

with $n_1 + n_2 - 2$ degrees of freedom under $H_0: \mu_1 = \mu_2$.

**$F$-test for equal variances:**

$$F = \frac{S_1^2}{S_2^2}$$

Under $H_0: \sigma_1^2 = \sigma_2^2$, the statistic follows an $F(n_1 - 1, n_2 - 1)$ distribution.

**CI--test duality:** $H_0: \mu = \mu_0$ is rejected at level $\alpha$ if and only if $\mu_0$ falls outside the corresponding $(1-\alpha)$ confidence interval.

## Summary of Problems

- Conducting two-sample pooled $t$-tests and bounding the p-value using $t$-tables when exact computation is unavailable.
- Applying the $F$-test to assess the equal-variance assumption before performing a pooled $t$-procedure.
- Demonstrating the equivalence between rejecting a hypothesis at level $\alpha$ and the parameter value lying outside the $(1-\alpha)$ CI.
- Checking and discussing the normality, independence, and homoscedasticity assumptions required by these procedures.

## See Also

- [[Hypothesis Testing]]
- [[Confidence Intervals]]
- [[Maximum Likelihood Estimation]]
- [[Sufficient Statistics]]
- [[Method of Moments]]
