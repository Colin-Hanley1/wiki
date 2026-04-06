---
title: "MATH 457∕557 - Homework 1"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, math-457, homework, markov-chains]
sources: [HW1_MATH457_557_Spring_2026.pdf]
---

# MATH 457∕557 - Homework 1

**Course:** MATH 457∕557 — Applied Stochastic Processes, University of Alabama, Spring 2026

## Summary

This homework covers probability review and the introduction to Markov chains. Problems address foundational concepts needed before diving into chain analysis.

## Key Topics

- **Independence of events and complements:** Proving that if events $A$ and $B$ are independent, then $A$ and $B^c$ are also independent. Extends to complements of both events.
- **Markov property from definition:** Rigorous proof that a process satisfies the Markov property — the future state depends only on the present state, not on the history of past states. Formally:

$$
P(X_{n+1} = j \mid X_n = i, X_{n-1} = i_{n-1}, \ldots, X_0 = i_0) = P(X_{n+1} = j \mid X_n = i)
$$

- **Conditional probability and total probability theorem:** Applying the law of total probability and Bayes' rule in multi-step random experiments.
- **Constructing Markov chains:** The spider-fly problem as a motivating example — modeling a random process on a graph as a Markov chain by identifying states and transition probabilities.
- **Path probabilities via transition matrix:** Computing the probability of specific state sequences using products of transition matrix entries $p(i,j)$.
- **Social mobility chain:** Modeling intergenerational social class transitions (lower, middle, upper) as a Markov chain on state space $\{1, 2, 3\}$ with empirically estimated transition probabilities.

## Key Takeaways

1. Independence is preserved under complementation — a useful algebraic fact for probability calculations.
2. The Markov property is the defining assumption: conditioning on the entire past collapses to conditioning on the present state alone.
3. Transition matrices encode all one-step dynamics; path probabilities factor as products of matrix entries $p(x_0, x_1) \cdot p(x_1, x_2) \cdots p(x_{n-1}, x_n)$.
4. Real-world phenomena (social mobility, random walks on graphs) can be naturally modeled as Markov chains once states and transitions are identified.

## See Also

- [[math-457-557-homework-2|MATH 457∕557 - Homework 2]]
- [[Markov Chains]]
- [[Independence of Random Variables]]
