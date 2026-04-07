---
title: "MATH 451∕551 - Homework 1"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [mathematical-statistics, homework, method-of-moments, independence, joint-distributions]
sources: [MathStatsHW1.pdf]
---

# MATH 451∕551 - Homework 1

**Course:** MATH 451∕551 (Mathematical Statistics)
**Due:** January 24, 2026

## Structure

- **Type I (WebAssign):** Exercises 9.70, 9.71, 9.73, 9.75, 9.77, 9.81, 9.83, 9.89.
- **Type II (practice, solutions provided):** Exercises 9.69, 5.2, 5.19, 5.45.

Type II problems are not submitted but exam questions draw from both types.

## Key Topics and Solutions

### A2: Method of Moments Estimator (Ex. 9.69)

Given $Y$ with density $f_Y(y) = (\theta + 1)y^\theta$ for $0 < y < 1$, find the MOM estimator for $\theta$.

Compute the first population moment:

$$E[Y] = \int_0^1 y \cdot (\theta+1)y^\theta\, dy = \frac{\theta+1}{\theta+2}$$

Setting $E[Y] = \bar{Y}$ and solving for $\theta$:

$$\hat{\theta} = \frac{2\bar{Y} - 1}{1 - \bar{Y}}$$

This illustrates the [[Method of Moments]] approach: equate population moments to sample moments and solve for the parameter (Source: [[Method of Moments]]).

### A3: Joint PMF and Marginals (Ex. 5.2)

Three balanced coins are tossed. Let $Y_1$ = number of heads, $Y_2$ = number of tails minus number of heads. The eight equally likely outcomes give a [[Joint Probability Distribution]] with all mass at $1/8$ per outcome.

### A4: Probability from Joint PMF (Ex. 5.19)

Compute the probability of fewer than 3 heads and winning \$1 or less by summing appropriate entries from the joint PMF. Result: $1/2$.

Also derives the marginal PMF of $Y_1$ by summing over $Y_2$:
- $P_{Y_1}(0) = 4/9$, $P_{Y_1}(1) = 4/9$, $P_{Y_1}(2) = 1/9$.

Confirms this matches a Binomial$(2, 1/3)$ distribution.

### A5: Independence (Ex. 5.45)

$Y_1$ and $Y_2$ are **not independent**. Proof by counterexample: $P_{Y_1,Y_2}(2,2) = 0$ but $P_{Y_1}(2) \times P_{Y_2}(2) = \frac{1}{9} \times \frac{1}{9} \neq 0$. The joint PMF does not factor into the product of marginals, violating the definition of [[Independence of Random Variables]].

## Concepts Covered

- [[Method of Moments]] — parameter estimation by matching population and sample moments
- [[Joint Probability Distribution]] — joint PMFs, marginal distributions
- [[Independence of Random Variables]] — factorization criterion, counterexample approach

## See Also

- [[Method of Moments]]
- [[Joint Probability Distribution]]
- [[Independence of Random Variables]]
