---
title: Confidence Intervals
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [mathematical-statistics, inference, interval-estimation]
sources: [Solution_HW4.pdf, Solution_HW5.pdf, HW6.pdf, HW7.pdf]
---

# Confidence Intervals

## Definition

A **$(1-\alpha)$ confidence interval** for a parameter $\theta$ is a random interval $[\hat{\theta}_L,\, \hat{\theta}_U]$ such that

$$P\!\bigl(\theta \in [\hat{\theta}_L,\, \hat{\theta}_U]\bigr) = 1 - \alpha.$$

The interval is random (it depends on the sample); $\theta$ is fixed. The confidence level $1-\alpha$ describes the long-run coverage probability.

## Pivotal Quantity Method

A **pivotal quantity** $Q(Y_1,\dots,Y_n;\,\theta)$ has a distribution that does not depend on $\theta$. Invert the probability statement $P(a \le Q \le b) = 1-\alpha$ to isolate $\theta$ and obtain the CI.

## Key Cases

### 1. Normal Mean, Known $\sigma$

$$\bar{Y} \pm z_{\alpha/2}\,\frac{\sigma}{\sqrt{n}}$$

Pivot: $Z = \dfrac{\bar{Y}-\mu}{\sigma/\sqrt{n}} \sim N(0,1)$.

### 2. Normal Mean, Unknown $\sigma$ (Small Sample)

$$\bar{Y} \pm t_{\alpha/2}\,\frac{S}{\sqrt{n}}, \qquad \text{df} = n-1$$

Pivot: $T = \dfrac{\bar{Y}-\mu}{S/\sqrt{n}} \sim t_{n-1}$.

### 3. Normal Variance

$$\left[\frac{(n-1)S^2}{\chi^2_{\alpha/2}},\;\frac{(n-1)S^2}{\chi^2_{1-\alpha/2}}\right]$$

Pivot: $\dfrac{(n-1)S^2}{\sigma^2} \sim \chi^2_{n-1}$.

### 4. Two-Sample (Equal Variances)

$$(\bar{Y}_1 - \bar{Y}_2) \pm t_{\alpha/2}\,S_p\sqrt{\frac{1}{n_1}+\frac{1}{n_2}}, \qquad \text{df} = n_1+n_2-2$$

where the pooled variance is $S_p^2 = \dfrac{(n_1-1)S_1^2 + (n_2-1)S_2^2}{n_1+n_2-2}$.

### 5. Large-Sample / Proportions (via CLT)

For a proportion $\hat{p}$:

$$\hat{p} \pm z_{\alpha/2}\sqrt{\frac{\hat{p}(1-\hat{p})}{n}}$$

## One-Sided Bounds

- **Upper bound**: $P(\theta \le \hat{\theta}_U) = 1-\alpha$
- **Lower bound**: $P(\theta \ge \hat{\theta}_L) = 1-\alpha$

Replace $z_{\alpha/2}$ (or $t_{\alpha/2}$) with $z_\alpha$ (or $t_\alpha$).

## Shortest Confidence Interval

For symmetric distributions, the shortest CI is obtained by choosing symmetric quantiles. For skewed distributions (e.g., $\chi^2$), the equal-tails interval is standard but not the shortest; finding the shortest CI requires solving an optimization problem.

## Sample Size Determination

To achieve margin of error $E$ for a normal mean with known $\sigma$:

$$n = \left\lceil \frac{z_{\alpha/2}^2\,\sigma^2}{E^2} \right\rceil.$$

## See Also

- [[Hypothesis Testing]]
- [[Maximum Likelihood Estimation]]
- [[Sufficient Statistics]]
