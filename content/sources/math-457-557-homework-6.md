---
title: "MATH 457∕557 - Homework 6"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, math-457, homework, markov-chains]
sources: [HW6_MATH457_557_Spring_2026.pdf]
---

# MATH 457∕557 - Homework 6

**Course:** MATH 457∕557 — Applied Stochastic Processes, University of Alabama, Spring 2026

## Summary

This homework bridges convergence theory and exit/absorption problems. It covers verifying convergence conditions (Theorem 1.19) and introduces techniques for computing absorption probabilities.

## Key Topics

- **Convergence to equilibrium (Theorem 1.19 conditions):** Verifying that a given chain satisfies irreducibility, positive recurrence, and aperiodicity so that the convergence theorem applies.
- **Aperiodicity checking via multi-step transitions:** Computing P^n(x,x) for small values of n to determine the period. If P^n(x,x) > 0 and P^(n+1)(x,x) > 0 for some n, the state is aperiodic.
- **Exit distributions and absorption probabilities:** Given a chain with absorbing states, computing the probability of being absorbed into each absorbing state as a function of the starting state.
- **Absorbing states:** A state a is absorbing if P(a,a) = 1. Once entered, the chain never leaves. Absorbing states are trivially recurrent.
- **Matrix methods for exit problems:** Setting up and solving systems of linear equations h(x) = sum_y P(x,y) h(y) with boundary conditions h(a) = 1 or 0 at absorbing states. Can also be expressed in matrix form using the fundamental matrix (I - Q)^{-1}.

## Key Takeaways

1. Theorem 1.19 provides the practical checklist: verify irreducibility, recurrence, and aperiodicity to guarantee convergence.
2. Exit distributions reduce to solving linear systems — one equation per transient state, with boundary conditions at absorbing states.
3. The fundamental matrix N = (I - Q)^{-1} encodes expected number of visits to each transient state before absorption.
4. Absorption is certain from any transient state in a finite chain — the only question is which absorbing class captures the chain.

## See Also

- [[math-457-557-homework-5|MATH 457∕557 - Homework 5]]
- [[math-457-557-homework-7|MATH 457∕557 - Homework 7]]
- [[Markov Chains]]
- [[Recurrence and Transience]]
