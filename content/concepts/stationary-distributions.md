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

## Examples

- **Basketball player** (HW4): Hit/miss chain with $p(H,M)=0.6$, $p(M,H)=0.7$ → $\pi(H) = 7/13$ is the long-run shooting fraction.
- **Homeowner/renter** (HW2): 1990 census data with decade transitions → stationary distribution gives long-run homeownership rate.
- **Working/nonworking women** (HW5): Sociology chain converges to $\pi = (5/7, 2/7)$.

## See Also

- [[Markov Chains]]
- [[Recurrence and Transience]]
