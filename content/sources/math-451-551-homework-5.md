---
title: "MATH 451∕551 - Homework 5"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [mathematical-statistics, homework, confidence-intervals, pivotal-quantities, chi-squared-distribution, t-distribution]
sources: [Solution_HW5_MATH451_551_Spring2026_v7.pdf]
---

# MATH 451∕551 — Homework 5

**Course:** MATH 451∕551 Mathematical Statistics, Spring 2026
**Due:** February 28, 2026

## Key Topics

- [[Confidence Intervals]] via pivotal quantities
- $\chi^2$ distribution for variance confidence intervals
- $t$-distribution for mean confidence intervals (small samples)
- Normal pivotal quantity for known $\sigma$
- Order statistics CDF for uniform distribution CIs
- One-sided vs two-sided confidence intervals
- Shortest confidence interval problem

## Summary of Important Problems and Results

### Pivotal Quantity Method

A pivotal quantity $Q(Y_1, \dots, Y_n, \theta)$ has a distribution that does not depend on $\theta$. Inverting the probability statement $P(a \le Q \le b) = 1 - \alpha$ yields a confidence interval for $\theta$.

### Normal Mean with Known $\sigma$

The pivotal quantity $Z = \frac{\bar{Y} - \mu}{\sigma / \sqrt{n}}$ has a standard normal distribution, giving the 95% CI:

$$\bar{Y} \pm 1.96 \frac{\sigma}{\sqrt{n}}$$

### Normal Mean with Unknown $\sigma$ (Small Sample)

Using $T = \frac{\bar{Y} - \mu}{S / \sqrt{n}} \sim t_{n-1}$, the CI becomes:

$$\bar{Y} \pm t_{\alpha/2,\, n-1} \frac{S}{\sqrt{n}}$$

### Variance CI via $\chi^2$

The pivotal quantity $(n-1)S^2 / \sigma^2 \sim \chi^2_{n-1}$ yields:

$$\left(\frac{(n-1)S^2}{\chi^2_{\alpha/2,\, n-1}},\; \frac{(n-1)S^2}{\chi^2_{1-\alpha/2,\, n-1}}\right)$$

Note that this interval is not symmetric around $S^2$ because the $\chi^2$ distribution is skewed.

### Uniform Distribution CI via Order Statistics

For Uniform$(0, \theta)$, the CDF of $Y_{(n)}$ provides a pivotal quantity. The lower confidence bound at the 95% level is:

$$\hat{\theta}_L = \frac{Y_{(n)}}{0.95^{1/n}}$$

This uses $P(Y_{(n)} \le \theta) = (\theta'/\theta)^n$ and inverts the inequality.

### Shortest CI Problem

Among all $(1 - \alpha)$-level confidence intervals, the shortest one minimizes the interval width. For symmetric pivotal distributions (normal, $t$), the equal-tailed interval is shortest. For skewed distributions ($\chi^2$), the shortest CI requires numerical optimization and differs from the equal-tailed version.

## See Also

- [[Confidence Intervals]]
- [[Sufficient Statistics]]
- [[Independence of Random Variables]]
- [[math-451-551-homework-4]]
