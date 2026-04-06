---
title: Method of Moments
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [mathematical-statistics, estimation, point-estimation]
sources: [MathStatsHW1.pdf]
---

# Method of Moments

A classical technique for point estimation. The idea: equate population moments to their sample counterparts, then solve for the unknown parameters.

## Procedure

1. Compute the first $k$ population moments $E[Y], E[Y^2], \ldots, E[Y^k]$ as functions of the unknown parameters $\theta_1, \ldots, \theta_k$.
2. Set each population moment equal to the corresponding sample moment: $E[Y^j] = m_j'$ where $m_j' = \frac{1}{n}\sum_{i=1}^n Y_i^j$.
3. Solve the resulting system of equations for $\hat{\theta}_1, \ldots, \hat{\theta}_k$.

## Worked Examples

### Example 1: Single-Parameter Estimation (HW1 Ex. 9.69)

**Problem:** Let $Y$ have density $f_Y(y) = (\theta+1)y^\theta$ for $0 < y < 1$. Find the MOM estimator for $\theta$.

**Solution:**

**Step 1 — Compute the first population moment:**

$$E[Y] = \int_0^1 y \cdot (\theta+1)y^\theta\, dy = (\theta+1)\int_0^1 y^{\theta+1}\, dy = (\theta+1) \cdot \frac{1}{\theta+2} = \frac{\theta+1}{\theta+2}$$

**Step 2 — Set $E[Y] = \bar{Y}$ (sample mean):**

$$\frac{\theta+1}{\theta+2} = \bar{Y}$$

**Step 3 — Solve for $\theta$:**

$$\theta + 1 = \bar{Y}(\theta + 2) \implies \theta - \bar{Y}\theta = 2\bar{Y} - 1 \implies \theta(1 - \bar{Y}) = 2\bar{Y} - 1$$

$$\hat{\theta}_{\text{MOM}} = \frac{2\bar{Y} - 1}{1 - \bar{Y}}$$

Only one moment equation was needed because there is one unknown parameter (Source: [[MATH 451∕551 - Homework 1]]).

### Example 2: Two-Parameter Case (Normal Distribution)

**Problem:** For $Y_1, \ldots, Y_n \sim N(\mu, \sigma^2)$, find MOM estimators for both $\mu$ and $\sigma^2$.

**Solution:** Two unknowns require two moment equations:

$$E[Y] = \mu = \bar{Y} \implies \hat{\mu} = \bar{Y}$$

$$E[Y^2] = \sigma^2 + \mu^2 = \frac{1}{n}\sum Y_i^2 \implies \hat{\sigma}^2 = \frac{1}{n}\sum Y_i^2 - \bar{Y}^2$$

Note $\hat{\sigma}^2_{\text{MOM}}$ divides by $n$, not $n-1$ — it is biased for $\sigma^2$.

## Properties

- Simple and general — applicable whenever moments can be computed.
- MOM estimators are not always efficient or unbiased, but they are consistent under mild conditions.
- Often used as starting values for maximum likelihood estimation.

## See Also

- [[MATH 451∕551 - Homework 1]]
- [[Joint Probability Distribution]]
