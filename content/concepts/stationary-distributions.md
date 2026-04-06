---
title: Stationary Distributions
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, markov-chains, equilibrium]
sources: [HW2_MATH457_557_Spring_2026_v1-2.pdf, HW4_MATH457_557_Spring_2026_v5-1.pdf, HW5_MATH457_557_Spring_2026_v5-1.pdf]
---

# Stationary Distributions

A probability vector $\vec{\pi}$ is a **stationary distribution** (or equilibrium distribution) of a [[Markov Chains|Markov chain]] with transition matrix $P$ if

$$\vec{\pi} P = \vec{\pi}, \qquad \sum_x \pi(x) = 1, \qquad \pi(x) \ge 0 \text{ for all } x.$$

Intuitively, if the chain starts in distribution $\vec{\pi}$, it remains in $\vec{\pi}$ at all future times.

## Existence and Uniqueness

- **Theorem 1.14:** An irreducible, positive recurrent chain has a unique stationary distribution.
- **Finite irreducible chains** are always positive recurrent, so they always have a unique $\vec{\pi}$.
- **Reducible chains** may have infinitely many stationary distributions — one for each closed communicating class (Source: [[MATH 457∕557 - Homework 2]]).

## Computing $\vec{\pi}$

**Two-state chain** with $p(1,2) = a$ and $p(2,1) = b$:

$$\vec{\pi} = \left(\frac{b}{a+b},\ \frac{a}{a+b}\right)$$

**General method:** Solve the linear system $\vec{\pi}(P - I) = \vec{0}$ subject to $\sum \pi(x) = 1$.

## Connection to Long-Run Behavior

Under the I.R.A. conditions (irreducible, recurrent, aperiodic):

$$\pi(y) = \lim_{n \to \infty} \frac{N_n(y)}{n} = \frac{1}{E_y[T_y]}$$

where $N_n(y)$ counts visits to state $y$ in $n$ steps and $T_y$ is the return time (Source: [[MATH 457∕557 - Homework 4]]).

## Worked Examples

### Example 1: Two-State Chain (HW4 D1 — Basketball Player)

**Problem:** A player hits with $p(H,M) = 0.6$, misses with $p(M,H) = 0.7$. Find the long-run fraction of shots hit.

**Solution:** For a two-state chain with $p(1,2) = a = 0.6$ and $p(2,1) = b = 0.7$:

$$\vec{\pi} = \left(\frac{b}{a+b},\; \frac{a}{a+b}\right) = \left(\frac{0.7}{1.3},\; \frac{0.6}{1.3}\right) = \left(\frac{7}{13},\; \frac{6}{13}\right)$$

The chain is finite and irreducible (both states communicate), so it is positive recurrent. Since $p(H,H) = 0.4 > 0$, state $H$ is aperiodic. By the convergence theorem, $\lim_{n\to\infty} N_n(H)/n = \pi(H) = 7/13 \approx 0.538$.

(Source: [[MATH 457∕557 - Homework 4]])

### Example 2: Solving a 3-State System (HW2 B7)

**Problem:** Find $\vec{\pi}$ for $P = \begin{pmatrix} 0.6 & 0.4 & 0 \\ 0.2 & 0.4 & 0.4 \\ 0 & 0.4 & 0.6 \end{pmatrix}$ (modified from textbook Exercise 1.9).

**Solution:** Solve $\vec{\pi} P = \vec{\pi}$ with $\pi(1) + \pi(2) + \pi(3) = 1$:

$$0.6\pi(1) + 0.2\pi(2) = \pi(1) \implies -0.4\pi(1) + 0.2\pi(2) = 0 \implies \pi(2) = 2\pi(1)$$

$$0.4\pi(2) + 0.6\pi(3) = \pi(3) \implies 0.4\pi(2) = 0.4\pi(3) \implies \pi(3) = \pi(2) = 2\pi(1)$$

$$\pi(1) + 2\pi(1) + 2\pi(1) = 1 \implies \pi(1) = \frac{1}{5}$$

$$\vec{\pi} = \left(\frac{1}{5},\; \frac{2}{5},\; \frac{2}{5}\right)$$

(Source: [[MATH 457∕557 - Homework 2]])

### Example 3: Non-Unique Stationary Distributions (HW2 B8)

**Problem:** A chain with block-diagonal $P$ has states $\{1,2,3,4\}$ where $\{1,2\}$ and $\{3,4\}$ are separate closed classes. $P^2$ has infinitely many stationary distributions.

**Key insight:** When a chain is reducible with multiple closed classes, any convex combination of the per-class stationary distributions is also stationary. Uniqueness requires irreducibility (Source: [[MATH 457∕557 - Homework 2]]).

## See Also

- [[Markov Chains]]
- [[Recurrence and Transience]]
