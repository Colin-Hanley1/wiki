---
title: Recurrence and Transience
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, markov-chains, recurrence]
sources: [HW3_MATH457_557_Spring_2026_v2-3.pdf, HW6_MATH457_557_Spring2026_v11-1.pdf, HW7_MATH457_557_Spring2025_v6.pdf]
---

# Recurrence and Transience

For a [[Markov Chains|Markov chain]], a state $x$ is classified by whether the chain returns to it with certainty.

## Definitions

Let $T_x = \min\{n \ge 1 : X_n = x\}$ be the **first return time** to state $x$, and $\rho_{xx} = P_x(T_x < \infty)$.

- **Recurrent:** $\rho_{xx} = 1$ — the chain returns to $x$ with probability 1.
- **Transient:** $\rho_{xx} < 1$ — positive probability of never returning.

Equivalently, $x$ is recurrent iff $\sum_{n=0}^{\infty} p^{(n)}(x,x) = \infty$.

## Communication and Class Properties

- Recurrence and transience are **class properties**: if $x \leftrightarrow y$, they share the same classification.
- In an **irreducible** chain, all states are either all recurrent or all transient.
- **Finite irreducible chains** are always recurrent (Source: [[MATH 457∕557 - Homework 3]]).

## Decomposition

The state space decomposes as:

$$S = T \cup C_1 \cup C_2 \cup \cdots$$

where $T$ is the set of transient states and $C_1, C_2, \ldots$ are disjoint **irreducible closed** (recurrent) sets. A set $C$ is **closed** if $p(x, y) = 0$ for all $x \in C$, $y \notin C$ — the chain cannot escape (Source: [[MATH 457∕557 - Homework 3]]).

## Hitting and Return Times

- **Hitting time:** $T_y = \min\{n \ge 1 : X_n = y\}$ starting from any state.
- **Return time:** $T_y$ when starting from $y$ itself.
- **Expected return time:** For positive recurrent state $y$: $E_y[T_y] = 1/\pi(y)$ where $\pi$ is the [[Stationary Distributions|stationary distribution]].
- **First-step analysis:** $E_x[T_y]$ satisfies $g(x) = 1 + \sum_{z \ne y} p(x,z) g(z)$ — a linear system solved by making $y$ absorbing (Source: [[MATH 457∕557 - Homework 7]]).

## Exit Distributions and Absorption

For a chain with absorbing states, the probability of being absorbed into a particular state can be computed via a system of linear equations. The **fundamental matrix** $(I - Q)^{-1}$ (where $Q$ is the transient-to-transient submatrix) gives expected number of visits before absorption (Source: [[MATH 457∕557 - Homework 6]]).

## Examples

| Chain | Classification |
|---|---|
| Gambler's ruin ($N < \infty$) | States $0, N$ recurrent (absorbing); $1, \ldots, N-1$ transient |
| Gambler's ruin ($N = \infty$) | State 0 recurrent; $1, 2, \ldots$ transient |
| Chain: $x \to x+1$ w.p. $p$, $\to 0$ w.p. $q$ | Irreducible and recurrent; $E_0[T_0] = 1/(1-p)$ |

## See Also

- [[Markov Chains]]
- [[Stationary Distributions]]
- [[Poisson Process]]
