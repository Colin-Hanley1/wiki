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

## Connection to Independence

$Y_1$ and $Y_2$ are independent if and only if the joint PMF factors:

$$P_{Y_1, Y_2}(y_1, y_2) = P_{Y_1}(y_1) \cdot P_{Y_2}(y_2) \quad \text{for all } y_1, y_2$$

Failure at even a single point suffices to prove dependence (Source: [[MATH 451∕551 - Homework 1]]).

## See Also

- [[Independence of Random Variables]]
- [[Method of Moments]]
- [[MATH 451∕551 - Homework 1]]
