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

## Worked Examples

### Example 1: Fisherman Problem (HW8 H3)

**Problem:** Fish arrive at rate $\lambda = 0.6$/hour. After 2 hours, the fisherman quits if he caught $\ge 1$ fish; otherwise he continues until catching exactly one. Find $P(\text{stays} > 2\text{ hours})$.

**Solution:** He stays $> 2$ hours iff zero fish arrive in $[0, 2]$:

$$P(N(2) = 0) = e^{-\lambda \cdot 2} = e^{-1.2} \approx 0.301$$

(Source: [[MATH 457∕557 - Homework 8]])

### Example 2: Memorylessness Applied (HW8 H1)

**Problem:** A radio has lifetime $\text{Exp}(1/5)$ (mean 5 years). It has been working for 8 years. What is the probability it lasts 3 more years?

**Solution:** By memorylessness: $P(T > 11 \mid T > 8) = P(T > 3) = e^{-3/5}$. The age of the radio is irrelevant — the remaining lifetime has the same distribution as a new radio.

(Source: [[MATH 457∕557 - Homework 8]])

### Example 3: Thinning and Merging (HW9 I3)

**Problem:** Transmitters A and B send messages via independent Poisson processes at rates $\lambda_A$ and $\lambda_B$. What is the probability that exactly 8 of the next 12 messages are from A?

**Solution:** By merging, the combined process has rate $\lambda_A + \lambda_B$. By thinning, each message is independently from A with probability $p = \frac{\lambda_A}{\lambda_A + \lambda_B}$. The number from A in the next 12 messages is $\text{Binomial}(12, p)$:

$$P(X = 8) = \binom{12}{8} p^8 (1-p)^4 = \binom{12}{8} \left(\frac{\lambda_A}{\lambda_A + \lambda_B}\right)^8 \left(\frac{\lambda_B}{\lambda_A + \lambda_B}\right)^4$$

(Source: [[MATH 457∕557 - Homework 9]])

## Relation to Markov Chains

The Poisson process is a continuous-time Markov chain on $\{0, 1, 2, \ldots\}$. Continuous-time Markov chains generalize the discrete-time [[Markov Chains]] framework by using exponential holding times between transitions.

## See Also

- [[Markov Chains]]
- [[Stationary Distributions]]
- [[Recurrence and Transience]]
- [[Independence of Random Variables]]
