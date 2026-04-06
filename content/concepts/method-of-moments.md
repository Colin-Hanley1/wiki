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

## Example

For $f_Y(y) = (\theta+1)y^\theta$, $0 < y < 1$: the first moment is $E[Y] = \frac{\theta+1}{\theta+2}$. Setting $E[Y] = \bar{Y}$ and solving gives $\hat{\theta} = \frac{2\bar{Y}-1}{1-\bar{Y}}$ (Source: [[MATH 451∕551 - Homework 1]]).

## Properties

- Simple and general — applicable whenever moments can be computed.
- MOM estimators are not always efficient or unbiased, but they are consistent under mild conditions.
- Often used as starting values for maximum likelihood estimation.

## See Also

- [[MATH 451∕551 - Homework 1]]
- [[Joint Probability Distribution]]
