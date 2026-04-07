---
title: "Detailed Balance"
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, markov-chains, reversibility, stationary-distributions]
sources: [sp_ch1]
---

# Detailed Balance

## Definition

A distribution $\pi$ satisfies the **detailed balance condition** (also called **time-reversibility**) with respect to a transition matrix $p$ if

$$
\pi(x)\, p(x,y) = \pi(y)\, p(y,x) \quad \text{for all states } x, y
$$

**Intuition.** Think of $\pi(x)$ as the amount of sand at state $x$. One step of the chain moves a fraction $p(x,y)$ of the sand at $x$ to $y$. Detailed balance says the flow of sand from $x$ to $y$ exactly equals the flow from $y$ to $x$, for every pair of states.

## Detailed Balance Implies Stationarity

If $\pi$ satisfies detailed balance, then $\pi$ is a [[Stationary Distributions|stationary distribution]]. To see this, sum $\pi(x)p(x,y) = \pi(y)p(y,x)$ over $x$:

$$
\sum_x \pi(x)\, p(x,y) = \pi(y) \sum_x p(y,x) = \pi(y)
$$

The converse is **not** true: a stationary distribution need not satisfy detailed balance. For example, any doubly stochastic chain with asymmetric transitions (such as a directed cycle) has a uniform stationary distribution but fails detailed balance.

## Connection to Reversibility

Given a [[Markov Chains|Markov chain]] with stationary distribution $\pi$, the **reversed chain** has transition probability

$$
\hat{p}(i,j) = \frac{\pi(j)\, p(j,i)}{\pi(i)}
$$

The chain is **reversible** if $\hat{p}(i,j) = p(i,j)$ for all $i,j$. This holds if and only if $\pi$ satisfies detailed balance. In other words, watching the chain run forward from stationarity is statistically indistinguishable from watching it backward (Source: [[SP Textbook — Ch. 1 Markov Chains]]).

## Key Classes of Chains with Detailed Balance

### Birth-and-Death Chains

For a chain on $\{\ell, \ell+1, \ldots, r\}$ with $p(x, x+1) = p_x$ and $p(x, x-1) = q_x$, detailed balance between adjacent states gives the recursion

$$
\pi(x+1) = \frac{p_x}{q_{x+1}} \cdot \pi(x)
$$

which yields

$$
\pi(\ell + i) = \pi(\ell) \cdot \prod_{k=0}^{i-1} \frac{p_{\ell+k}}{q_{\ell+k+1}}
$$

Normalize by requiring $\sum_x \pi(x) = 1$.

### Random Walks on Graphs

For a graph with adjacency matrix $A(u,v)$ and degree $d(u) = \sum_v A(u,v)$, define

$$
p(u,v) = \frac{A(u,v)}{d(u)}
$$

Then $\pi(u) = d(u) / \sum_w d(w)$ satisfies detailed balance:

$$
\pi(u)\, p(u,v) = \frac{A(u,v)}{\sum_w d(w)} = \pi(v)\, p(v,u)
$$

since $A(u,v) = A(v,u)$.

## When Detailed Balance Fails

Not every chain admits a stationary distribution with detailed balance. A sufficient condition for failure is the existence of a directed cycle: if $p(i,j) > 0$ but $p(j,i) = 0$ for some pair where $\pi(i) > 0$, then detailed balance cannot hold. More generally, any chain where probability "circulates" around a loop will fail detailed balance (Source: [[SP Textbook — Ch. 1 Markov Chains]]).

## Worked Examples

### Example 1: Ehrenfest Chain ($n = 3$ balls)

The Ehrenfest chain models $n$ balls distributed between two urns. At each step, a ball is chosen uniformly at random and moved to the other urn. For $n = 3$, the state $x \in \{0, 1, 2, 3\}$ counts balls in the left urn:

$$
p(x, x+1) = \frac{3-x}{3}, \quad p(x, x-1) = \frac{x}{3}
$$

**Claim.** The binomial distribution $\pi(x) = 2^{-3}\binom{3}{x}$ satisfies detailed balance.

**Verification.** Check the condition for adjacent states $x$ and $x+1$:

$$
\pi(x)\, p(x, x+1) = 2^{-3} \frac{3!}{x!(3-x)!} \cdot \frac{3-x}{3}
$$

$$
= 2^{-3} \cdot \frac{3!}{(x+1)!(3-x-1)!} \cdot \frac{x+1}{3}
$$

$$
= \pi(x+1)\, p(x+1, x)
$$

Numerically with $x = 0$: $\pi(0) p(0,1) = \frac{1}{8} \cdot 1 = \frac{1}{8}$ and $\pi(1) p(1,0) = \frac{3}{8} \cdot \frac{1}{3} = \frac{1}{8}$. With $x = 1$: $\pi(1) p(1,2) = \frac{3}{8} \cdot \frac{2}{3} = \frac{1}{4}$ and $\pi(2) p(2,1) = \frac{3}{8} \cdot \frac{2}{3} = \frac{1}{4}$. Detailed balance holds for all pairs, confirming $\pi = (1/8, 3/8, 3/8, 1/8)$ is stationary.

### Example 2: Three Machines, One Repairman

An office has three machines, each breaking with probability $0.1$ per day. A repairman fixes one broken machine per day with probability $0.5$. The number of working machines $x \in \{0, 1, 2, 3\}$ follows a birth-and-death chain with:

| $x$ | $p_x = p(x, x+1)$ | $q_x = p(x, x-1)$ |
|-----|---------------------|---------------------|
| 0   | 0.5                 | 0                   |
| 1   | 0.45                | 0.05                |
| 2   | 0.4                 | 0.1                 |
| 3   | 0                   | 0.3                 |

**Step 1.** Set $\pi(0) = c$ and apply the birth-death recursion:

$$
\pi(1) = \frac{p_0}{q_1} \cdot \pi(0) = \frac{0.5}{0.05} \cdot c = 10c
$$

$$
\pi(2) = \frac{p_1}{q_2} \cdot \pi(1) = \frac{0.45}{0.1} \cdot 10c = 45c
$$

$$
\pi(3) = \frac{p_2}{q_3} \cdot \pi(2) = \frac{0.4}{0.3} \cdot 45c = 60c
$$

**Step 2.** Normalize: $c + 10c + 45c + 60c = 116c = 1$, so $c = 1/116$.

$$
\pi = \left(\frac{1}{116},\; \frac{10}{116},\; \frac{45}{116},\; \frac{60}{116}\right)
$$

**Step 3.** Verify detailed balance for the pair $(2, 3)$:

$$
\pi(2)\, p(2,3) = \frac{45}{116} \cdot 0.4 = \frac{18}{116}
$$

$$
\pi(3)\, p(3,2) = \frac{60}{116} \cdot 0.3 = \frac{18}{116} \quad \checkmark
$$

Since this is a birth-and-death chain, detailed balance holds automatically for all adjacent pairs by construction.

## See Also

- [[Markov Chains]]
- [[Stationary Distributions]]
- [[Metropolis-Hastings Algorithm]]
- [[Recurrence and Transience]]
- [[SP Textbook — Ch. 1 Markov Chains]]
