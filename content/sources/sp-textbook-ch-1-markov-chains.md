---
title: "SP Textbook — Ch. 1 Markov Chains"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, markov-chains, textbook]
sources: [sp_ch1]
---

# SP Textbook — Ch. 1 Markov Chains

**Source**: Durrett, R. *Essentials of Stochastic Processes*, 2nd ed., Springer, 2012. Chapter 1.

## Overview

Chapter 1 develops the theory of discrete-time [[Markov Chains]] on finite and countable state spaces. The treatment progresses from definitions through classification of states, stationary distributions, convergence, and applications including [[Detailed Balance]], the [[Metropolis-Hastings Algorithm]], [[Exit Distributions and Times]], and gambler's ruin.

## Key Definitions

- **Markov property**: $P(X_{n+1} = j \mid X_n = i, X_{n-1}, \ldots, X_0) = P(X_{n+1} = j \mid X_n = i) = p(i,j)$.
- **Transition matrix**: $p(i,j) \geq 0$ with $\sum_j p(i,j) = 1$ for all $i$.
- **$m$-step transition probability**: $p^m(i,j) = P(X_{n+m} = j \mid X_n = i)$, equal to the $(i,j)$ entry of $p^m$.

## Multistep Transitions and Chapman-Kolmogorov

**Theorem 1.1.** The $m$-step transition probability $P(X_{n+m} = j \mid X_n = i)$ is given by the $m$th power of the transition matrix.

**Chapman-Kolmogorov equation:**

$$
p^{m+n}(i,j) = \sum_k p^m(i,k)\, p^n(k,j)
$$

## Classification of States

- **First return time**: $T_y = \min\{n \geq 1 : X_n = y\}$.
- **Return probability**: $\rho_{yy} = P_y(T_y < \infty)$.
- **Recurrent**: $\rho_{yy} = 1$ (returns infinitely often).
- **Transient**: $\rho_{yy} < 1$ (eventually leaves forever).
- **Communication**: $x \to y$ if $P_x(T_y < \infty) > 0$. States that communicate both ways ($x \leftrightarrow y$) belong to the same communicating class.

**Strong Markov property (Theorem 1.2).** Given stopping time $T = n$ and $X_T = y$, the future $X_{T+k}$ behaves as a Markov chain started from $y$, independent of $X_0, \ldots, X_T$.

**Theorem 1.5.** If $\rho_{xy} > 0$ but $\rho_{yx} < 1$, then $x$ is transient.

**Theorem 1.7.** If $C$ is a finite closed and irreducible set, then all states in $C$ are recurrent.

**Theorem 1.8 (Decomposition).** A finite state space $S$ decomposes as $T \cup R_1 \cup \cdots \cup R_k$, where $T$ is a set of transient states and each $R_i$ is a closed irreducible set of recurrent states.

**Theorem 1.13.** $y$ is recurrent if and only if $\sum_{n=1}^{\infty} p^n(y,y) = \infty$.

### Periodicity

The **period** of state $x$ is $\gcd\{n \geq 1 : p^n(x,x) > 0\}$. A state is **aperiodic** if its period is 1. If $p(x,x) > 0$, then $x$ is aperiodic (Lemma 1.17). Communicating states share the same period (Lemma 1.18).

## Stationary Distributions

A row vector $\pi$ is a **stationary distribution** if $\pi p = \pi$ and $\sum_x \pi(x) = 1$.

**Theorem 1.14.** If $p$ is irreducible (on a finite state space), then there is a unique stationary distribution with $\pi(x) > 0$ for all $x$.

### Computing Stationary Distributions

For a two-state chain with off-diagonal entries $a$ (from 1 to 2) and $b$ (from 2 to 1):

$$
\pi(1) = \frac{b}{a+b}, \quad \pi(2) = \frac{a}{a+b}
$$

For larger chains, solve $\pi(I - p)^T = 0$ subject to $\sum_x \pi(x) = 1$, or equivalently use the matrix inversion method described in the text.

## Limit Behavior

The key assumptions:
- **I**: $p$ is irreducible.
- **A**: All states are aperiodic.
- **R**: All states are recurrent.
- **S**: A stationary distribution $\pi$ exists.

**Theorem 1.19 (Convergence).** Suppose I, A, S. Then $p^n(x,y) \to \pi(y)$ as $n \to \infty$.

**Theorem 1.21 (Asymptotic frequency).** Suppose I, R. Then $N_n(y)/n \to 1/E_y T_y$.

**Theorem 1.22.** If I and S hold, then $\pi(y) = 1/E_y T_y$, and the stationary distribution is unique.

**Theorem 1.23 (Ergodic theorem).** Suppose I, S, and $\sum_x |f(x)|\pi(x) < \infty$. Then

$$
\frac{1}{n} \sum_{m=1}^{n} f(X_m) \to \sum_x f(x)\pi(x)
$$

## Special Examples

### Doubly Stochastic Chains

A transition matrix is **doubly stochastic** if columns also sum to 1. In this case the uniform distribution $\pi(x) = 1/N$ is stationary (Theorem 1.24).

### Detailed Balance

The [[Detailed Balance]] condition $\pi(x)p(x,y) = \pi(y)p(y,x)$ for all $x,y$ implies $\pi$ is stationary. Birth-and-death chains and random walks on graphs satisfy detailed balance. See the dedicated concept page.

### Reversibility

If $\pi$ satisfies detailed balance, the reversed chain $\hat{p}(i,j) = \pi(j)p(j,i)/\pi(i)$ equals the original chain --- the chain is **reversible** (Theorem 1.25).

### Metropolis-Hastings Algorithm

The [[Metropolis-Hastings Algorithm]] constructs a chain with a desired stationary distribution $\pi$ by accepting proposed moves with probability $\min(1, \pi(y)q(y,x)/(\pi(x)q(x,y)))$. The resulting chain satisfies detailed balance. See the dedicated concept page.

## Exit Distributions

For absorbing states $a, b$ and transient states $C = S - \{a,b\}$, the hitting probability $h(x) = P_x(V_a < V_b)$ satisfies:

$$
h(x) = \sum_y p(x,y)\, h(y) \quad \text{for } x \in C
$$

with boundary conditions $h(a) = 1$, $h(b) = 0$ (Theorem 1.27). See [[Exit Distributions and Times]].

### Gambler's Ruin Probability

For the gambler's ruin with win probability $p \neq 1/2$ and $\gamma = q/p$:

$$
P_x(V_N < V_0) = \frac{\gamma^x - 1}{\gamma^N - 1}
$$

When $p = 1/2$: $P_x(V_N < V_0) = x/N$.

## Exit Times

The expected time to absorption $g(x) = E_x(V_A)$ satisfies:

$$
g(x) = 1 + \sum_y p(x,y)\, g(y) \quad \text{for } x \in C
$$

with $g(a) = 0$ for $a \in A$ (Theorem 1.28). In matrix form: $g = (I - r)^{-1} \mathbf{1}$, where $r$ is the restriction of $p$ to transient states.

### Duration of Fair Games

For the symmetric gambler's ruin ($p = 1/2$) on $\{0, \ldots, N\}$:

$$
E_x \tau = x(N - x)
$$

### Duration of Non-Fair Games

For $p \neq q$ with $\gamma = q/p$:

$$
E_x \tau = \frac{x}{q - p} - \frac{N}{q - p} \cdot \frac{1 - \gamma^x}{1 - \gamma^N}
$$

## Motivating Examples

The chapter introduces several running examples:
- **Weather chain**: Two-state (rainy/sunny), illustrates stationary distributions.
- **Social mobility**: Three-class model, illustrates computing $\pi$ via matrix methods.
- **Gambler's ruin**: Absorbing states, transience, exit distributions and times.
- **Ehrenfest chain**: Birth-death chain, periodicity, detailed balance with binomial stationary distribution.
- **Inventory chain**: $s,S$ policy optimization using the ergodic theorem.
- **Branching processes** and **Wright-Fisher model**: Countable/finite population genetics models.

## See Also

- [[Markov Chains]]
- [[Stationary Distributions]]
- [[Recurrence and Transience]]
- [[Detailed Balance]]
- [[Metropolis-Hastings Algorithm]]
- [[Exit Distributions and Times]]
- [[Poisson Process]]
