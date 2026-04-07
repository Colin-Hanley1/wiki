---
title: "Birth-Death Process"
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, ctmc, queues, birth-death]
sources: [sp_ch4]
---

# Birth-Death Process

A **birth-death process** is a [[Continuous Time Markov Chain]] on the nonnegative integers (or a finite subset) where transitions occur only between adjacent states. It is the continuous-time analogue of a nearest-neighbor random walk.

## Definition

On state space $S = \{0, 1, 2, \ldots\}$ (or $S = \{0, 1, \ldots, N\}$), the jump rates are:

$$
q(n, n+1) = \lambda_n \quad (\text{birth rate at } n)
$$

$$
q(n, n-1) = \mu_n \quad (\text{death rate at } n)
$$

All other transition rates are zero. The parameter $\lambda_n$ represents the rate at which the population grows by one when in state $n$, and $\mu_n$ the rate at which it shrinks by one.

The **Q-matrix** is tridiagonal:

$$
Q = \begin{pmatrix}
-\lambda_0 & \lambda_0 & 0 & 0 & \cdots \\
\mu_1 & -(\lambda_1 + \mu_1) & \lambda_1 & 0 & \cdots \\
0 & \mu_2 & -(\lambda_2 + \mu_2) & \lambda_2 & \cdots \\
\vdots & & \ddots & \ddots & \ddots
\end{pmatrix}
$$

## Stationary Distribution

Birth-death processes always satisfy the **detailed balance condition** (Source: [[SP Textbook — Ch. 4 Continuous Time Markov Chains]]):

$$
\pi(n) \lambda_n = \pi(n+1) \mu_{n+1}
$$

Iterating this recursion from $\pi(0)$:

$$
\pi(n) = \pi(0) \prod_{k=0}^{n-1} \frac{\lambda_k}{\mu_{k+1}}
$$

The normalizing constant $\pi(0)$ is chosen so that $\sum_n \pi(n) = 1$. A stationary distribution exists if and only if:

$$
\sum_{n=0}^{\infty} \prod_{k=0}^{n-1} \frac{\lambda_k}{\mu_{k+1}} < \infty
$$

For a finite state space $\{0, 1, \ldots, N\}$, the sum is always finite and a stationary distribution always exists.

## Embedded Chain

The jump chain has transition probabilities:

$$
r(n, n+1) = \frac{\lambda_n}{\lambda_n + \mu_n}, \quad r(n, n-1) = \frac{\mu_n}{\lambda_n + \mu_n}
$$

This is a discrete-time random walk with state-dependent step probabilities. Recurrence/transience of the CTMC matches that of the embedded chain.

## Common Special Cases

### M∕M∕1 Queue

The most important birth-death process in queueing theory. Customers arrive as a [[Poisson Process]] with rate $\lambda$ and are served at rate $\mu$ (exponential service times). State = number of customers in the system.

- Birth rates: $\lambda_n = \lambda$ for all $n \ge 0$.
- Death rates: $\mu_n = \mu$ for all $n \ge 1$.
- Traffic intensity: $\rho = \lambda / \mu$.

The stationary distribution (when $\rho < 1$) is geometric:

$$
\pi(n) = (1 - \rho) \rho^n, \quad n = 0, 1, 2, \ldots
$$

### M∕M∕s Queue

$s$ parallel servers, each with rate $\mu$. The death rate depends on how many servers are busy:

$$
\mu_n = \begin{cases} n\mu & \text{if } 0 \le n \le s \\ s\mu & \text{if } n \ge s \end{cases}
$$

### M∕M∕1 Queue with Balking

Customers arrive at rate $\lambda$ but join the queue with probability $a_n$ when $n$ customers are present, so $\lambda_n = \lambda a_n$. If $a_n \to 0$ as $n \to \infty$, a stationary distribution always exists.

**Special case** $a_n = 1/(n+1)$: The stationary distribution is Poisson with mean $\lambda/\mu$.

### Machine Repair Model

$N$ machines, each failing at rate $\alpha$, with $s$ repairmen each working at rate $\beta$. State = number of working machines.

- $\lambda_n = \min(N - n, s) \cdot \beta$ (repair rate).
- $\mu_n = n \cdot \alpha$ (failure rate proportional to working machines).

## Worked Examples

### Example 1: M∕M∕1 Queue — Stationary Distribution and Performance Metrics

A call center receives calls at rate $\lambda = 4$ per minute. A single operator handles calls with mean service time $12$ seconds, so $\mu = 5$ per minute. Find the stationary distribution, expected number in system, expected waiting time, and probability of waiting.

**Step 1: Check stability.** $\rho = \lambda/\mu = 4/5 = 0.8 < 1$, so the queue is stable.

**Step 2: Stationary distribution.** Since $\lambda_n = \lambda$ and $\mu_n = \mu$ for all $n$:

$$
\pi(n) = (1 - \rho)\rho^n = 0.2 \cdot (0.8)^n, \quad n = 0, 1, 2, \ldots
$$

**Step 3: Expected number in system ($L$).** Using the geometric series formula:

$$
L = E[N] = \sum_{n=0}^{\infty} n \, \pi(n) = \frac{\rho}{1 - \rho} = \frac{0.8}{0.2} = 4
$$

**Step 4: Expected time in system ($W$).** By Little's law $L = \lambda W$:

$$
W = \frac{L}{\lambda} = \frac{4}{4} = 1 \text{ minute}
$$

**Step 5: Expected time waiting in queue ($W_q$).** The expected service time is $1/\mu = 0.2$ min, so:

$$
W_q = W - \frac{1}{\mu} = 1 - 0.2 = 0.8 \text{ minutes} = 48 \text{ seconds}
$$

**Step 6: Probability the system is nonempty** (a new customer must wait):

$$
P(\text{wait}) = 1 - \pi(0) = 1 - 0.2 = 0.8
$$

**Step 7: Expected return time to empty.** From the M/M/1 hitting time formula:

$$
E_1[T_0] = \frac{1}{\mu - \lambda} = \frac{1}{5 - 4} = 1 \text{ minute}
$$

### Example 2: Machine Repair Model

A factory has 3 machines, each failing at rate $\alpha = 1/60$ per day (mean lifetime 60 days). One repairman fixes machines at rate $\beta = 1/4$ per day (mean repair time 4 days). State $i$ = number of working machines ($S = \{0,1,2,3\}$).

**Rates**: $\lambda_i = \beta = 1/4$ for $i = 0,1,2$ (repair rate) and $\mu_i = i/60$ for $i = 1,2,3$ (failure rate proportional to working machines).

**Stationary distribution** via detailed balance, setting $\pi(0) = c$:

$$
\pi(1) = \frac{\lambda_0}{\mu_1} \cdot c = \frac{1/4}{1/60} \cdot c = 15c
$$

$$
\pi(2) = \frac{\lambda_1}{\mu_2} \cdot \pi(1) = \frac{1/4}{2/60} \cdot 15c = \frac{225c}{2}
$$

$$
\pi(3) = \frac{\lambda_2}{\mu_3} \cdot \pi(2) = \frac{1/4}{3/60} \cdot \frac{225c}{2} = \frac{1125c}{2}
$$

**Normalizing**:

$$
c + 15c + \frac{225c}{2} + \frac{1125c}{2} = c \cdot \frac{2 + 30 + 225 + 1125}{2} = c \cdot \frac{1382}{2} = 1
$$

So $c = 2/1382 = 1/691$.

$$
\pi(0) = \frac{1}{691}, \quad \pi(1) = \frac{15}{691}, \quad \pi(2) = \frac{225}{1382}, \quad \pi(3) = \frac{1125}{1382}
$$

**Long-run fraction with all 3 machines working**:

$$
\pi(3) = \frac{1125}{1382} \approx 0.814
$$

About $81.4\%$ of the time all machines are operational.

### Example 3: Recurrence Classification of M∕M∕1

The M/M/1 queue with arrival rate $\lambda$ and service rate $\mu$ has embedded chain $r(i, i+1) = \lambda/(\lambda + \mu)$ and $r(i, i-1) = \mu/(\lambda + \mu)$ for $i \ge 1$. This is a simple random walk, so:

| Condition | Classification | Reason |
|---|---|---|
| $\lambda < \mu$ | Positive recurrent | $E_0[T_0] < \infty$; geometric stationary distribution |
| $\lambda = \mu$ | Null recurrent | Returns to 0 with probability 1, but $E_0[T_0] = \infty$ |
| $\lambda > \mu$ | Transient | Queue grows without bound; $P_0(T_0 < \infty) < 1$ |

When $\lambda < \mu$, the expected first return time from state 1 to state 0 is:

$$
E_1[T_0] = \frac{1}{\mu - \lambda}
$$

## See Also

- [[Continuous Time Markov Chain]]
- [[Poisson Process]]
- [[Markov Chains]]
- [[Stationary Distributions]]
- [[SP Textbook — Ch. 4 Continuous Time Markov Chains]]
