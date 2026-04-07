---
title: "Martingale"
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, martingales, probability]
sources: [sp_ch5, sp_ch6]
---

# Martingale

A **martingale** is a stochastic process whose conditional expected future value, given all past information, equals the present value. Intuitively, a martingale models a "fair game" — one in which knowledge of the past does not help predict the direction of future changes.

## Definition

Let $(M_n)_{n \geq 0}$ be a stochastic process adapted to a filtration $(\mathcal{F}_n)$. The process is a **martingale** if:

1. $E[\mid M_n \mid] < \infty$ for all $n$, and
2. $E[M_{n+1} \mid \mathcal{F}_n] = M_n$ for all $n \geq 0$.

### Related Processes

- **Supermartingale**: $E[M_{n+1} \mid \mathcal{F}_n] \leq M_n$ (expected value tends to decrease — models an unfavorable game).
- **Submartingale**: $E[M_{n+1} \mid \mathcal{F}_n] \geq M_n$ (expected value tends to increase — models a favorable game).

A process is a martingale if and only if it is both a supermartingale and a submartingale.

## Key Properties

- **Constant expectation**: If $M_n$ is a martingale, then $E[M_n] = E[M_0]$ for all $n$.
- **Orthogonal increments**: $E[(M_n - M_k)(M_j - M_i)] = 0$ for $0 \leq i \leq j \leq k < n$.
- **Variance decomposition**: $E[(M_n - M_0)^2] = \sum_{k=1}^{n} E[(M_k - M_{k-1})^2]$.

## Important Examples

### Partial Sums of Mean-Zero Random Variables

If $X_1, X_2, \ldots$ are independent with $E[X_i] = 0$, then

$$
S_n = X_1 + X_2 + \cdots + X_n
$$

is a martingale with respect to $(X_1, \ldots, X_n)$.

### Quadratic Martingale

If additionally $\text{Var}(X_i) = \sigma^2$, then

$$
S_n^2 - n\sigma^2
$$

is a martingale. This is used to compute expected exit times for random walks (Source: [[SP Textbook — Ch. 5 Martingales]]).

### Exponential Martingale

If $\phi(\theta) = E[e^{\theta X_i}]$ is the moment generating function and $\theta$ is chosen so that $\phi(\theta) = 1$, then

$$
e^{\theta S_n}
$$

is a martingale. This is the key tool for Cramer's ruin estimate in insurance mathematics.

### Doob Martingale

Given any random variable $Y$ with $E[\mid Y \mid] < \infty$ and a filtration $(\mathcal{F}_n)$, the process

$$
M_n = E[Y \mid \mathcal{F}_n]
$$

is a martingale. This is fundamental in the theory of conditional expectations.

### Polya's Urn

An urn starts with one red and one green ball. At each step, draw a ball, return it, and add one of the same color. The fraction of red balls $X_n$ is a non-negative martingale, so by the convergence theorem $X_n \to X_\infty$ a.s.

### Branching Process

If $(Z_n)$ is a Galton-Watson process with mean offspring $\mu$, then $Z_n / \mu^n$ is a martingale.

## Gambling Strategies

An **admissible gambling strategy** is a predictable process $H_n$ (determined by information available before time $n$) with $H_n \geq 0$.

**Theorem** ("You can't beat an unfavorable game"): If $M_n$ is a supermartingale and $H_n$ is a bounded, non-negative predictable process, then the wealth process

$$
W_n = W_0 + \sum_{m=1}^{n} H_m (M_m - M_{m-1})
$$

is also a supermartingale. This formalizes the impossibility of a winning strategy for unfavorable games — the doubling strategy fails because the rare catastrophic losses exactly offset the frequent small wins.

## Optional Stopping Theorem

A **stopping time** $T$ is a random variable such that $\{T = n\}$ is determined by $\mathcal{F}_n$.

**Theorem (Bounded Optional Stopping)**: If $M_n$ is a martingale, $T$ is a stopping time with $P(T < \infty) = 1$, and $\mid M_{T \wedge n} \mid \leq K$ for some constant $K$ and all $n$, then

$$
E[M_T] = E[M_0]
$$

This theorem is the primary computational tool for solving hitting probability and exit time problems. It also generalizes: for supermartingales $E[M_T] \leq E[M_0]$, and for submartingales $E[M_T] \geq E[M_0]$.

**Warning**: The boundedness condition is essential. Without it, $E[M_T] = E[M_0]$ can fail (e.g., symmetric random walk starting at $1$ with $T = \min\{n : S_n = 0\}$ gives $E[S_T] = 0 \neq 1$).

## Martingale Convergence Theorem

**Theorem**: If $X_n \geq 0$ is a supermartingale, then $X_\infty = \lim_{n \to \infty} X_n$ exists almost surely and $E[X_\infty] \leq E[X_0]$.

The proof relies on the **maximal inequality**: for $\epsilon > 0$,

$$
P\!\left(\max_{n \geq 0} X_n > \epsilon\right) \leq \frac{E[X_0]}{\epsilon}
$$

and **upcrossing bounds** — the number of times $X_n$ crosses from below $a$ to above $b$ is finite a.s.

## Connection to Finance

In mathematical finance, the risk-neutral pricing framework is built on martingale theory. Under the risk-neutral measure $P^*$, the discounted stock price $S_n / (1+r)^n$ is a martingale, and the fair price of any derivative equals its discounted expected payoff under $P^*$ (Source: [[SP Textbook — Ch. 6 Mathematical Finance]]).

## Worked Examples

### Example 1: Gambler's Ruin via Martingale Argument

**Problem**: A gambler starts with $x$ and plays a fair coin-flip game ($p = q = 1/2$), winning or losing $1$ each round. She stops when her fortune hits $0$ (ruin) or $b$ (target). What is $P_x(\text{ruin})$?

**Solution**: Let $S_n$ be the gambler's fortune at time $n$. Since the game is fair, $S_n$ is a martingale. Let $\tau = \min\{n : S_n \in \{0, b\}\}$. This is a stopping time, and $\mid S_{\tau \wedge n} \mid \leq b$ for all $n$ (the fortune stays in $[0, b]$). By the optional stopping theorem:

$$
E_x[S_\tau] = E_x[S_0] = x
$$

Since $S_\tau \in \{0, b\}$:

$$
x = 0 \cdot P_x(S_\tau = 0) + b \cdot P_x(S_\tau = b) = b \cdot P_x(S_\tau = b)
$$

Therefore:

$$
P_x(S_\tau = b) = \frac{x}{b}, \qquad P_x(\text{ruin}) = P_x(S_\tau = 0) = 1 - \frac{x}{b} = \frac{b - x}{b}
$$

For example, starting with $20$ and target $100$, the ruin probability is $80/100 = 0.80$.

**Expected duration**: Using the martingale $S_n^2 - n$, the optional stopping theorem gives $E_x[S_\tau^2 - \tau] = x^2$, so

$$
E_x[\tau] = E_x[S_\tau^2] - x^2 = b^2 \cdot \frac{x}{b} + 0 \cdot \frac{b - x}{b} - x^2 = bx - x^2 = x(b - x)
$$

With $x = 20$ and $b = 100$: $E[\tau] = 20 \cdot 80 = 1600$ rounds.

### Example 2: Biased Gambler's Ruin via Exponential Martingale

**Problem**: Suppose $p = 0.6$ and $q = 0.4$ (favorable game). The gambler starts at $x = 5$ and plays until hitting $0$ or $b = 20$. Find $P_5(\text{ruin})$.

**Solution**: Since $p \neq 1/2$, the sum $S_n$ is not a martingale. Instead, use the exponential martingale: $M_n = (q/p)^{S_n} = (2/3)^{S_n}$ is a martingale (since $E[(q/p)^{X_i}] = p \cdot (q/p) + q \cdot (p/q) = q + p = 1$).

Let $\tau = \min\{n : S_n \in \{0, 20\}\}$. Since $P(\tau < \infty) = 1$ and $\mid M_{\tau \wedge n} \mid \leq (q/p)^0 = 1$ (bounded), the optional stopping theorem gives:

$$
\left(\frac{2}{3}\right)^5 = E_5\!\left[\left(\frac{2}{3}\right)^{S_\tau}\right] = \left(\frac{2}{3}\right)^0 P_5(S_\tau = 0) + \left(\frac{2}{3}\right)^{20} P_5(S_\tau = 20)
$$

Let $\rho = (2/3)$. Then:

$$
\rho^5 = P_5(\text{ruin}) + \rho^{20}(1 - P_5(\text{ruin}))
$$

$$
P_5(\text{ruin}) = \frac{\rho^5 - \rho^{20}}{1 - \rho^{20}} = \frac{(2/3)^5 - (2/3)^{20}}{1 - (2/3)^{20}}
$$

Computing: $(2/3)^5 \approx 0.1317$, $(2/3)^{20} \approx 0.000261$, so

$$
P_5(\text{ruin}) \approx \frac{0.1317 - 0.000261}{1 - 0.000261} \approx 0.1315
$$

The favorable odds reduce the ruin probability dramatically from $75\%$ (fair game) to about $13.2\%$.

## See Also

- [[SP Textbook — Ch. 5 Martingales]]
- [[SP Textbook — Ch. 6 Mathematical Finance]]
- [[Black-Scholes Formula]]
- [[Markov Chains]]
- [[Recurrence and Transience]]
- [[Poisson Process]]
