---
title: Maximum Likelihood Estimation
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [mathematical-statistics, estimation, point-estimation]
sources: [Solution_HW2.pdf, HW3.pdf, Solution_HW4.pdf]
---

# Maximum Likelihood Estimation

## Definition

Given a random sample $Y_1, Y_2, \dots, Y_n$ with joint density (or mass function) depending on parameter $\theta$, the **likelihood function** is

$$L(\theta) = \prod_{i=1}^{n} f(y_i \mid \theta).$$

The **maximum likelihood estimator (MLE)** $\hat{\theta}$ is the value of $\theta$ that maximizes $L(\theta)$ over the parameter space.

## Procedure

1. Write the likelihood $L(\theta) = \prod f(y_i \mid \theta)$.
2. Take the log-likelihood $\ell(\theta) = \ln L(\theta) = \sum \ln f(y_i \mid \theta)$.
3. Solve $\dfrac{d\ell}{d\theta} = 0$ (or, for vector $\theta$, set all partial derivatives to zero).
4. Verify the solution is a maximum (second derivative test or boundary check).

In the **monotone likelihood** case, $L(\theta)$ is strictly increasing or decreasing in $\theta$, so the MLE is found at a boundary of the parameter space rather than by setting a derivative to zero.

## Invariance Property

If $\hat{\theta}$ is the MLE of $\theta$, then for any function $g$, the MLE of $g(\theta)$ is $g(\hat{\theta})$.

## Key Examples

| Distribution | Parameter | MLE |
|---|---|---|
| Poisson$(\lambda)$ | $\lambda$ | $\hat{\lambda} = \bar{Y}$ |
| Exponential$(\theta)$ (mean $\theta$) | $\theta$ | $\hat{\theta} = \bar{Y}$ |
| Uniform$(0, \theta)$ | $\theta$ | $\hat{\theta} = Y_{(n)}$ (monotone likelihood) |
| Geometric$(p)$ | $p$ | $\hat{p} = 1/\bar{Y}$ |

- **Poisson**: The log-likelihood is $\ell(\lambda) = -n\lambda + \left(\sum y_i\right)\ln\lambda + C$. Setting $\ell'(\lambda)=0$ gives $\hat{\lambda}=\bar{Y}$.
- **Uniform**: $L(\theta) = \theta^{-n}$ for $\theta \ge Y_{(n)}$, which is decreasing in $\theta$. The MLE is the smallest admissible value, $\hat{\theta} = Y_{(n)}$.

## Comparison with Method of Moments

The MLE and the [[Method of Moments]] estimator often coincide (e.g., Poisson, exponential) but can differ. MLE generally has better asymptotic efficiency, while method of moments can be simpler to compute. For the Uniform$(0,\theta)$ case, the method of moments gives $\hat{\theta}=2\bar{Y}$, which differs from the MLE $\hat{\theta}=Y_{(n)}$.

## See Also

- [[Method of Moments]]
- [[Sufficient Statistics]]
- [[Confidence Intervals]]
