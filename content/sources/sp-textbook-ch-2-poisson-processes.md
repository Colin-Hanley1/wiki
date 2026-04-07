---
title: "SP Textbook — Ch. 2 Poisson Processes"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, poisson-process, exponential-distribution, textbook]
sources: [sp-textbook-ch-2-poisson-processes]
---

# SP Textbook — Ch. 2 Poisson Processes

**Source**: Durrett, R. *Essentials of Stochastic Processes*, 2nd ed., Springer, 2012. Chapter 2.

## Exponential Distribution and Memorylessness

A random variable $T$ has an **exponential distribution** with rate $\lambda$, written $T \sim \text{Exp}(\lambda)$, if

$$
P(T > t) = e^{-\lambda t}, \quad t \geq 0
$$

Key properties:

- Mean: $E[T] = 1/\lambda$; variance: $\text{Var}(T) = 1/\lambda^2$
- Density: $f_T(t) = \lambda e^{-\lambda t}$
- The sum of $n$ independent $\text{Exp}(\lambda)$ variables has a Gamma$(n, \lambda)$ distribution with density $\lambda e^{-\lambda t} (\lambda t)^{n-1} / (n-1)!$

The **memoryless property** states that for $s, t \geq 0$:

$$
P(T > s + t \mid T > s) = P(T > t) = e^{-\lambda t}
$$

The exponential is the unique continuous distribution with this property.

## Defining the Poisson Process

### Definition 1 (via inter-arrivals)

Let $\tau_1, \tau_2, \ldots$ be i.i.d. $\text{Exp}(\lambda)$ random variables. Set $T_n = \tau_1 + \cdots + \tau_n$ and $N(s) = \max\{n : T_n \leq s\}$. Then $\{N(s), s \geq 0\}$ is a **Poisson process** with rate $\lambda$.

**Lemma 2.2.** $N(s)$ has a Poisson distribution with mean $\lambda s$:

$$
P(N(s) = n) = \frac{e^{-\lambda s} (\lambda s)^n}{n!}
$$

### Definition 2 (via counting process)

$\{N(s), s \geq 0\}$ is a Poisson process with rate $\lambda$ if and only if:

1. $N(0) = 0$
2. $N(t+s) - N(s) \sim \text{Poisson}(\lambda t)$ (stationary increments)
3. $N(t)$ has **independent increments**: for $t_0 < t_1 < \cdots < t_n$, the increments $N(t_1) - N(t_0), \ldots, N(t_n) - N(t_{n-1})$ are independent

The equivalence of these two definitions is Theorem 2.7 in Durrett.

## Properties of the Poisson Distribution

If $X \sim \text{Poisson}(\lambda)$:

- **Factorial moments** (Theorem 2.3): $E[X(X-1)\cdots(X-k+1)] = \lambda^k$, hence $\text{Var}(X) = \lambda$
- **Additivity** (Theorem 2.4): if $X_i$ are independent $\text{Poisson}(\lambda_i)$, then $X_1 + \cdots + X_k \sim \text{Poisson}(\lambda_1 + \cdots + \lambda_k)$
- **Poisson approximation** (Theorem 2.8): $\text{Binomial}(n, \lambda/n) \to \text{Poisson}(\lambda)$ as $n \to \infty$

## Nonhomogeneous Poisson Processes

$\{N(s), s \geq 0\}$ is a **nonhomogeneous Poisson process** with rate function $\lambda(r)$ if:

1. $N(0) = 0$
2. $N(t)$ has independent increments
3. $N(t) - N(s) \sim \text{Poisson}\!\left(\int_s^t \lambda(r)\,dr\right)$

Inter-arrival times are no longer exponential or independent in this setting.

## Compound Poisson Processes

Associate i.i.d. random variables $Y_1, Y_2, \ldots$ (independent of $N(t)$) with each arrival. The **compound Poisson process** is $S(t) = Y_1 + \cdots + Y_{N(t)}$.

**Theorem 2.10** (Wald-type identities for random sums):

- $E[S] = E[N] \cdot E[Y_i]$
- $\text{Var}(S) = E[N]\,\text{Var}(Y_i) + \text{Var}(N)\,(E[Y_i])^2$
- When $N \sim \text{Poisson}(\lambda)$: $\text{Var}(S) = \lambda\,E[Y_i^2]$

See [[Compound Poisson Process]] for details and worked examples.

## Transformations

### Thinning (Theorem 2.11)

Keep each arrival independently with probability $p_j = P(Y_i = j)$. The resulting sub-processes $N_j(t)$ are **independent Poisson processes** with rates $\lambda p_j$.

Generalizes to the nonhomogeneous case (Theorem 2.12): keeping a point at time $s$ with probability $p(s)$ yields a nonhomogeneous Poisson process with rate $\lambda p(s)$.

### Superposition (Theorem 2.13)

If $N_1(t), \ldots, N_k(t)$ are independent Poisson processes with rates $\lambda_1, \ldots, \lambda_k$, then $N_1(t) + \cdots + N_k(t)$ is Poisson with rate $\lambda_1 + \cdots + \lambda_k$.

### Conditioning (Theorem 2.14)

Conditioned on $N(t) = n$, the arrival times $(T_1, \ldots, T_n)$ have the same distribution as the order statistics of $n$ i.i.d. $\text{Uniform}(0,t)$ random variables.

**Corollary** (Theorem 2.15): $P(N(s) = m \mid N(t) = n) = \binom{n}{m}(s/t)^m(1-s/t)^{n-m}$, i.e., $N(s) \mid N(t)=n$ is $\text{Binomial}(n, s/t)$.

## Relevance

This chapter provides the continuous-time machinery that extends the discrete-time [[Markov Chains]] framework. The [[Poisson Process]] page covers operational details; [[Compound Poisson Process]] elaborates on the random-sum extension. Thinning and superposition reappear in continuous-time Markov chain construction (Ch. 4). The [[Renewal Process]] of Ch. 3 generalizes the Poisson process by allowing non-exponential inter-arrivals.

## See Also

- [[Poisson Process]]
- [[Compound Poisson Process]]
- [[Renewal Process]]
- [[Markov Chains]]
- [[SP Textbook — Ch. 3 Renewal Processes]]
