---
title: Hypothesis Testing
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [mathematical-statistics, inference, hypothesis-testing]
sources: [HW8.pdf, HW9.pdf]
---

# Hypothesis Testing

## Framework

A hypothesis test evaluates a claim about a parameter $\theta$:

- **Null hypothesis** $H_0$: the default or status-quo claim (e.g., $H_0: \theta = \theta_0$).
- **Alternative hypothesis** $H_a$: the competing claim (one-sided or two-sided).

The procedure:

1. Choose a **test statistic** whose distribution under $H_0$ is known.
2. Define a **rejection region** (RR) corresponding to significance level $\alpha$.
3. Reject $H_0$ if the observed test statistic falls in the RR.

## Error Types and Power

| | $H_0$ true | $H_0$ false |
|---|---|---|
| Reject $H_0$ | Type I error ($\alpha$) | Correct (power $= 1-\beta$) |
| Fail to reject $H_0$ | Correct | Type II error ($\beta$) |

- **Type I error rate** $\alpha = P(\text{reject } H_0 \mid H_0 \text{ true})$.
- **Type II error rate** $\beta = P(\text{fail to reject } H_0 \mid H_0 \text{ false})$.
- **Power** $= 1 - \beta$: the probability of correctly rejecting a false $H_0$. Power depends on the true parameter value, $\alpha$, and $n$.

## P-Value

The **p-value** is the smallest significance level $\alpha$ at which the observed data would lead to rejection of $H_0$. Equivalently, it is the probability under $H_0$ of obtaining a test statistic as extreme as or more extreme than the one observed. Reject $H_0$ when the p-value $\le \alpha$.

## Key Tests

### 1. One-Sample $t$-Test

$$T = \frac{\bar{Y} - \mu_0}{S/\sqrt{n}}, \qquad \text{df} = n-1$$

For $H_a: \mu \neq \mu_0$, reject if $|T| > t_{\alpha/2,\,n-1}$.

### 2. Two-Sample Pooled $t$-Test

$$T = \frac{\bar{Y}_1 - \bar{Y}_2}{S_p\sqrt{\dfrac{1}{n_1}+\dfrac{1}{n_2}}}, \qquad \text{df} = n_1+n_2-2$$

where $S_p^2 = \dfrac{(n_1-1)S_1^2 + (n_2-1)S_2^2}{n_1+n_2-2}$.

Assumes independent normal populations with equal variances.

### 3. $F$-Test for Equality of Variances

$$F = \frac{S_1^2}{S_2^2} \sim F_{n_1-1,\,n_2-1} \quad \text{under } H_0: \sigma_1^2 = \sigma_2^2.$$

### 4. Binomial Test

For $H_0: p = p_0$ with $n$ Bernoulli trials, compute the exact binomial probability of results as extreme as or more extreme than observed. For large $n$, use the normal approximation $Z = \dfrac{\hat{p}-p_0}{\sqrt{p_0(1-p_0)/n}}$.

## Duality with Confidence Intervals

There is a direct correspondence between hypothesis tests and [[Confidence Intervals]]:

> Reject $H_0: \theta = \theta_0$ at level $\alpha$ if and only if $\theta_0$ is not contained in the $(1-\alpha)$ confidence interval for $\theta$.

This duality means every CI implicitly defines a family of tests, and vice versa.

## Assumptions

The standard tests above rely on:

- **Normality** of the underlying population (or large $n$ for CLT-based approximations).
- **Independence** of observations.
- **Equal variances** for the pooled two-sample $t$-test and the two-sample $F$-test.

Violations of these assumptions can inflate Type I error rates or reduce power.

## See Also

- [[Confidence Intervals]]
- [[Maximum Likelihood Estimation]]
