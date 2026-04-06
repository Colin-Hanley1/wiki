---
title: "MATH 457∕557 - Homework 2"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, math-457, homework, markov-chains]
sources: [HW2_MATH457_557_Spring_2026.pdf]
---

# MATH 457∕557 - Homework 2

**Course:** MATH 457∕557 — Applied Stochastic Processes, University of Alabama, Spring 2026

## Summary

This homework focuses on multi-step transition probabilities and stationary distributions. Problems involve computing matrix powers, analyzing specific named chains, and solving for equilibrium behavior.

## Key Topics

- **Multi-step transition probabilities via matrix powers:** Computing $P^n$ to find the probability $p^{(n)}(i,j)$ of transitioning between states in exactly $n$ steps.
- **Ehrenfest chain ($N=3$):** A classic model of diffusion between two chambers. Analyzing the transition matrix and computing multi-step probabilities for 3 particles on state space $S = \{0, 1, 2, 3\}$.
- **Ball exchange urns:** A related urn model where balls are exchanged between two urns at each step, yielding a Markov chain on the number of balls in one urn.
- **Homeowner/renter chain (1990 census):** Modeling housing tenure transitions using census data. Computing the probability of homeownership after multiple generations.
- **Stationary distributions:** Solving the system $\vec{\pi} P = \vec{\pi}$ subject to $\sum_i \pi(i) = 1$. Finding the long-run proportion of time spent in each state.
- **Block-diagonal chains and non-unique stationary distributions:** When the transition matrix decomposes into independent blocks, each block has its own stationary distribution, and any convex combination is also stationary.
- **Taxi cab driver (Exercise 1.6):** A driver moves between locations according to a Markov chain; computing multi-step probabilities and long-run behavior. Tracking the distribution vector $\vec{q}_0$ and its evolution $\vec{q}_1 = \vec{q}_0 P$.

## Key Takeaways

1. Matrix exponentiation $P^n$ is the computational engine for multi-step Markov chain analysis.
2. The Ehrenfest chain is a fundamental example connecting Markov chains to statistical mechanics.
3. Stationary distributions may not be unique when the chain is reducible (block-diagonal structure).
4. Real-world data (census, transportation) naturally fits the Markov chain framework.

## See Also

- [[math-457-557-homework-1|MATH 457∕557 - Homework 1]]
- [[math-457-557-homework-3|MATH 457∕557 - Homework 3]]
- [[Markov Chains]]
- [[Stationary Distributions]]
