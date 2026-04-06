---
title: "MATH 457∕557 - Homework 5"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, math-457, homework, markov-chains]
sources: [HW5_MATH457_557_Spring_2026.pdf]
---

# MATH 457∕557 - Homework 5

**Course:** MATH 457∕557 — Applied Stochastic Processes, University of Alabama, Spring 2026

## Summary

This homework continues the study of convergence to equilibrium, focusing on computing state distributions over time and verifying the conditions for convergence.

## Key Topics

- **State distribution evolution q_n = q_0 P^n:** Tracking how the row vector of state probabilities evolves by left-multiplying by the transition matrix at each step.
- **Sociology working/nonworking chain (Exercise 1.18):** A two-state chain modeling transitions between employment and unemployment, with transition probabilities estimated from sociological data.
- **Convergence to equilibrium:** Verifying that q_n approaches the stationary distribution pi as n grows, regardless of the initial distribution q_0.
- **Period checking via p^(n)(x,x) > 0:** The period of state x is gcd{n >= 1 : P^n(x,x) > 0}. A state is aperiodic if its period is 1. Checking aperiodicity by finding two consecutive values of n with positive return probability.
- **Long-run fractions:** Computing the long-run proportion of time the chain spends in each state, which equals the stationary probability under convergence conditions.
- **Two-state Markov chain detailed analysis:** Full characterization including eigenvalues of P, rate of convergence |lambda_2|^n, and explicit formula for P^n.

## Key Takeaways

1. The distribution vector q_n converges to pi geometrically fast, with rate governed by the second-largest eigenvalue of P.
2. Periodicity can be checked mechanically by computing gcd of return times; a self-loop (P(x,x) > 0) immediately guarantees aperiodicity.
3. Two-state chains illustrate all convergence phenomena in a fully explicit setting.
4. Long-run fractions equal stationary probabilities — this connects the time-average interpretation to the distributional limit.

## See Also

- [[math-457-557-homework-4|MATH 457∕557 - Homework 4]]
- [[math-457-557-homework-6|MATH 457∕557 - Homework 6]]
- [[Markov Chains]]
- [[Stationary Distributions]]
