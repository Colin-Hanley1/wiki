---
title: "SP Textbook — Ch. 6 Mathematical Finance"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, mathematical-finance, options, textbook, durrett]
sources: [sp_ch6]
---

# SP Textbook — Ch. 6 Mathematical Finance

**Source**: Durrett, R. *Essentials of Stochastic Processes*, 2nd ed., Springer, 2012. Chapter 6.

## Overview

Chapter 6 applies martingale theory from Ch. 5 to the pricing of financial derivatives. The central idea is **risk-neutral pricing**: in an arbitrage-free market, the fair price of an option equals its expected payoff under a special "risk-neutral" probability measure, discounted at the risk-free rate.

## Binomial Asset Pricing Model

A stock has price $S_n$ at time $n$. At each step the price either goes up by factor $u$ or down by factor $d$:

$$
S_{n+1} = \begin{cases} u \cdot S_n & \text{with probability } p \\ d \cdot S_n & \text{with probability } 1-p \end{cases}
$$

where $d < 1 + r < u$ to prevent arbitrage ($r$ is the risk-free interest rate per period).

### Risk-Neutral Probability

The **risk-neutral probability** $p^*$ is defined so that the discounted stock price $S_n / (1+r)^n$ is a [[Martingale]] under $p^*$:

$$
p^* = \frac{1 + r - d}{u - d}
$$

Under $p^*$, the expected return on the stock equals the risk-free rate: $E^*[S_{n+1} \mid S_n] = (1+r) S_n$.

### Option Pricing Recursion

The value $V_n$ of any derivative at time $n$ satisfies the backward recursion:

$$
V_n = \frac{1}{1+r} \bigl[ p^* \, V_{n+1}(\text{up}) + (1 - p^*) \, V_{n+1}(\text{down}) \bigr]
$$

This is the **discounted expected value under the risk-neutral measure**.

### Replicating Strategy

The number of shares $\delta_n$ to hold for a perfect hedge is:

$$
\delta_n = \frac{V_{n+1}(\text{up}) - V_{n+1}(\text{down})}{S_{n+1}(\text{up}) - S_{n+1}(\text{down})}
$$

**Theorem 6.3**: Starting with wealth $W_0 = V_0$ and following the replicating strategy, $W_n = V_n$ at all times — the strategy exactly replicates the option payoff.

### Key Martingale Results

- **Theorem 6.4**: Under $P^*$, the discounted stock price $S_n / (1+r)^n$ is a martingale.
- **Theorem 6.5**: Under $P^*$, the discounted wealth $W_n / (1+r)^n$ is a martingale, so $V_0 = E^*[V_N / (1+r)^N]$.

## European Options

- **European call**: Payoff $(S_N - K)^+$ at expiration $N$, strike $K$.
- **European put**: Payoff $(K - S_N)^+$ at expiration $N$.

### Put-Call Parity

**Theorem 6.6**: For European call $C$ and put $P$ with the same strike $K$ and expiration $N$:

$$
P - C = \frac{K}{(1+r)^N} - S_0
$$

In particular, if $K = (1+r)^N S_0$, then $P = C$.

## Concrete Examples

Durrett works through detailed binomial tree calculations with $u = 2$, $d = 1/2$, $r = 1/4$ (giving $p^* = 1/2$):

- **Callback option**: Payoff $\max_{0 \leq m \leq 3} S_m - S_3$ (path-dependent).
- **Put option**: $V_3 = (10 - S_3)^+$ with $S_0 = 8$; value $V_0 = 1.728$.
- **Put-call parity example**: $S_0 = 32$, $u = 3/2$, $d = 2/3$, $r = 1/6$, strike $49$, expiry $2$.
- **Knockout option**: Call $(S_3 - 28)^+$ with barrier at $20$; any path touching $S_n < 20$ kills the option.

## American Options

American options can be exercised at any time $n \leq N$, not just at expiration. The holder faces an **optimal stopping problem**: choose the stopping time $T$ to maximize $E^*[V_T / (1+r)^T]$. The American option value is at least as large as the European value.

## Black-Scholes Formula

As the number of periods $N \to \infty$ while the time step $\Delta t = T/N \to 0$, the binomial model converges to the continuous-time [[Black-Scholes Formula]]:

$$
C = S_0 \Phi(d_1) - K e^{-rT} \Phi(d_2)
$$

where

$$
d_1 = \frac{\ln(S_0 / K) + (r + \sigma^2/2)T}{\sigma \sqrt{T}}, \qquad d_2 = d_1 - \sigma\sqrt{T}
$$

and $\Phi$ is the standard normal CDF. This is derived by taking a central limit theorem on the binomial log-returns.

## Capital Asset Pricing Model (CAPM)

The CAPM section introduces utility-based portfolio optimization:

- **Utility function**: Nondecreasing, concave $U$ (risk-averse investors prefer certain outcomes).
- **Optimal investment**: Maximize $E[U(W_N)]$ over admissible trading strategies $\delta_n$.
- Common utility functions: $U_p(x) = x^p / p$ for $0 < p < 1$ (power), $U_0(x) = \ln x$ (log), $U_p(x) = x^p / p$ for $p < 0$.
- Optimization under the **real-world** (physical) measure, not the risk-neutral measure.

## Relevance

- Risk-neutral pricing is the conceptual bridge between [[Martingale]] theory and practical derivative pricing.
- The binomial model provides a discrete, constructive framework for understanding continuous-time results like [[Black-Scholes Formula]].
- Replicating strategies and no-arbitrage arguments are foundational to modern quantitative finance.

## See Also

- [[SP Textbook — Ch. 5 Martingales]]
- [[Martingale]]
- [[Black-Scholes Formula]]
- [[Markov Chains]]
