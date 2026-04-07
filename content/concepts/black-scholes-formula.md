---
title: "Black-Scholes Formula"
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, mathematical-finance, options, black-scholes]
sources: [sp_ch6]
---

# Black-Scholes Formula

The **Black-Scholes formula** gives the theoretical price of a European option on a non-dividend-paying stock. It arises as the continuous-time limit of the binomial option pricing model and is one of the most important results in mathematical finance.

## Setup

Consider a stock with current price $S_0$, a European option with strike price $K$ and time to expiration $T$, a risk-free interest rate $r$ (continuously compounded), and stock volatility $\sigma$ (annualized standard deviation of log-returns).

## European Call Price

The price of a European call option is:

$$
C = S_0 \, \Phi(d_1) - K e^{-rT} \Phi(d_2)
$$

where $\Phi$ is the cumulative distribution function of the standard normal distribution and:

$$
d_1 = \frac{\ln(S_0 / K) + (r + \sigma^2 / 2)\,T}{\sigma \sqrt{T}}
$$

$$
d_2 = d_1 - \sigma\sqrt{T} = \frac{\ln(S_0 / K) + (r - \sigma^2 / 2)\,T}{\sigma \sqrt{T}}
$$

## European Put Price

By **put-call parity**, the price of a European put is:

$$
P = K e^{-rT} \Phi(-d_2) - S_0 \, \Phi(-d_1)
$$

## Put-Call Parity

For European options with the same strike $K$ and expiration $T$:

$$
C - P = S_0 - K e^{-rT}
$$

This identity holds model-free (it follows from no-arbitrage alone) and provides a quick way to compute one option price from the other.

## Derivation as Limit of Binomial Model

In the $N$-period binomial model, set up parameters so that the per-period returns match the continuous-time stock dynamics as $\Delta t = T/N \to 0$:

$$
u = e^{\sigma\sqrt{\Delta t}}, \qquad d = e^{-\sigma\sqrt{\Delta t}}, \qquad r_{\Delta t} = e^{r\Delta t} - 1
$$

The risk-neutral probability is $p^* = (1 + r_{\Delta t} - d) / (u - d)$. The binomial option price is:

$$
V_0 = \frac{1}{(1 + r_{\Delta t})^N} \sum_{k=0}^{N} \binom{N}{k} (p^*)^k (1-p^*)^{N-k} (S_0 u^k d^{N-k} - K)^+
$$

As $N \to \infty$, the binomial distribution of log-returns converges (by the central limit theorem) to a normal distribution, and this sum converges to $C = S_0\Phi(d_1) - Ke^{-rT}\Phi(d_2)$ (Source: [[SP Textbook — Ch. 6 Mathematical Finance]]).

## Interpretation of Terms

- $\Phi(d_2)$ is the risk-neutral probability that the option expires in the money ($S_T > K$).
- $Ke^{-rT}\Phi(d_2)$ is the present value of paying the strike, weighted by the probability of exercise.
- $S_0\Phi(d_1)$ is the present value of receiving the stock, weighted by a probability measure that tilts toward higher stock prices.
- $\delta = \Phi(d_1)$ is the **delta** of the call — the number of shares to hold for a replicating hedge.

## The Greeks

The **Greeks** measure the sensitivity of the option price to changes in underlying parameters.

| Greek | Symbol | Definition | Call Value |
|-------|--------|-----------|------------|
| Delta | $\Delta$ | $\partial C / \partial S_0$ | $\Phi(d_1)$ |
| Gamma | $\Gamma$ | $\partial^2 C / \partial S_0^2$ | $\phi(d_1) / (S_0 \sigma \sqrt{T})$ |
| Theta | $\Theta$ | $\partial C / \partial T$ | (complex expression) |
| Vega | $\mathcal{V}$ | $\partial C / \partial \sigma$ | $S_0 \phi(d_1) \sqrt{T}$ |
| Rho | $\rho$ | $\partial C / \partial r$ | $K T e^{-rT} \Phi(d_2)$ |

Here $\phi$ denotes the standard normal PDF. Delta and gamma are central to hedging: a delta-neutral portfolio has $\Delta = 0$ (first-order insensitivity to stock price movements).

## Assumptions and Limitations

The Black-Scholes formula assumes:
- No dividends during the option's life.
- Constant volatility $\sigma$ and risk-free rate $r$.
- Log-normal stock price dynamics (geometric Brownian motion).
- No transaction costs or taxes.
- Continuous trading is possible.

In practice, these assumptions are violated. Implied volatility varies by strike and maturity (the "volatility smile/skew"), and more sophisticated models (stochastic volatility, jump-diffusion) are used.

## Connection to [[Martingale]] Theory

Under the risk-neutral measure $P^*$, the discounted stock price $S_t e^{-rt}$ is a [[Martingale]]. The option price is the discounted expected payoff:

$$
C = e^{-rT} E^*[(S_T - K)^+]
$$

The martingale property ensures the replicating strategy produces a self-financing portfolio that matches the option payoff at expiration (Source: [[SP Textbook — Ch. 5 Martingales]]).

## Worked Examples

### Example 1: Pricing a European Call

**Problem**: A stock trades at $S_0 = 100$. Price a European call with strike $K = 105$, expiration $T = 0.5$ years, risk-free rate $r = 0.05$, and volatility $\sigma = 0.20$.

**Solution**: Compute $d_1$ and $d_2$:

$$
d_1 = \frac{\ln(100/105) + (0.05 + 0.02)\cdot 0.5}{0.20\sqrt{0.5}} = \frac{-0.04879 + 0.035}{0.14142} = \frac{-0.01379}{0.14142} \approx -0.0975
$$

$$
d_2 = -0.0975 - 0.20\sqrt{0.5} = -0.0975 - 0.14142 \approx -0.2390
$$

Look up normal CDF values: $\Phi(-0.0975) \approx 0.4612$ and $\Phi(-0.2390) \approx 0.4055$.

Compute the call price:

$$
C = 100 \cdot 0.4612 - 105 \cdot e^{-0.025} \cdot 0.4055
$$

$$
= 46.12 - 105 \cdot 0.9753 \cdot 0.4055
$$

$$
= 46.12 - 41.51 \approx 4.61
$$

The delta of this call is $\Delta = \Phi(d_1) \approx 0.461$, meaning the replicating portfolio holds about $0.461$ shares per call.

### Example 2: Put-Call Parity and Put Pricing

**Problem**: Using the same parameters as Example 1 ($S_0 = 100$, $K = 105$, $T = 0.5$, $r = 0.05$, $\sigma = 0.20$), find the European put price.

**Solution**: We already computed $C \approx 4.61$. Apply put-call parity:

$$
P = C - S_0 + K e^{-rT} = 4.61 - 100 + 105 \cdot e^{-0.025}
$$

$$
= 4.61 - 100 + 105 \cdot 0.9753 = 4.61 - 100 + 102.41 \approx 7.02
$$

**Verification** (direct formula):

$$
P = K e^{-rT}\Phi(-d_2) - S_0\Phi(-d_1) = 102.41 \cdot \Phi(0.2390) - 100 \cdot \Phi(0.0975)
$$

$$
= 102.41 \cdot 0.5945 - 100 \cdot 0.5388 = 60.88 - 53.88 \approx 7.00
$$

The small difference ($$7.02 \text{ vs } $$7.00$) is due to rounding in the CDF lookups. The put is more expensive than the call because the stock price is below the strike — the option is slightly in the money.

### Example 3: Binomial Approximation

**Problem**: Using a $2$-period binomial model with $u = 2$, $d = 1/2$, $r = 1/4$, and $S_0 = 4$, price a European call with strike $K = 4$.

**Solution**: First compute $p^* = (1 + r - d)/(u - d) = (1.25 - 0.5)/(2 - 0.5) = 0.75/1.5 = 1/2$.

Build the stock tree:
- $S_0 = 4$
- $S_1(\text{H}) = 8$, $S_1(\text{T}) = 2$
- $S_2(\text{HH}) = 16$, $S_2(\text{HT}) = S_2(\text{TH}) = 4$, $S_2(\text{TT}) = 1$

Payoffs at expiration: $V_2(\text{HH}) = (16-4)^+ = 12$, $V_2(\text{HT}) = 0$, $V_2(\text{TH}) = 0$, $V_2(\text{TT}) = 0$.

Backward recursion with discount factor $1/(1+r) = 4/5$:

$$
V_1(\text{H}) = \frac{4}{5}\left[\frac{1}{2}\cdot 12 + \frac{1}{2}\cdot 0\right] = \frac{4}{5}\cdot 6 = 4.8
$$

$$
V_1(\text{T}) = \frac{4}{5}\left[\frac{1}{2}\cdot 0 + \frac{1}{2}\cdot 0\right] = 0
$$

$$
V_0 = \frac{4}{5}\left[\frac{1}{2}\cdot 4.8 + \frac{1}{2}\cdot 0\right] = \frac{4}{5}\cdot 2.4 = 1.92
$$

The fair price of the call is $$1.92$.

## See Also

- [[SP Textbook — Ch. 6 Mathematical Finance]]
- [[SP Textbook — Ch. 5 Martingales]]
- [[Martingale]]
- [[Markov Chains]]
