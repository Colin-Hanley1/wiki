---
title: Joint Probability Distribution
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [probability, mathematical-statistics, random-variables]
sources: [MathStatsHW1.pdf]
---

# Joint Probability Distribution

The joint distribution of random variables $Y_1, \ldots, Y_n$ specifies the probability of every combination of values they can take simultaneously.

## Discrete Case (Joint PMF)

$$P_{Y_1, Y_2}(y_1, y_2) = P(Y_1 = y_1, Y_2 = y_2)$$

## Marginal Distributions

Obtained by summing (or integrating) over the other variable:

$$P_{Y_1}(y_1) = \sum_{y_2} P_{Y_1, Y_2}(y_1, y_2)$$

## Worked Example: Computing Marginals (HW1 Ex. 5.19)

**Problem:** Two balanced dice are rolled. $Y_1$ = number of 1's that appear, $Y_2$ = net winnings (win \$1 for each 1, lose \$1 for each non-1). Find the marginal PMF of $Y_1$ and verify it is $\text{Binomial}(2, 1/3)$.

**Solution:** Each die shows 1 with probability $1/3$, non-1 with probability $2/3$. The possible values of $Y_1$ are $\{0, 1, 2\}$.

Sum the joint PMF over all values of $Y_2$:

$$P_{Y_1}(0) = \sum_{y_2} P_{Y_1,Y_2}(0, y_2) = \frac{4}{9}, \quad P_{Y_1}(1) = \frac{4}{9}, \quad P_{Y_1}(2) = \frac{1}{9}$$

Compare with $\text{Binomial}(2, 1/3)$:

$$P(Y_1 = k) = \binom{2}{k}\left(\frac{1}{3}\right)^k\left(\frac{2}{3}\right)^{2-k}$$

For $k = 0$: $\binom{2}{0}(2/3)^2 = 4/9$ ✓, for $k = 1$: $\binom{2}{1}(1/3)(2/3) = 4/9$ ✓, for $k = 2$: $\binom{2}{2}(1/3)^2 = 1/9$ ✓

The marginal matches $\text{Binomial}(2, 1/3)$ exactly (Source: [[MATH 451∕551 - Homework 1]]).

## Connection to Independence

$Y_1$ and $Y_2$ are independent if and only if the joint PMF factors:

$$P_{Y_1, Y_2}(y_1, y_2) = P_{Y_1}(y_1) \cdot P_{Y_2}(y_2) \quad \text{for all } y_1, y_2$$

Failure at even a single point suffices to prove dependence (Source: [[MATH 451∕551 - Homework 1]]).

## See Also

- [[Independence of Random Variables]]
- [[Method of Moments]]
- [[MATH 451∕551 - Homework 1]]
