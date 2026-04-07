---
title: "Exit Distributions and Times"
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, markov-chains, hitting-times, gamblers-ruin, absorption]
sources: [sp_ch1]
---

# Exit Distributions and Times

## Overview

For a [[Markov Chains|Markov chain]] with absorbing or target states, two fundamental questions arise: (1) **which** absorbing state is reached first (exit distribution), and (2) **how long** does it take to get there (exit time). Both are computed via first-step analysis, leading to systems of linear equations (Source: [[SP Textbook — Ch. 1 Markov Chains]]).

## Exit Distributions

### Setup

Let $S$ be a finite state space with two distinguished states $a$ and $b$. Let $C = S - \{a, b\}$ be the set of transient states. Define

$$
V_y = \min\{n \geq 0 : X_n = y\}
$$

and set $h(x) = P_x(V_a < V_b)$, the probability of hitting $a$ before $b$ starting from $x$.

### First-Step Equations

**Theorem 1.27 (Durrett).** If $h(a) = 1$, $h(b) = 0$, and for $x \in C$:

$$
h(x) = \sum_y p(x,y)\, h(y)
$$

and $P_x(V_a \wedge V_b < \infty) > 0$ for all $x \in C$, then $h(x) = P_x(V_a < V_b)$.

**Matrix form.** Let $r$ denote the restriction of $p$ to $C \times C$. Rearranging the first-step equations yields $(I - r)\, h = b_a$, where $b_a$ is the vector of transition probabilities from $C$ directly to $a$. Solving:

$$
h = (I - r)^{-1}\, b_a
$$

### Generalization

The same technique works for multiple absorbing classes: define $h_A(x) = P_x(\text{hit } A \text{ before } B)$ and solve the analogous system with boundary conditions $h_A = 1$ on $A$, $h_A = 0$ on $B$.

## Exit Times

### Setup

Let $A \subseteq S$ be a set of absorbing (or target) states, $C = S - A$, and $V_A = \min\{n \geq 0 : X_n \in A\}$. Define $g(x) = E_x(V_A)$.

### First-Step Equations

**Theorem 1.28 (Durrett).** If $g(a) = 0$ for all $a \in A$, and for $x \in C$:

$$
g(x) = 1 + \sum_y p(x,y)\, g(y)
$$

and $P_x(V_A < \infty) > 0$ for all $x \in C$, then $g(x) = E_x(V_A)$.

The "$1 +$" accounts for the one time step consumed before the next transition.

**Matrix form.** Let $r$ be the restriction of $p$ to $C$. Then

$$
g = (I - r)^{-1}\, \mathbf{1}
$$

where $\mathbf{1}$ is the all-ones column vector. The $(x, y)$ entry of $(I - r)^{-1}$ equals $E_x N(y)$, the expected number of visits to $y$ before absorption. The exit time is the sum of expected visits to all transient states.

## Gambler's Ruin: The Canonical Example

A gambler starts with $x$, wins $1$ with probability $p$ and loses $1$ with probability $q = 1-p$ on each play. The game ends when the fortune hits $0$ (ruin) or $N$ (goal).

### Exit Distribution ($p \neq 1/2$)

Setting $\gamma = q/p$, the ruin probability is:

$$
P_x(V_N < V_0) = \frac{\gamma^x - 1}{\gamma^N - 1}
$$

When $p = 1/2$: $P_x(V_N < V_0) = x/N$.

### Exit Time (Fair Game, $p = 1/2$)

$$
E_x \tau = x(N - x)
$$

### Exit Time (Non-Fair Game, $p \neq 1/2$)

$$
E_x \tau = \frac{x}{q - p} - \frac{N}{q - p} \cdot \frac{1 - (q/p)^x}{1 - (q/p)^N}
$$

## Worked Examples

### Example 1: Gambler's Ruin with $p = 0.4$, $N = 4$

A gambler starts with $x$ and plays until reaching $0$ (ruin) or $4$ (goal), winning each round with probability $p = 0.4$.

**Goal:** Compute $h(x) = P_x(V_4 < V_0)$ for $x = 1, 2, 3$.

**Step 1.** Compute $\gamma = q/p = 0.6/0.4 = 3/2$.

**Step 2.** Apply the formula:

$$
h(x) = P_x(V_4 < V_0) = \frac{(3/2)^x - 1}{(3/2)^4 - 1}
$$

**Step 3.** Evaluate $(3/2)^4 = 81/16$, so $(3/2)^4 - 1 = 65/16$.

- $h(1) = \dfrac{3/2 - 1}{65/16} = \dfrac{1/2}{65/16} = \dfrac{8}{65} \approx 0.1231$

- $h(2) = \dfrac{9/4 - 1}{65/16} = \dfrac{5/4}{65/16} = \dfrac{20}{65} \approx 0.3077$

- $h(3) = \dfrac{27/8 - 1}{65/16} = \dfrac{19/8}{65/16} = \dfrac{38}{65} \approx 0.5846$

**Verification by first-step equations.** The equation $h(x) = 0.4\, h(x+1) + 0.6\, h(x-1)$ with $h(0) = 0$, $h(4) = 1$:

$$
h(1) = 0.4\, h(2) + 0.6 \cdot 0 = 0.4 \cdot \frac{20}{65} = \frac{8}{65} \quad \checkmark
$$

**Interpretation.** Even starting with $3$ out of a $4$ goal, the gambler's chance of success is only about $58\%$ because $p < 1/2$.

### Example 2: Two-Year College --- Exit Time

At a two-year college, freshmen (state 1) have the following annual transitions: 25% remain freshmen, 60% become sophomores, 15% drop out. Sophomores (state 2): 20% remain sophomores, 70% graduate, 10% drop out. States $G$ (graduate) and $D$ (dropout) are absorbing.

**Goal:** Compute $g(x) = E_x(V_{\{G,D\}})$, the expected number of years to leave.

**Step 1.** Write the first-step equations with $g(G) = g(D) = 0$:

$$
g(1) = 1 + 0.25\, g(1) + 0.6\, g(2)
$$

$$
g(2) = 1 + 0.2\, g(2)
$$

**Step 2.** Solve the second equation: $0.8\, g(2) = 1$, so $g(2) = 1.25$ years.

**Step 3.** Substitute into the first equation:

$$
g(1) = 1 + 0.25\, g(1) + 0.6 \cdot 1.25 = 1 + 0.25\, g(1) + 0.75
$$

$$
0.75\, g(1) = 1.75
$$

$$
g(1) = \frac{1.75}{0.75} = \frac{7}{3} \approx 2.333 \text{ years}
$$

**Matrix verification.** The restriction $r$ to the transient states $\{1, 2\}$ is:

$$
r = \begin{pmatrix} 0.25 & 0.6 \\ 0 & 0.2 \end{pmatrix}, \quad
I - r = \begin{pmatrix} 0.75 & -0.6 \\ 0 & 0.8 \end{pmatrix}
$$

$$
(I - r)^{-1} = \begin{pmatrix} 4/3 & 1 \\ 0 & 5/4 \end{pmatrix}
$$

$$
g = (I - r)^{-1} \mathbf{1} = \begin{pmatrix} 4/3 + 1 \\ 0 + 5/4 \end{pmatrix} = \begin{pmatrix} 7/3 \\ 5/4 \end{pmatrix} \quad \checkmark
$$

The entry $(I-r)^{-1}(1,2) = 1$ means a freshman expects to spend exactly 1 year as a sophomore before exiting.

## See Also

- [[Markov Chains]]
- [[Recurrence and Transience]]
- [[Stationary Distributions]]
- [[SP Textbook — Ch. 1 Markov Chains]]
