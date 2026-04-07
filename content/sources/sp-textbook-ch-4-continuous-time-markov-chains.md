---
title: "SP Textbook — Ch. 4 Continuous Time Markov Chains"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, ctmc, markov-chains, queues, textbook]
sources: [sp_ch4]
---

# SP Textbook — Ch. 4 Continuous Time Markov Chains

**Source**: Durrett, R. *Essentials of Stochastic Processes*, 2nd ed., Springer, 2012. Chapter 4.

## Overview

This chapter extends the theory of [[Markov Chains]] from discrete time to continuous time. The key structural insight is that a [[Continuous Time Markov Chain]] can be decomposed into an **embedded (jump) chain** governing where the process goes, and **exponential holding times** governing how long it stays.

## Key Concepts

### Definition and Construction

A CTMC $\{X_t : t \ge 0\}$ on state space $S$ is characterized by:

- **Holding times**: In state $i$, the chain waits an $\text{Exp}(\lambda_i)$ time before jumping.
- **Jump chain**: Upon leaving $i$, the chain moves to $j \ne i$ with probability $r(i,j) = q(i,j)/\lambda_i$.
- **Jump rates**: $q(i,j)$ gives the rate of transitions from $i$ to $j$ (for $j \ne i$).
- **Total rate**: $\lambda_i = \sum_{j \ne i} q(i,j)$.

### The Q-Matrix (Rate Matrix / Generator)

The matrix $Q$ is defined by:

$$
Q(i,j) = \begin{cases} q(i,j) & \text{if } j \ne i \\ -\lambda_i & \text{if } j = i \end{cases}
$$

Each row sums to zero. Off-diagonal entries are nonnegative; diagonal entries are nonpositive.

### Kolmogorov Equations

Let $p_t(i,j) = P(X_t = j \mid X_0 = i)$. The transition probabilities satisfy two differential equations:

- **Backward equation**: $P'(t) = Q \, P(t)$
- **Forward equation**: $P'(t) = P(t) \, Q$

Both are solved by the matrix exponential:

$$
P(t) = e^{Qt} = \sum_{n=0}^{\infty} \frac{(Qt)^n}{n!}
$$

The two equations are consistent because $Q$ commutes with $e^{Qt}$.

### Examples of Computing Transition Probabilities

- **[[Poisson Process]]**: $q(i, i+1) = \lambda$. Transition probability $p_t(i,j) = e^{-\lambda t} (\lambda t)^{j-i}/(j-i)!$ for $j \ge i$.
- **Two-state chain**: States $\{1,2\}$ with rates $\alpha, \beta$. Converges exponentially to equilibrium $\pi(1) = \beta/(\alpha + \beta)$.
- **Yule process**: Pure birth with $q(i, i+1) = \beta i$. Starting from 1, gives geometric distribution at time $t$.

### Limiting Behavior and Stationary Distributions

A CTMC is **irreducible** if for any two states $i, j$ there is a path of positive-rate transitions from $i$ to $j$. For irreducible chains, $p_t(i,j) > 0$ for all $t > 0$ (no periodicity issues in continuous time).

A distribution $\pi$ is **stationary** if and only if $\pi Q = 0$, i.e., for each state $j$:

$$
\sum_{k \ne j} \pi(k) \, q(k,j) = \pi(j) \, \lambda_j
$$

This says: rate of flow into $j$ equals rate of flow out of $j$.

**Convergence theorem**: If the CTMC is irreducible with stationary distribution $\pi$, then $\lim_{t \to \infty} p_t(i,j) = \pi(j)$.

**Detailed balance**: $\pi(k) q(k,j) = \pi(j) q(j,k)$ for all $j \ne k$ implies $\pi$ is stationary.

### Birth-Death Processes

See [[Birth-Death Process]]. Special CTMCs with transitions only to adjacent states:

$$
q(n, n+1) = \lambda_n, \quad q(n, n-1) = \mu_n
$$

Stationary distribution via detailed balance:

$$
\pi(n) = \pi(0) \prod_{k=0}^{n-1} \frac{\lambda_k}{\mu_{k+1}}
$$

Examples: barbershop chain, machine repair model.

### Exit Distributions and Hitting Times

For hitting time $V_A = \min\{t : X_t \in A\}$:

- **Exit distribution**: $h(i) = P_i(X(V_A) = a)$ satisfies $\sum_j Q(i,j) h(j) = 0$ for $i \notin A$.
- **Expected hitting time**: $g(i) = E_i[V_A]$ satisfies $\sum_j Q(i,j) g(j) = -1$ for $i \notin A$, i.e., $g = -R^{-1} \mathbf{1}$ where $R$ is the restriction of $Q$ to $A^c$.

### Markovian Queues

- **M/M/1 queue**: Birth rates $\lambda_n = \lambda$, death rates $\mu_n = \mu$. Stable when $\rho = \lambda/\mu < 1$; stationary distribution is geometric.
- **M/M/s queue with balking**: $s$ servers, customers balk (refuse to join) with probability depending on queue length. Stationary distribution exists if balking probability $a_n \to 0$.
- **M/M/1 queue hitting times**: $E_1[T_0] = 1/(\mu - \lambda)$ when $\lambda < \mu$.

## Relation to Discrete-Time Theory

The jump chain (embedded chain) of a CTMC is a discrete-time [[Markov Chains|Markov chain]] with transition matrix $r(i,j) = q(i,j)/\lambda_i$. Many results (exit distributions, recurrence classification) transfer directly from the jump chain; the continuous-time holding times affect expected hitting times but not exit probabilities.

## See Also

- [[Continuous Time Markov Chain]]
- [[Birth-Death Process]]
- [[Markov Chains]]
- [[Poisson Process]]
- [[Stationary Distributions]]
