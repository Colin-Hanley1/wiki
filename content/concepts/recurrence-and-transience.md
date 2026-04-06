---
title: Recurrence and Transience
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, markov-chains, recurrence]
sources: [HW3_MATH457_557_Spring_2026_v2-3.pdf, HW6_MATH457_557_Spring2026_v11-1.pdf, HW7_MATH457_557_Spring2025_v6.pdf]
---

# Recurrence and Transience

For a [[Markov Chains|Markov chain]], a state $x$ is classified by whether the chain returns to it with certainty.

## Definitions

Let $T_x = \min\{n \ge 1 : X_n = x\}$ be the **first return time** to state $x$, and $\rho_{xx} = P_x(T_x < \infty)$.

- **Recurrent:** $\rho_{xx} = 1$ — the chain returns to $x$ with probability 1.
- **Transient:** $\rho_{xx} < 1$ — positive probability of never returning.

Equivalently, $x$ is recurrent iff $\sum_{n=0}^{\infty} p^{(n)}(x,x) = \infty$.

## Communication and Class Properties

- Recurrence and transience are **class properties**: if $x \leftrightarrow y$, they share the same classification.
- In an **irreducible** chain, all states are either all recurrent or all transient.
- **Finite irreducible chains** are always recurrent (Source: [[MATH 457∕557 - Homework 3]]).

## Decomposition

The state space decomposes as:

$$S = T \cup C_1 \cup C_2 \cup \cdots$$

where $T$ is the set of transient states and $C_1, C_2, \ldots$ are disjoint **irreducible closed** (recurrent) sets. A set $C$ is **closed** if $p(x, y) = 0$ for all $x \in C$, $y \notin C$ — the chain cannot escape (Source: [[MATH 457∕557 - Homework 3]]).

## Hitting and Return Times

- **Hitting time:** $T_y = \min\{n \ge 1 : X_n = y\}$ starting from any state.
- **Return time:** $T_y$ when starting from $y$ itself.
- **Expected return time:** For positive recurrent state $y$: $E_y[T_y] = 1/\pi(y)$ where $\pi$ is the [[Stationary Distributions|stationary distribution]].
- **First-step analysis:** $E_x[T_y]$ satisfies $g(x) = 1 + \sum_{z \ne y} p(x,z) g(z)$ — a linear system solved by making $y$ absorbing (Source: [[MATH 457∕557 - Homework 7]]).

## Exit Distributions and Absorption

For a chain with absorbing states, the probability of being absorbed into a particular state can be computed via a system of linear equations. The **fundamental matrix** $(I - Q)^{-1}$ (where $Q$ is the transient-to-transient submatrix) gives expected number of visits before absorption (Source: [[MATH 457∕557 - Homework 6]]).

## Worked Examples

### Example 1: Expected Return Time via First-Step Analysis (HW3 C7)

**Problem:** A chain on $\{0, 1, 2, \ldots\}$ moves from $x$ to $x+1$ with probability $p$ and to $0$ with probability $q = 1-p$. Find $E_0[T_0]$.

**Solution:**

**Step 1 — Show recurrence:** $P_0(T_0 = n) = p^{n-1}(1-p)$ (must go up $n-1$ times, then return). Then:

$$\rho_{00} = \sum_{n=1}^{\infty} P_0(T_0 = n) = (1-p)\sum_{n=1}^{\infty} p^{n-1} = \frac{1-p}{1-p} = 1$$

So state 0 is recurrent. The chain is irreducible (every state can reach 0 and 0 can reach every state), so all states are recurrent.

**Step 2 — Compute expected return time:**

$$E_0[T_0] = \sum_{n=1}^{\infty} n \cdot p^{n-1}(1-p) = (1-p)\sum_{n=1}^{\infty} n p^{n-1} = (1-p) \cdot \frac{1}{(1-p)^2} = \frac{1}{1-p}$$

(using the identity $\sum_{n=1}^{\infty} n x^{n-1} = 1/(1-x)^2$ for $|x| < 1$)

(Source: [[MATH 457∕557 - Homework 3]])

### Example 2: State Classification via Chain Decomposition (HW3 C10)

**Problem:** A chain on $\{1, 2, 3, 4, 5, 6\}$ has transition graph where state 3 can reach state 5, but state 5 cannot reach state 3. Classify all states.

**Solution:**

**Step 1 — Find transient states:** States $x$ where $\exists\, y$ with $x \to y$ but $y \not\to x$. States 3 and 6 satisfy this.

**Step 2 — Decompose the remaining states:** $T^c = \{1, 2, 4, 5\}$. Find communicating classes: $C_1 = \{1, 4\}$ and $C_2 = \{2, 5\}$.

**Step 3 — Classify:** Both $C_1$ and $C_2$ are finite closed irreducible sets → all states in them are **recurrent**. States 3 and 6 are **transient**.

$$S = \underbrace{\{3, 6\}}_{\text{transient}} \cup \underbrace{\{1, 4\}}_{\text{recurrent class}} \cup \underbrace{\{2, 5\}}_{\text{recurrent class}}$$

(Source: [[MATH 457∕557 - Homework 3]])

### Example 3: Gambler's Ruin with $N = \infty$ (HW3 C8)

**Problem:** Random walk on $\{0, 1, 2, \ldots\}$ where $p(x, x+1) = p$ and $p(x, x-1) = q = 1-p$ for $x \ge 1$, and $p(0, 0) = 1$. Classify all states.

**Solution:** State 0 is **absorbing**: $p(0,0) = 1$, so $\rho_{00} = 1$ and it is recurrent. For $x \ge 1$: state $x$ can reach 0, but 0 cannot reach $x$ (0 is absorbing). Therefore $x \not\leftrightarrow 0$, so $x$ is **transient**.

$$S = \underbrace{\{0\}}_{\text{recurrent (absorbing)}} \cup \underbrace{\{1, 2, 3, \ldots\}}_{\text{transient}}$$

(Source: [[MATH 457∕557 - Homework 3]])

## See Also

- [[Markov Chains]]
- [[Stationary Distributions]]
- [[Poisson Process]]
