---
title: "Compound Poisson Process"
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, poisson-process, random-sums]
sources: [sp-textbook-ch-2-poisson-processes]
---

# Compound Poisson Process

A **compound Poisson process** augments a [[Poisson Process]] by attaching an i.i.d. random "jump size" to each arrival. It models aggregate quantities (total claims, total bytes, total revenue) accumulated over Poisson-arriving events.

## Definition

Let $\{N(t), t \geq 0\}$ be a Poisson process with rate $\lambda$, and let $D_1, D_2, \ldots$ be i.i.d. random variables independent of $N(t)$. The compound Poisson process is

$$
Y(t) = \sum_{i=1}^{N(t)} D_i
$$

with $Y(t) = 0$ when $N(t) = 0$.

## Moment Formulas

These follow from Theorem 2.10 in Durrett (Wald-type identities for random sums).

**Mean:**

$$
E[Y(t)] = \lambda t \cdot E[D_1]
$$

**Variance** (using $E[N(t)] = \text{Var}(N(t)) = \lambda t$):

$$
\text{Var}(Y(t)) = \lambda t \cdot E[D_1^2]
$$

Note this is *not* $\lambda t \cdot \text{Var}(D_1)$. The correct formula uses the second moment because both the randomness in $D_i$ and the randomness in $N(t)$ contribute:

$$
\text{Var}(Y(t)) = E[N(t)]\,\text{Var}(D_1) + \text{Var}(N(t))\,(E[D_1])^2 = \lambda t\bigl(\text{Var}(D_1) + (E[D_1])^2\bigr) = \lambda t\,E[D_1^2]
$$

**General random-sum variance** (Theorem 2.10(ii)): for any independent nonneg. integer $N$,

$$
\text{Var}\!\left(\sum_{i=1}^N D_i\right) = E[N]\,\text{Var}(D_i) + \text{Var}(N)\,(E[D_i])^2
$$

## Moment Generating Function

If $M_D(u) = E[e^{uD_1}]$ exists, then

$$
E[e^{uY(t)}] = \exp\!\bigl(\lambda t\,(M_D(u) - 1)\bigr)
$$

This follows from conditioning on $N(t) = n$ and using the Poisson MGF.

## Applications

| Domain | $N(t)$ | $D_i$ | $Y(t)$ |
|---|---|---|---|
| Insurance | Claims filed (rate $\lambda$) | Claim amount | Total payout |
| Network traffic | Packets arriving | Packet size (bytes) | Total data volume |
| Finance | Price jumps | Jump magnitude | Cumulative price impact |
| Retail | Customers arriving | Spending per customer | Total revenue |

## Worked Examples

### Example 1: Insurance Claims

An insurance company receives claims at a Poisson rate of $\lambda = 5$ per day. Each claim amount $D_i$ is exponentially distributed with mean $E[D_i] = 2{,}000$ (so $E[D_i^2] = 2/\lambda_D^2 = 2 \cdot (2000)^2 = 8{,}000{,}000$, using the second moment of an exponential).

**(a)** Find the expected total payout over a 30-day month.

$$
E[Y(30)] = \lambda \cdot 30 \cdot E[D_1] = 5 \cdot 30 \cdot 2000 = 300{,}000
$$

**(b)** Find the standard deviation of the total payout over 30 days.

$$
\text{Var}(Y(30)) = \lambda \cdot 30 \cdot E[D_1^2] = 150 \cdot 8{,}000{,}000 = 1.2 \times 10^9
$$

$$
\text{SD}(Y(30)) = \sqrt{1.2 \times 10^9} \approx 34{,}641
$$

**(c)** Use the normal approximation to estimate the probability the payout exceeds $350{,}000$.

$$
P(Y(30) > 350{,}000) \approx P\!\left(Z > \frac{350{,}000 - 300{,}000}{34{,}641}\right) = P(Z > 1.443) \approx 0.0745
$$

### Example 2: Liquor Store Revenue (Durrett Example 2.3)

Customers arrive at a liquor store at a Poisson rate of $\lambda = 81$ per day. Each customer spends an amount $D_i$ with $E[D_i] = 8$ and $\text{SD}(D_i) = 6$.

**(a)** Mean daily revenue:

$$
E[Y(1)] = 81 \cdot 8 = 648
$$

**(b)** Variance of daily revenue. First compute $E[D_i^2] = \text{Var}(D_i) + (E[D_i])^2 = 36 + 64 = 100$. Then:

$$
\text{Var}(Y(1)) = 81 \cdot 100 = 8{,}100
$$

$$
\text{SD}(Y(1)) = \sqrt{8{,}100} = 90
$$

**(c)** The coefficient of variation is $90/648 \approx 0.139$, so daily revenue is fairly predictable relative to its mean.

### Example 3: Network Packets

A router receives packets at rate $\lambda = 1{,}000$ per second. Packet sizes $D_i$ are uniform on $[100, 1500]$ bytes (mean $800$, $E[D_i^2] = \text{Var}(D_i) + 800^2 = \frac{(1400)^2}{12} + 640{,}000 = 163{,}333 + 640{,}000 = 803{,}333$).

Expected data volume per second: $E[Y(1)] = 1000 \cdot 800 = 800{,}000$ bytes $= 800$ KB.

Standard deviation: $\text{SD}(Y(1)) = \sqrt{1000 \cdot 803{,}333} \approx 28{,}343$ bytes $\approx 28$ KB.

## Connection to Other Processes

- When $D_i = 1$ a.s., $Y(t) = N(t)$ reduces to the ordinary [[Poisson Process]].
- Thinning is a special case where $D_i \in \{0,1\}$; the kept process is Poisson with rate $\lambda p$ (Source: [[SP Textbook — Ch. 2 Poisson Processes]]).
- The [[Renewal Process]] generalizes by dropping the Poisson assumption on $N(t)$.

## See Also

- [[Poisson Process]]
- [[Renewal Process]]
- [[SP Textbook — Ch. 2 Poisson Processes]]
