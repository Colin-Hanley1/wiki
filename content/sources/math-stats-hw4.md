---
title: "MATH 451/551 - Homework 4"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [mathematical-statistics, homework, sufficient-statistics, factorization-criterion, exponential-family]
sources: [Solution_HW4_MATH451_551_Spring2026_v11.pdf]
---

# MATH 451/551 — Homework 4

**Course:** MATH 451/551 Mathematical Statistics, Spring 2026
**Due:** ~February 14, 2026

## Key Topics

- [[Sufficient Statistics]] via the Factorization Criterion (Theorem 9.4)
- Sufficient statistics for standard families: Bernoulli, Poisson, exponential, Weibull, Pareto, normal, uniform
- Exponential family and its canonical sufficient statistic
- Pivotal quantities and introduction to [[Confidence Intervals]] (Ex 8.40)
- [[Method of Moments]] vs sufficient statistics

## Summary of Important Problems and Results

### Factorization Criterion (Theorem 9.4)

A statistic $U = u(Y_1, \dots, Y_n)$ is sufficient for $\theta$ if and only if the joint density factors as:

$$f(\mathbf{y}|\theta) = g(u(\mathbf{y}), \theta) \cdot h(\mathbf{y})$$

where $h$ does not depend on $\theta$. This criterion is applied across many distributions in the assignment.

### Exponential Family Sufficient Statistics

For densities in the exponential family form:

$$f(y|\theta) = a(\theta)\, b(y)\, \exp\!\bigl[-c(\theta)\, d(y)\bigr]$$

the statistic $U = \sum_{i=1}^n d(Y_i)$ is sufficient for $\theta$. This unifies the sufficient statistics for Poisson ($U = \sum Y_i$), exponential ($U = \sum Y_i$), and other standard families.

### Distribution-Specific Results

| Distribution | Sufficient Statistic |
|---|---|
| Bernoulli$(p)$ | $\sum Y_i$ |
| Poisson$(\lambda)$ | $\sum Y_i$ |
| Exponential$(\theta)$ | $\sum Y_i$ |
| Weibull | $\sum Y_i^m$ (shape known) |
| Pareto | $\sum \ln Y_i$ |
| Normal$(\mu, \sigma^2)$ | $(\sum Y_i,\, \sum Y_i^2)$ — jointly sufficient |
| Uniform$(0, \theta)$ | $Y_{(n)}$ |

### Shifted Exponential

For the shifted exponential with location parameter, $Y_{(1)}$ is sufficient. The factorization separates the indicator function involving $Y_{(1)}$ from the rest.

### Pivotal Quantities

Exercise 8.40 introduces the idea of a pivotal quantity — a function of the data and the parameter whose distribution is parameter-free — as a bridge toward constructing confidence intervals.

## See Also

- [[Sufficient Statistics]]
- [[Maximum Likelihood Estimation]]
- [[Confidence Intervals]]
- [[Method of Moments]]
- [[math-stats-hw3]]
- [[math-stats-hw5]]
