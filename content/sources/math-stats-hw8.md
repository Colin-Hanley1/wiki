---
title: "MATH 451∕551 - Homework 8"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [mathematical-statistics, homework, hypothesis-testing, type-I-error, type-II-error, p-value, t-test]
sources: [HW8_MATH451_551_Spring2026_sol_v8.pdf]
---

# MATH 451∕551 — Homework 8

**Course:** MATH 451∕551 Mathematical Statistics
**Due:** March 28, 2026

## Key Topics

- Hypothesis testing framework: null hypothesis $H_0$, alternative $H_a$, and rejection regions
- Type I and Type II errors
- P-values and their interpretation
- Binomial test for population proportions
- Small-sample $t$-tests for means
- Duality between confidence intervals and hypothesis tests
- Proof that the pooled sample variance $S_p^2$ is unbiased for $\sigma^2$

## Important Results

**Error types:**

$$\alpha = P(\text{reject } H_0 \mid H_0 \text{ true}) \quad \text{(Type I error)}$$

$$\beta = P(\text{fail to reject } H_0 \mid H_a \text{ true}) \quad \text{(Type II error)}$$

**P-value:** The smallest significance level $\alpha$ at which the observed data leads to rejection of $H_0$. Equivalently, the probability under $H_0$ of observing a test statistic as extreme or more extreme than the one computed.

**Unbiasedness of pooled variance:** $E[S_p^2] = \sigma^2$ when both populations share a common variance $\sigma^2$.

## Summary of Problems

- Setting up rejection regions for one-sided and two-sided tests of a population mean.
- Computing Type I and Type II error probabilities for given rejection rules.
- Exact binomial tests for proportions with discrete p-value calculation.
- Small-sample $t$-tests and their connection to $t$-based confidence intervals.
- Formal proof that the pooled estimator $S_p^2$ is unbiased for $\sigma^2$ under the equal-variance assumption.

## See Also

- [[Hypothesis Testing]]
- [[Confidence Intervals]]
- [[Maximum Likelihood Estimation]]
- [[Sufficient Statistics]]
- [[Method of Moments]]
