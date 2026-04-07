---
title: "SP Textbook — Ch. 3 Renewal Processes"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, renewal-theory, queueing-theory, textbook]
sources: [sp-textbook-ch-3-renewal-processes]
---

# SP Textbook — Ch. 3 Renewal Processes

**Source**: Durrett, R. *Essentials of Stochastic Processes*, 2nd ed., Springer, 2012. Chapter 3.

## Renewal Process Definition

Let $t_1, t_2, \ldots$ be i.i.d. positive random variables (inter-arrival times) with distribution $F$ and mean $\mu = E[t_i]$. Set $T_n = t_1 + \cdots + t_n$ and $N(t) = \max\{n : T_n \leq t\}$. The counting process $\{N(t), t \geq 0\}$ is a **renewal process**.

When $t_i \sim \text{Exp}(\lambda)$, the renewal process reduces to a [[Poisson Process]] with rate $\lambda$.

## Laws of Large Numbers

### Elementary Renewal Theorem (Theorem 3.1)

$$
\frac{N(t)}{t} \to \frac{1}{\mu} \quad \text{as } t \to \infty
$$

The long-run rate of renewals equals $1/\mu$.

### Strong Law for Renewal Processes (Theorem 3.2)

If $f(t_1, t_2, \ldots)$ is a function satisfying the strong law conditions, then the corresponding averages converge almost surely.

### Renewal Reward Theorem (Theorem 3.3)

If $(t_i, r_i)$ are i.i.d. pairs where $r_i$ is the "reward" earned during the $i$th cycle, and $R(t) = \sum_{i=1}^{N(t)} r_i$, then

$$
\frac{R(t)}{t} \to \frac{E[r_i]}{E[t_i]} \quad \text{as } t \to \infty
$$

This is the workhorse result of the chapter; most subsequent results follow as special cases.

### Alternating Renewal Processes (Theorem 3.4)

If the process alternates between state 1 (duration $s_i$ with mean $\mu_F$) and state 2 (duration $u_i$ with mean $\mu_G$), the limiting fraction of time in state 1 is

$$
\frac{\mu_F}{\mu_F + \mu_G}
$$

This follows from the renewal reward theorem with $r_i = s_i$ and $t_i = s_i + u_i$.

## Applications to Queueing Theory

### GI∕G∕1 Queue

- **GI** = general (i.i.d.) input with mean inter-arrival time $1/\lambda$
- **G** = general i.i.d. service times with mean $1/\mu$
- **1** = single server

**Theorem 3.5.** If $\lambda < \mu$ (arrival rate below service rate), the queue empties with probability 1, and the limiting fraction of time the server is busy is $\lambda/\mu$.

**Little's Formula** (Theorem 3.6): $L = \lambda_a W$, where $L$ is the average number in the system, $W$ is the average time in the system, and $\lambda_a$ is the effective arrival rate.

**Cost equations** yield further relationships:

$$
\pi(0) = 1 - \frac{\lambda_a}{\mu}
$$

where $\pi(0)$ is the fraction of time the system is empty.

### M∕G∕1 Queue

Specializes to Poisson arrivals (rate $\lambda$) with general service distribution $G$ (mean $1/\mu$).

**PASTA** (Poisson Arrivals See Time Averages, Theorem 3.7): the fraction of arriving customers that see $n$ in the queue equals the long-run fraction of time there are $n$ in the queue.

**Pollaczek--Khintchine formula** (derived from cost-equation reasoning):

$$
W_Q = \frac{\lambda\,E[s_i^2]/2}{1 - \lambda\,E[s_i]}
$$

Then $W = W_Q + E[s_i]$ and $L = \lambda W$ by Little's formula.

## Age and Residual Life

Define the **age** $A(t) = t - T_{N(t)}$ and **residual life** $Z(t) = T_{N(t)+1} - t$.

**Theorem 3.9.** The limiting density of both age and residual life is

$$
g(z) = \frac{P(t_i > z)}{E[t_i]}
$$

The limiting expected lifetime of the item in use at time $t$ is

$$
E[L] = \frac{E[t_i^2]}{2\,E[t_i]}
$$

which exceeds $E[t_i]$ whenever $\text{Var}(t_i) > 0$.

## Inspection Paradox

The **inspection paradox** observes that the lifetime $L(t) = A(t) + Z(t)$ of the item in use at an arbitrary time $t$ is stochastically larger than a typical inter-arrival time:

$$
\frac{E[t_1^2]}{E[t_1]} > E[t_i]
$$

The explanation: longer-lived items occupy more time and are therefore more likely to be "inspected." An item lasting $u$ units is counted for $u$ units of time, biasing the time-average upward.

## Chapter Summary (Key Formulas)

| Result | Statement |
|---|---|
| Elementary renewal theorem | $N(t)/t \to 1/\mu$ |
| Renewal reward theorem | $R(t)/t \to E[r_i]/E[t_i]$ |
| Alternating renewal | Fraction in state 1 $= \mu_F/(\mu_F + \mu_G)$ |
| Little's formula | $L = \lambda_a W$ |
| Server utilization | $\pi(0) = 1 - \lambda_a/\mu$ |
| P-K formula (M/G/1) | $W_Q = \lambda E[s_i^2]/(2(1-\lambda E[s_i]))$ |
| Inspection paradox | $E[L] = E[t_i^2]/(2 E[t_i]) > E[t_i]$ |

## Relevance

This chapter generalizes the [[Poisson Process]] (Ch. 2) by relaxing the exponential inter-arrival assumption. The renewal reward theorem is the main analytical tool, with applications ranging from queueing to the age/residual-life analysis. Results here feed into continuous-time [[Markov Chains]] (Ch. 4).

## See Also

- [[Renewal Process]]
- [[Poisson Process]]
- [[Compound Poisson Process]]
- [[Markov Chains]]
- [[SP Textbook — Ch. 2 Poisson Processes]]
