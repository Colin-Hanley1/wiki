---
title: "MATH 457∕557 - Homework 7"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, math-457, homework, markov-chains]
sources: [HW7_MATH457_557_Spring_2026.pdf]
---

# MATH 457∕557 - Homework 7

**Course:** MATH 457∕557 — Applied Stochastic Processes, University of Alabama, Spring 2026

## Summary

This homework focuses on expected exit and return times. Problems involve setting up and solving linear systems derived from first-step analysis, with applications to gambler's ruin and chains with absorbing barriers.

## Key Topics

- **Expected exit/return times:** Computing E_x[T_y], the expected number of steps to reach state y starting from state x. These satisfy linear equations derived from conditioning on the first step.
- **Reconfiguring chains with absorbing states:** Modifying a chain's transition matrix to make certain states absorbing, then analyzing the resulting absorption problem.
- **Computing E_x[T_y] via linear equations:** The function g(x) = E_x[T_y] satisfies g(y) = 0 and g(x) = 1 + sum_z P(x,z) g(z) for x != y. This gives a system of linear equations solvable by substitution or matrix methods.
- **Conditional expectation approach for return times:** For the expected return time E_x[T_x], conditioning on the first step yields g(x) = 1 + sum_{z != x} P(x,z) h(z), where h(z) = E_z[T_x] is the expected hitting time from z to x.
- **Gambler's ruin exit times:** Computing the expected duration of the gambler's ruin game — how long until the gambler either reaches N or goes broke. The expected time satisfies a second-order linear recurrence.

## Key Takeaways

1. First-step analysis converts expected time questions into linear systems, just as it does for absorption probabilities.
2. Expected return time E_x[T_x] = 1/pi(x) for an irreducible positive recurrent chain — connecting hitting times to the stationary distribution.
3. Gambler's ruin expected durations grow quadratically in N for the symmetric case (p = 1/2) and linearly for biased walks.
4. Absorbing-state reformulations allow reuse of fundamental matrix techniques: expected times are row sums of N = (I - Q)^{-1}.

## See Also

- [[math-457-557-homework-6|MATH 457∕557 - Homework 6]]
- [[math-457-557-homework-8|MATH 457∕557 - Homework 8]]
- [[Markov Chains]]
- [[Recurrence and Transience]]
