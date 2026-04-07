---
title: "Renewal Process"
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, renewal-theory, queueing-theory]
sources: [sp-textbook-ch-3-renewal-processes]
---

# Renewal Process

A **renewal process** is a counting process whose inter-arrival times are i.i.d. positive random variables. It generalizes the [[Poisson Process]] (which requires exponential inter-arrivals) to arbitrary inter-arrival distributions.

## Definition

Let $t_1, t_2, \ldots$ be i.i.d. positive random variables with distribution $F$ and mean $\mu = E[t_i] < \infty$. Define:

- $T_n = t_1 + t_2 + \cdots + t_n$ (the $n$th renewal epoch, with $T_0 = 0$)
- $N(t) = \max\{n : T_n \leq t\}$ (the number of renewals by time $t$)

The process $\{N(t), t \geq 0\}$ is a **renewal process**.

**Special case:** When $t_i \sim \text{Exp}(\lambda)$, the renewal process is a [[Poisson Process]] with rate $\lambda$.

## Key Theorems

### Elementary Renewal Theorem

$$
\frac{N(t)}{t} \to \frac{1}{\mu} \quad \text{a.s. as } t \to \infty
$$

The long-run average renewal rate is $1/\mu$. This is essentially the strong law of large numbers applied to $T_{N(t)}$.

### Renewal Reward Theorem

Suppose each renewal cycle $i$ earns a reward $r_i$, where $(t_i, r_i)$ are i.i.d. pairs with $E[\lvert r_i \rvert] < \infty$. If $R(t) = \sum_{i=1}^{N(t)} r_i$, then

$$
\frac{R(t)}{t} \to \frac{E[r_i]}{E[t_i]} \quad \text{a.s.}
$$

This is the central tool of renewal theory; most results in Chapter 3 of Durrett follow as corollaries.

### Blackwell's Renewal Theorem

For a non-lattice distribution $F$ (i.e., the inter-arrival times are not supported on multiples of some $d > 0$):

$$
E[N(t+h) - N(t)] \to \frac{h}{\mu} \quad \text{as } t \to \infty
$$

for any fixed $h > 0$. The expected number of renewals in any interval of length $h$ approaches $h/\mu$.

### Key Renewal Theorem

For non-lattice $F$, if $g$ is a directly Riemann integrable function, then

$$
\int_0^\infty g(t - s)\,dU(s) \to \frac{1}{\mu}\int_0^\infty g(t)\,dt \quad \text{as } t \to \infty
$$

where $U(t) = E[N(t)]$ is the renewal function. This is the analytical engine behind many limit results in renewal theory.

## Alternating Renewal Processes

A system alternates between state 1 (duration $s_i \sim F$, mean $\mu_F$) and state 2 (duration $u_i \sim G$, mean $\mu_G$). The limiting fraction of time in state 1 is

$$
\frac{\mu_F}{\mu_F + \mu_G}
$$

by the renewal reward theorem with $r_i = s_i$ and $t_i = s_i + u_i$ (Source: [[SP Textbook — Ch. 3 Renewal Processes]]).

## Age and Residual Life

At time $t$, define:

- **Age**: $A(t) = t - T_{N(t)}$ (time since last renewal)
- **Residual life**: $Z(t) = T_{N(t)+1} - t$ (time until next renewal)
- **Lifetime**: $L(t) = A(t) + Z(t)$

Both age and residual life converge in distribution to a limit with density

$$
g(z) = \frac{P(t_i > z)}{E[t_i]}
$$

The **inspection paradox**: the expected lifetime of the item in use at time $t$ satisfies

$$
E[L] = \frac{E[t_i^2]}{2\,E[t_i]} > E[t_i]
$$

whenever $\text{Var}(t_i) > 0$. Longer items are more likely to be "caught" by an inspection at a random time.

## Applications to Queueing

### GI∕G∕1 Queue

- Inter-arrival times $t_i$ i.i.d. with mean $1/\lambda$; service times $s_i$ i.i.d. with mean $1/\mu$
- **Stability condition**: $\lambda < \mu$
- **Little's formula**: $L = \lambda_a W$
- **Server utilization**: fraction of time busy $= \lambda/\mu$

### M∕G∕1 Queue (Poisson arrivals)

- **PASTA**: Poisson arrivals see time averages
- **Pollaczek--Khintchine formula**:

$$
W_Q = \frac{\lambda\,E[s_i^2] / 2}{1 - \lambda\,E[s_i]}
$$

- Total waiting time: $W = W_Q + E[s_i]$
- Average number in system: $L = \lambda W$

## Worked Examples

### Example 1: Machine Maintenance (Alternating Renewal)

A machine works for an average of $\mu_F = 100$ hours before failure, then requires repair taking an average of $\mu_G = 10$ hours.

**(a)** What fraction of time is the machine operational?

$$
\frac{\mu_F}{\mu_F + \mu_G} = \frac{100}{100 + 10} = \frac{10}{11} \approx 0.909
$$

**(b)** A repairman is paid $50$/hour during repairs. What is the long-run repair cost per hour?

By the renewal reward theorem, cost per unit time $= E[r_i]/E[t_i]$ where $r_i = 50 \mu_G = 500$ (expected repair cost per cycle) and $E[t_i] = 110$:

$$
\text{Cost per hour} = \frac{500}{110} \approx 4.55
$$

**(c)** If failures are detected by a Poisson inspector at rate $\lambda = 1/2$ per hour, what is the actual mean time in state 2 (waiting for detection plus repair)?

By the memoryless property, time to detection is $\text{Exp}(1/2)$ with mean $2$ hours, so $\mu_G' = 2 + 10 = 12$. The operational fraction becomes $100/112 \approx 0.893$.

### Example 2: M∕G∕1 Help Desk (Durrett Example 3.8)

Customers arrive at rate $\lambda = 1/6$ per minute. Service times have mean $E[s_i] = 5$ min and standard deviation $\sqrt{59}$ min (so $E[s_i^2] = 25 + 59 = 84$).

**(a)** Fraction of time server is idle:

$$
\pi(0) = 1 - \lambda E[s_i] = 1 - \frac{5}{6} = \frac{1}{6}
$$

**(b)** Average waiting time in the queue (Pollaczek--Khintchine):

$$
W_Q = \frac{(1/6)(84)/2}{1 - (1/6)(5)} = \frac{7}{1/6} = 42 \text{ min}
$$

**(c)** Average time in the system: $W = 42 + 5 = 47$ min.

**(d)** Average number in the system (Little's formula): $L = \lambda W = 47/6 \approx 7.83$.

### Example 3: Inspection Paradox with Uniform Inter-arrivals

Buses arrive according to a renewal process with inter-arrival times $t_i \sim \text{Uniform}(5, 15)$ minutes ($\mu = 10$, $E[t_i^2] = \text{Var}(t_i) + 100 = 25/3 + 100 = 325/3$).

A passenger arrives at a random time. The expected wait (residual life) in the long run is:

$$
E[Z] = \frac{E[t_i^2]}{2\,E[t_i]} = \frac{325/3}{20} = \frac{325}{60} \approx 5.42 \text{ min}
$$

This exceeds $\mu/2 = 5$ min. The expected total gap the passenger falls into is $E[t_i^2]/E[t_i] = 325/30 \approx 10.83$ min, which exceeds $E[t_i] = 10$ min --- the inspection paradox.

## See Also

- [[Poisson Process]]
- [[Compound Poisson Process]]
- [[Markov Chains]]
- [[Stationary Distributions]]
- [[SP Textbook — Ch. 3 Renewal Processes]]
