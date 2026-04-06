---
title: Independence of Random Variables
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [probability, mathematical-statistics, independence]
sources: [MathStatsHW1.pdf]
---

# Independence of Random Variables

Random variables $Y_1$ and $Y_2$ are **independent** if and only if their joint distribution factors into the product of their marginals for all values:

$$P_{Y_1, Y_2}(y_1, y_2) = P_{Y_1}(y_1) \cdot P_{Y_2}(y_2) \quad \text{for all } y_1, y_2$$

In the continuous case, replace PMFs with PDFs.

## Proving Dependence

To show two variables are **not** independent, it suffices to find a single counterexample — one pair $(y_1, y_2)$ where the factorization fails.

**Example:** If $P_{Y_1,Y_2}(2,2) = 0$ but $P_{Y_1}(2) \cdot P_{Y_2}(2) = \frac{1}{9} \cdot \frac{1}{9} \neq 0$, then $Y_1$ and $Y_2$ are not independent (Source: [[MATH 451∕551 - Homework 1]]).

## Importance

Independence is foundational in statistics — it underlies the construction of likelihoods from i.i.d. samples, the validity of many estimators, and the derivation of sampling distributions. Reviewed from Math 355 as prerequisite material for MATH 451∕551.

## See Also

- [[Joint Probability Distribution]]
- [[MATH 451∕551 - Homework 1]]
