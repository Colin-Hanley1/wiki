---
title: "Metropolis-Hastings Algorithm"
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, markov-chains, mcmc, sampling, detailed-balance]
sources: [sp_ch1]
---

# Metropolis-Hastings Algorithm

## Overview

The **Metropolis-Hastings algorithm** is a Markov chain Monte Carlo (MCMC) method for generating samples from a target distribution $\pi(x)$ that may be difficult to sample from directly. It constructs a [[Markov Chains|Markov chain]] whose stationary distribution is $\pi$ by using an easy-to-sample **proposal distribution** and an accept-reject step. The method is named after Metropolis et al. (1953) and Hastings (1970) (Source: [[SP Textbook — Ch. 1 Markov Chains]]).

## The Algorithm

**Input:** Target distribution $\pi(x)$ on state space $S$; proposal chain $q(x,y)$.

**At each step**, given current state $X_n = x$:

1. **Propose** a move to $y$ according to $q(x, y)$.
2. **Accept** the move with probability

$$
r(x, y) = \min\!\left(1,\; \frac{\pi(y)\, q(y, x)}{\pi(x)\, q(x, y)}\right)
$$

3. If accepted, set $X_{n+1} = y$. If rejected, set $X_{n+1} = x$.

The resulting transition probability is

$$
p(x, y) = q(x, y)\, r(x, y) \quad \text{for } y \neq x
$$

$$
p(x, x) = 1 - \sum_{y \neq x} q(x, y)\, r(x, y)
$$

## Why It Works: Detailed Balance

The chain satisfies [[Detailed Balance]] with respect to $\pi$. To verify, suppose without loss of generality that $\pi(y)q(y,x) > \pi(x)q(x,y)$. Then $r(x,y) = 1$ and $r(y,x) = \pi(x)q(x,y)/(\pi(y)q(y,x))$, so:

$$
\pi(x)\, p(x, y) = \pi(x)\, q(x, y) \cdot 1
$$

$$
\pi(y)\, p(y, x) = \pi(y)\, q(y, x) \cdot \frac{\pi(x)\, q(x, y)}{\pi(y)\, q(y, x)} = \pi(x)\, q(x, y)
$$

The two sides are equal, confirming detailed balance. Since detailed balance implies stationarity, $\pi$ is the [[Stationary Distributions|stationary distribution]] of the chain.

## Symmetric Proposals

When $q(x,y) = q(y,x)$ for all $x,y$ (a **symmetric** proposal), the acceptance probability simplifies to

$$
r(x, y) = \min\!\left(1,\; \frac{\pi(y)}{\pi(x)}\right)
$$

Moves to higher-probability states are always accepted; moves to lower-probability states are accepted with probability equal to the ratio $\pi(y)/\pi(x)$.

## Practical Considerations

- **Burn-in**: The chain must run long enough to approach equilibrium before samples are used.
- **Thinning**: Outputting every $k$th state reduces autocorrelation between samples.
- **Proposal tuning**: The choice of $q$ strongly affects efficiency. If steps are too small, the chain explores slowly; if too large, most proposals are rejected.
- **Normalization not needed**: Only the ratio $\pi(y)/\pi(x)$ appears, so $\pi$ need only be known up to a normalizing constant. This is critical for applications in Bayesian statistics and statistical physics.

## Applications

- **Bayesian statistics**: Sampling from posterior distributions (Tierney 1994).
- **Statistical physics**: Simulating the Ising model and other lattice models (Metropolis et al. 1953).
- **Optimization**: Simulated annealing uses Metropolis-Hastings with a temperature parameter $\beta$ that increases over time, concentrating the distribution on low-energy (optimal) configurations.

## Worked Examples

### Example 1: Sampling from a Geometric Distribution

**Target:** $\pi(x) = \lambda^x (1 - \lambda)$ for $x = 0, 1, 2, \ldots$ with $0 < \lambda < 1$.

**Proposal:** Symmetric random walk $q(x, x+1) = q(x, x-1) = 1/2$ (with $q(0, -1) = 0$, i.e., rejection at the boundary).

Since $q$ is symmetric, $r(x,y) = \min(1, \pi(y)/\pi(x))$.

**Case $x > 0$, move to $x+1$:**

$$
\frac{\pi(x+1)}{\pi(x)} = \frac{\lambda^{x+1}(1-\lambda)}{\lambda^x(1-\lambda)} = \lambda < 1
$$

So $r(x, x+1) = \lambda$ and $p(x, x+1) = \lambda/2$.

**Case $x > 0$, move to $x - 1$:**

$$
\frac{\pi(x-1)}{\pi(x)} = \frac{1}{\lambda} > 1
$$

So $r(x, x-1) = 1$ and $p(x, x-1) = 1/2$.

**Staying probability:** $p(x, x) = (1 - \lambda)/2$ for $x > 0$.

**At $x = 0$:** The proposal to $-1$ is impossible, so $p(0, 1) = \lambda/2$ and $p(0, 0) = 1 - \lambda/2$.

**Verification of detailed balance at $x \geq 0$:**

$$
\pi(x)\, p(x, x+1) = \lambda^x(1-\lambda) \cdot \frac{\lambda}{2} = \frac{\lambda^{x+1}(1-\lambda)}{2}
$$

$$
\pi(x+1)\, p(x+1, x) = \lambda^{x+1}(1-\lambda) \cdot \frac{1}{2} = \frac{\lambda^{x+1}(1-\lambda)}{2} \quad \checkmark
$$

### Example 2: Sampling from Binomial$(5, 0.3)$ with Uniform Proposals

**Target:** $\pi(x) = \binom{5}{x}(0.3)^x(0.7)^{5-x}$ for $x \in \{0, 1, 2, 3, 4, 5\}$.

**Proposal:** $q(x, y) = 1/6$ for all $x, y \in \{0, \ldots, 5\}$ (uniform, hence symmetric).

**Acceptance ratio:** $r(x, y) = \min(1, \pi(y)/\pi(x))$.

**Concrete step.** Suppose $X_n = 1$. We have

$$
\pi(1) = \binom{5}{1}(0.3)^1(0.7)^4 = 5 \cdot 0.3 \cdot 0.2401 = 0.36015
$$

Proposed move to $y = 2$:

$$
\pi(2) = \binom{5}{2}(0.3)^2(0.7)^3 = 10 \cdot 0.09 \cdot 0.343 = 0.3087
$$

$$
r(1, 2) = \min\!\left(1,\; \frac{0.3087}{0.36015}\right) = \min(1,\; 0.8571) = 0.8571
$$

So from state 1, a proposal to state 2 is accepted with probability $\approx 0.857$.

Proposed move to $y = 0$:

$$
\pi(0) = (0.7)^5 = 0.16807
$$

$$
r(1, 0) = \min\!\left(1,\; \frac{0.16807}{0.36015}\right) = 0.4667
$$

Moves toward the tails of the distribution are accepted less frequently, causing the chain to spend more time near the mode --- exactly matching the target.

**Result.** By the convergence theorem, if the chain is run for $n$ steps:

$$
\frac{1}{n}\sum_{m=1}^{n} f(X_m) \to \sum_{x=0}^{5} f(x)\,\pi(x)
$$

for any function $f$, allowing estimation of expectations under $\text{Binomial}(5, 0.3)$.

## See Also

- [[Detailed Balance]]
- [[Markov Chains]]
- [[Stationary Distributions]]
- [[SP Textbook — Ch. 1 Markov Chains]]
