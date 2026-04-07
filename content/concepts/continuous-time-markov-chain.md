---
title: "Continuous Time Markov Chain"
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, ctmc, markov-chains, exponential-distribution]
sources: [sp_ch4]
---

# Continuous Time Markov Chain

A **continuous time Markov chain** (CTMC) is a stochastic process $\{X_t : t \ge 0\}$ taking values in a countable state space $S$, satisfying the Markov property in continuous time: given the present state, the future is independent of the past.

## Definition

A CTMC is fully characterized by its **jump rates** $q(i,j)$ for $i \ne j$, which determine:

1. **Holding time in state $i$**: The time spent in state $i$ before jumping is $\text{Exp}(\lambda_i)$, where

$$
\lambda_i = \sum_{j \ne i} q(i,j)
$$

2. **Jump probabilities**: Upon leaving state $i$, the chain transitions to state $j$ with probability

$$
r(i,j) = \frac{q(i,j)}{\lambda_i}, \quad j \ne i
$$

The memoryless property of the exponential distribution is what makes the process Markovian: knowing $X_t = i$ tells us the remaining holding time is still $\text{Exp}(\lambda_i)$, regardless of how long the chain has already been in state $i$.

## The Q-Matrix (Generator)

The **rate matrix** or **generator** $Q$ encodes all transition rate information:

$$
Q(i,j) = \begin{cases} q(i,j) & \text{if } j \ne i \\ -\lambda_i & \text{if } j = i \end{cases}
$$

Key properties of $Q$:
- Off-diagonal entries are nonnegative: $Q(i,j) \ge 0$ for $j \ne i$.
- Diagonal entries are nonpositive: $Q(i,i) = -\lambda_i \le 0$.
- Each row sums to zero: $\sum_j Q(i,j) = 0$.

## Kolmogorov Equations

The transition probability $p_t(i,j) = P(X_t = j \mid X_0 = i)$ satisfies two systems of ODEs:

**Backward equation** (differentiating with respect to the starting time):

$$
P'(t) = Q \, P(t)
$$

**Forward equation** (differentiating with respect to the ending time):

$$
P'(t) = P(t) \, Q
$$

Both are solved by the **matrix exponential**:

$$
P(t) = e^{Qt} = \sum_{n=0}^{\infty} \frac{(Qt)^n}{n!}
$$

The backward and forward equations are consistent (i.e., $QP(t) = P(t)Q$) because $P(t) = e^{Qt}$ is built from powers of $Q$.

## Embedded (Jump) Chain

The **embedded chain** or **jump chain** is the discrete-time [[Markov Chains|Markov chain]] $\{Y_n\}$ that records only the sequence of states visited, ignoring how long the process stays in each state. Its transition matrix is:

$$
r(i,j) = \frac{q(i,j)}{\lambda_i}, \quad j \ne i, \qquad r(i,i) = 0
$$

This decomposition is useful because many qualitative properties (irreducibility, recurrence, exit distributions) depend only on the jump chain. The holding times affect quantitative results such as expected hitting times and the stationary distribution.

## Stationary Distribution

A distribution $\pi$ is **stationary** for the CTMC if and only if $\pi Q = 0$, which means for every state $j$:

$$
\sum_{k \ne j} \pi(k) \, q(k,j) = \pi(j) \, \lambda_j
$$

This is a flow-balance condition: rate of probability flow into $j$ equals rate out of $j$.

If the chain is irreducible and has a stationary distribution $\pi$, then (Source: [[SP Textbook — Ch. 4 Continuous Time Markov Chains]]):

$$
\lim_{t \to \infty} p_t(i,j) = \pi(j)
$$

Continuous-time chains have no periodicity issues (unlike discrete time), because the exponential holding times randomize transition epochs.

**Relation to jump chain**: If the embedded chain has stationary distribution $\tilde{\pi}$, the CTMC stationary distribution is

$$
\pi(i) = \frac{\tilde{\pi}(i) / \lambda_i}{\sum_j \tilde{\pi}(j) / \lambda_j}
$$

## Detailed Balance

The **detailed balance condition** $\pi(k) q(k,j) = \pi(j) q(j,k)$ for all $j \ne k$ implies $\pi$ is stationary. This is the continuous-time analogue of reversibility. It holds for [[Birth-Death Process|birth-death processes]] and other reversible chains.

## Exit Distributions and Hitting Times

For a target set $A$ with hitting time $V_A = \min\{t \ge 0 : X_t \in A\}$:

- **Exit distribution**: $h(i) = P_i(X(V_A) = a)$ satisfies $\sum_j Q(i,j) h(j) = 0$ for $i \notin A$.
- **Expected hitting time**: $g(i) = E_i[V_A]$ satisfies $\sum_j Q(i,j) g(j) = -1$ for $i \notin A$.

In matrix form, restricting $Q$ to $A^c$ as $R$: $g = -R^{-1} \mathbf{1}$.

## Worked Examples

### Example 1: Two-State Machine (Up∕Down)

A machine alternates between **up** (state 1) and **down** (state 2). It runs for an $\text{Exp}(\alpha)$ time before breaking, and repairs take $\text{Exp}(\beta)$ time. Find the Q-matrix, transition probabilities, and long-run availability.

**Q-matrix**:

$$
Q = \begin{pmatrix} -\alpha & \alpha \\ \beta & -\beta \end{pmatrix}
$$

**Kolmogorov backward equation** for $p_t(1,1)$ and $p_t(2,1)$:

$$
p_t'(1,1) = -\alpha \bigl(p_t(1,1) - p_t(2,1)\bigr), \quad p_t'(2,1) = \beta \bigl(p_t(1,1) - p_t(2,1)\bigr)
$$

Taking the difference $u(t) = p_t(1,1) - p_t(2,1)$:

$$
u'(t) = -(\alpha + \beta) u(t) \implies u(t) = e^{-(\alpha+\beta)t}
$$

using $u(0) = 1$. Integrating back:

$$
p_t(1,1) = \frac{\beta}{\alpha + \beta} + \frac{\alpha}{\alpha + \beta} e^{-(\alpha+\beta)t}
$$

$$
p_t(2,1) = \frac{\beta}{\alpha + \beta} - \frac{\beta}{\alpha + \beta} e^{-(\alpha+\beta)t}
$$

**Stationary distribution**: As $t \to \infty$, both converge to

$$
\pi(1) = \frac{\beta}{\alpha + \beta}, \quad \pi(2) = \frac{\alpha}{\alpha + \beta}
$$

**Numerical instance**: If $\alpha = 1/10$ (mean 10 hours up) and $\beta = 1/2$ (mean 2 hours repair), then the long-run availability is

$$
\pi(1) = \frac{1/2}{1/10 + 1/2} = \frac{5}{6} \approx 83.3\%
$$

**Verification**: $\pi Q = (5/6, 1/6) \begin{pmatrix} -1/10 & 1/10 \\ 1/2 & -1/2 \end{pmatrix} = (0, 0)$. Confirmed.

### Example 2: L.A. Weather Chain

Three states: 1 = sunny, 2 = smoggy, 3 = rainy. The chain cycles $1 \to 2 \to 3 \to 1$ with mean holding times 3, 4, and 1 days respectively. Find the stationary distribution.

**Q-matrix** (rate = 1/mean):

$$
Q = \begin{pmatrix} -1/3 & 1/3 & 0 \\ 0 & -1/4 & 1/4 \\ 1 & 0 & -1 \end{pmatrix}
$$

**Solving** $\pi Q = 0$ with $\pi(1) + \pi(2) + \pi(3) = 1$:

From the first column: $-\frac{1}{3}\pi(1) + \pi(3) = 0 \implies \pi(3) = \frac{1}{3}\pi(1)$.

From the second column: $\frac{1}{3}\pi(1) - \frac{1}{4}\pi(2) = 0 \implies \pi(2) = \frac{4}{3}\pi(1)$.

Normalizing: $\pi(1) + \frac{4}{3}\pi(1) + \frac{1}{3}\pi(1) = 1 \implies \frac{8}{3}\pi(1) = 1 \implies \pi(1) = \frac{3}{8}$.

$$
\pi(1) = \frac{3}{8}, \quad \pi(2) = \frac{4}{8} = \frac{1}{2}, \quad \pi(3) = \frac{1}{8}
$$

**Intuition check**: The chain cycles through states spending mean times 3, 4, 1 in each. The mean cycle length is $3 + 4 + 1 = 8$, so $\pi(i) = (\text{mean time in } i) / 8$, which matches.

### Example 3: Barbershop Queue

A barber serves at rate 3 (customers/hour). Customers arrive as a [[Poisson Process]] with rate 2, but leave if both waiting-room chairs are full. State = number of customers in system, $S = \{0,1,2,3\}$.

**Rates**: $q(i, i+1) = 2$ for $i = 0,1,2$ and $q(i, i-1) = 3$ for $i = 1,2,3$.

This is a [[Birth-Death Process]] with $\lambda_i = 2$, $\mu_i = 3$. Using detailed balance:

$$
\pi(n) = \pi(0) \left(\frac{2}{3}\right)^n
$$

Normalizing: $\pi(0)(1 + 2/3 + 4/9 + 8/27) = \pi(0) \cdot 65/27 = 1$, so $\pi(0) = 27/65$.

$$
\pi(0) = \frac{27}{65}, \quad \pi(1) = \frac{18}{65}, \quad \pi(2) = \frac{12}{65}, \quad \pi(3) = \frac{8}{65}
$$

Fraction of customers who enter: $1 - \pi(3) = 57/65 \approx 87.7\%$.

## See Also

- [[Markov Chains]]
- [[Poisson Process]]
- [[Birth-Death Process]]
- [[Stationary Distributions]]
- [[SP Textbook — Ch. 4 Continuous Time Markov Chains]]
