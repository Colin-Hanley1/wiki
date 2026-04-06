---
title: Poisson Process
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, poisson-process, continuous-time]
sources: [HW8_MATH457_557_Spring2026_v7.pdf, HW9_MATH457_557_Spring2026_v8.pdf]
---

# Poisson Process

A **Poisson process** with rate $\lambda > 0$ is a continuous-time counting process $\{N(t) : t \ge 0\}$ where:

1. $N(0) = 0$.
2. The process has **independent increments**: counts in disjoint intervals are independent.
3. $N(t) - N(s) \sim \text{Poisson}(\lambda(t-s))$ for $0 \le s < t$.

## Inter-Arrival Times

The times between successive arrivals $T_1, T_2, \ldots$ are i.i.d. $\text{Exponential}(\lambda)$:

$$P(T_i > t) = e^{-\lambda t}, \qquad E[T_i] = 1/\lambda$$

## Memorylessness

The exponential distribution is the unique continuous distribution with the **memoryless property**:

$$P(T > t + s \mid T > t) = P(T > s)$$

This means "given that no event has occurred by time $t$, the remaining wait time has the same distribution as the original" (Source: [[MATH 457∕557 - Homework 8]]).

## Merging and Thinning

- **Merging:** If $N_1(t)$ and $N_2(t)$ are independent Poisson processes with rates $\lambda_1$ and $\lambda_2$, then $N_1(t) + N_2(t)$ is Poisson with rate $\lambda_1 + \lambda_2$.
- **Thinning:** If each arrival is independently classified as type A with probability $p$, then type-A arrivals form a Poisson process with rate $\lambda p$ (Source: [[MATH 457∕557 - Homework 9]]).

## Exponential Races

When $n$ independent exponential random variables with rates $\lambda_1, \ldots, \lambda_n$ "race":

- The minimum is $\text{Exponential}(\lambda_1 + \cdots + \lambda_n)$.
- The winner is player $i$ with probability $\lambda_i / (\lambda_1 + \cdots + \lambda_n)$.
- The winner's identity is independent of the winning time.

This is fundamental for analyzing service systems and queueing (Source: [[MATH 457∕557 - Homework 9]]).

## Relation to Markov Chains

The Poisson process is a continuous-time Markov chain on $\{0, 1, 2, \ldots\}$. Continuous-time Markov chains generalize the discrete-time [[Markov Chains]] framework by using exponential holding times between transitions.

## See Also

- [[Markov Chains]]
- [[Stationary Distributions]]
- [[Recurrence and Transience]]
- [[Independence of Random Variables]]
