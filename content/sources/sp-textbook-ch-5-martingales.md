---
title: "SP Textbook — Ch. 5 Martingales"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, martingales, textbook, durrett]
sources: [sp_ch5]
---

# SP Textbook — Ch. 5 Martingales

**Source**: Durrett, R. *Essentials of Stochastic Processes*, 2nd ed., Springer, 2012. Chapter 5.

## Overview

Chapter 5 introduces martingales — stochastic processes whose conditional expected future value, given all past information, equals the present value. Martingales provide a unifying framework for analyzing fair games, random walks, and branching processes, and serve as the probabilistic backbone for mathematical finance (Ch. 6).

## Key Definitions

- **Filtration**: An increasing sequence of information sets $(\mathcal{F}_n)$ representing knowledge available at time $n$.
- **[[Martingale]]**: A process $(M_n)$ adapted to $(\mathcal{F}_n)$ satisfying $E[\mid M_n \mid] < \infty$ and

$$
E[M_{n+1} \mid \mathcal{F}_n] = M_n
$$

- **Supermartingale**: Replace $=$ with $\leq$ (expected value tends to decrease — unfavorable game).
- **Submartingale**: Replace $=$ with $\geq$ (expected value tends to increase — favorable game).

## Core Examples

1. **Partial sums of mean-zero r.v.'s**: If $X_1, X_2, \ldots$ are i.i.d. with $E[X_i] = 0$, then $S_n = X_1 + \cdots + X_n$ is a martingale.
2. **Quadratic martingale**: If $E[X_i] = 0$ and $\text{Var}(X_i) = \sigma^2$, then $S_n^2 - n\sigma^2$ is a martingale.
3. **Exponential martingale**: If $\phi(\theta) = E[e^{\theta X_i}]$ and we choose $\theta$ so $\phi(\theta) = 1$, then $e^{\theta S_n}$ is a martingale.
4. **Branching process**: The normalized population $Z_n / \mu^n$ (where $\mu$ is the mean offspring) is a martingale.
5. **Polya's urn**: Fraction of red balls $X_n$ is a non-negative martingale converging to a limit $X_\infty$ by the convergence theorem.

## Gambling Strategies and Stopping Times

- **Admissible gambling strategy (predictable process)**: A bet sequence $H_n$ where each $H_n$ is determined by information available before time $n$.
- **Wealth process**: $W_n = W_0 + \sum_{m=1}^{n} H_m (M_m - M_{m-1})$.
- **Doubling strategy**: Bet $1$, double after each loss. Wins $1$ per success cycle, but the rare catastrophic loss exactly offsets the frequent small wins — expected profit is $0$.

**Theorem 5.12** ("You can't beat an unfavorable game"): If $M_n$ is a supermartingale and $H_n$ is a bounded predictable strategy with $H_n \geq 0$, then $W_n$ is also a supermartingale.

- **Stopping time**: A random time $T$ such that $\{T = n\}$ is determined by information up to time $n$.

## Optional Stopping Theorem

**Theorem 5.13**: If $M_n$ is a supermartingale and $T$ is a stopping time, then $M_{T \wedge n}$ is a supermartingale. In particular, $E[M_{T \wedge n}] \leq E[M_0]$.

**Theorem 5.14** (Bounded optional stopping): If $M_n$ is a martingale, $T$ is a stopping time with $P(T < \infty) = 1$, and $\mid M_{T \wedge n} \mid \leq K$ for all $n$, then

$$
E[M_T] = E[M_0]
$$

This is the primary tool for computing hitting probabilities and exit times.

## Applications to Random Walks

- **Exit distribution** (symmetric random walk): For $S_n$ with $P(X_i = \pm 1) = 1/2$ and $\tau = \min\{n : S_n \notin (a, b)\}$:

$$
P_x(S_\tau = a) = \frac{b - x}{b - a}
$$

- **Gambler's ruin** (biased walk, $p > 1/2$): Using the martingale $h(S_n) = (q/p)^{S_n}$:

$$
P_x(S_\tau = a) = \frac{(q/p)^b - (q/p)^x}{(q/p)^b - (q/p)^a}
$$

- **Expected duration** (symmetric walk): Using $S_n^2 - n$ as a martingale, $E_0[\tau] = -ab$ for exit from $(a, b)$.

- **Wald's equation**: If $T$ is a stopping time with $E[T] < \infty$ and $S_n = S_0 + X_1 + \cdots + X_n$ where $E[X_i] = \mu$, then $E[S_T - S_0] = \mu \cdot E[T]$.

- **Cramer's ruin estimate**: For an insurance company with normally distributed annual surplus (mean $\mu > 0$, variance $\sigma^2$), the probability of eventual ruin satisfies $P(\text{ruin}) \leq \exp(-2\mu S_0 / \sigma^2)$.

## Martingale Convergence Theorem

**Theorem 5.17**: If $X_n \geq 0$ is a supermartingale, then $X_\infty = \lim_{n \to \infty} X_n$ exists (a.s.) and $E[X_\infty] \leq E[X_0]$.

- Proved via **upcrossing inequalities** — the number of times $X_n$ crosses from below $a$ to above $b$ is finite a.s.
- **Maximal inequality** (Lemma 5.18): $P(\max_{n \geq 0} X_n > \epsilon) \leq E[X_0] / \epsilon$.

## Relevance

- Provides the theoretical foundation for the risk-neutral pricing framework in [[SP Textbook — Ch. 6 Mathematical Finance]].
- Generalizes the first-step analysis methods used in [[Markov Chains]] and [[Recurrence and Transience]].
- The optional stopping theorem is the primary tool for computing exit distributions and expected hitting times.

## See Also

- [[Martingale]]
- [[Black-Scholes Formula]]
- [[SP Textbook — Ch. 6 Mathematical Finance]]
- [[Markov Chains]]
- [[Poisson Process]]
