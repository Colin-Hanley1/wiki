---
title: Markov Chains
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, markov-chains, probability]
sources: [HW1_MATH457_557_Spring_2026-2.pdf, HW2_MATH457_557_Spring_2026_v1-2.pdf, HW3_MATH457_557_Spring_2026_v2-3.pdf]
---

# Markov Chains

A **Markov chain** is a stochastic process $X_0, X_1, X_2, \ldots$ taking values in a countable state space $S$ and satisfying the **Markov property**: the future depends on the past only through the present state.

$$P(X_{n+1} = j \mid X_n = i, X_{n-1} = i_{n-1}, \ldots, X_0 = i_0) = P(X_{n+1} = j \mid X_n = i) = p(i, j)$$

## Transition Matrix

The one-step transition probabilities $p(i,j)$ form a **stochastic matrix** $P$: each row sums to 1, all entries non-negative. Multi-step transition probabilities are given by matrix powers: $p^{(n)}(i,j) = (P^n)_{ij}$.

**Path probability:** $P(X_n = x_n, \ldots, X_1 = x_1 \mid X_0 = x_0) = p(x_0, x_1) \cdot p(x_1, x_2) \cdots p(x_{n-1}, x_n)$ (Source: [[MATH 457∕557 - Homework 1]]).

## State Distribution Evolution

If $\vec{q}_n$ is the distribution at time $n$, then $\vec{q}_n = \vec{q}_0 P^n$. Under convergence conditions, $\vec{q}_n \to \vec{\pi}$ regardless of the initial distribution (Source: [[MATH 457∕557 - Homework 5]]).

## Classification of States

- **Communication:** State $x$ communicates with $y$ ($x \leftrightarrow y$) if $p^{(n)}(x,y) > 0$ and $p^{(m)}(y,x) > 0$ for some $n, m$.
- **Irreducible:** All states communicate with each other.
- **Period:** $d(x) = \gcd\{n \ge 1 : p^{(n)}(x,x) > 0\}$. Aperiodic if $d(x) = 1$.
- **Recurrent vs transient:** See [[Recurrence and Transience]].

## Convergence to Equilibrium

For a chain that is **irreducible, aperiodic, and positive recurrent** (the "I.R.A." conditions):

$$\lim_{n \to \infty} p^{(n)}(x, y) = \pi(y)$$

where $\vec{\pi}$ is the unique [[Stationary Distributions|stationary distribution]]. The limit is independent of the starting state $x$ (Source: [[MATH 457∕557 - Homework 4]]).

## Key Examples from Coursework

| Chain | State Space | Key Feature |
|---|---|---|
| Social mobility | $\{1,2,3\}$ (lower/middle/upper) | Irreducible, convergent |
| Ehrenfest | $\{0,1,\ldots,N\}$ | Models diffusion; periodic when $N$ even |
| Gambler's ruin | $\{0,1,\ldots,N\}$ | Absorbing barriers at $0$ and $N$ |
| Spider-fly | $\{0,1,2,\ldots\}$ | State 0 absorbing (capture) |

## See Also

- [[Stationary Distributions]]
- [[Recurrence and Transience]]
- [[Poisson Process]]
- [[Bayesian Networks]] — directed graphical models also encode conditional independence
- [[Independence of Random Variables]]
