---
title: "MATH 457∕557 - Homework 4"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, math-457, homework, markov-chains]
sources: [HW4_MATH457_557_Spring_2026.pdf]
---

# MATH 457∕557 - Homework 4

**Course:** MATH 457∕557 — Applied Stochastic Processes, University of Alabama, Spring 2026

## Summary

This homework covers long-run behavior and convergence of Markov chains. Problems explore the conditions under which a chain's distribution converges to its stationary distribution and apply these ideas to concrete examples.

## Key Topics

- **Basketball player shot chain:** A player's success probability depends on whether the last shot was made or missed, forming a two-state Markov chain. The asymptotic shooting percentage is determined by the stationary distribution.
- **Professor's light bulbs chain:** A chain modeling the number of working light bulbs in an office, with transitions determined by bulb failure and replacement policies.
- **Convergence conditions (I.R.A.):** A finite Markov chain converges to its unique stationary distribution if and only if it is Irreducible, Recurrent, and Aperiodic. Sometimes stated as I.R.S. (Irreducible, Recurrent, Stationary exists) for finite chains where recurrence is automatic.
- **Two-state chains:** Complete analysis of 2x2 transition matrices. Closed-form expressions for P^n, stationary distribution, and rate of convergence.
- **Random walk with barriers:** A random walk on {0, 1, ..., N} with reflecting or absorbing barriers. Determining long-run behavior depending on barrier type.

## Key Takeaways

1. The convergence theorem is the central result: under irreducibility, recurrence, and aperiodicity, the chain forgets its initial state and settles into equilibrium.
2. Two-state chains are fully solvable in closed form and serve as a testing ground for all general theorems.
3. Aperiodicity is the condition most easily overlooked — a chain that deterministically alternates between states never converges in distribution.
4. The stationary distribution gives the long-run fraction of time spent in each state, which is the key quantity for applications.

## See Also

- [[math-457-557-homework-3|MATH 457∕557 - Homework 3]]
- [[math-457-557-homework-5|MATH 457∕557 - Homework 5]]
- [[Markov Chains]]
- [[Stationary Distributions]]
