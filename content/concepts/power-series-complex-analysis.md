---
title: Power Series (Complex Analysis)
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [complex-analysis, series, convergence, analytic-functions]
sources: [MATH485LectureNote.pdf]
---

# Power Series (Complex Analysis)

A power series centered at $z_0 \in \mathbb{C}$ is a series of the form

$$\sum_{n=0}^{\infty} a_n (z - z_0)^n, \qquad a_n \in \mathbb{C}.$$

Power series are the bridge between [[Holomorphic Functions]] and explicit computation.

## Radius of Convergence

Every power series has a **radius of convergence** $R \in [0, \infty]$ such that:

- The series converges absolutely for $|z - z_0| < R$.
- The series diverges for $|z - z_0| > R$.
- On $|z - z_0| = R$, behavior must be checked case-by-case.

Formulas:

$$\frac{1}{R} = \limsup_{n \to \infty} |a_n|^{1/n} \qquad \text{(Cauchy-Hadamard)}$$

$$R = \lim_{n \to \infty} \left|\frac{a_n}{a_{n+1}}\right| \qquad \text{(ratio test, when limit exists)}$$

## Taylor Series

If $f$ is holomorphic on an open disc $B_R(z_0)$, then $f$ equals its Taylor series on that disc:

$$f(z) = \sum_{n=0}^{\infty} \frac{f^{(n)}(z_0)}{n!}(z - z_0)^n, \qquad |z - z_0| < R$$

This is a consequence of [[Cauchy's Integral Theorem|Cauchy's integral formula]] — a striking contrast with real analysis, where $C^\infty$ functions need not be analytic (Source: [[MATH 485∕585 — Intro to Complex Variables]]).

## Key Properties

- **Uniform convergence:** On any closed disc $\overline{B_r(z_0)}$ with $r < R$, the convergence is uniform and absolute.
- **Term-by-term differentiation:** Inside the radius of convergence, a power series can be differentiated term by term, and the derived series has the same radius of convergence.
- **Identity theorem:** If two power series agree on a set with a limit point, they are identical.

## Laurent Series

For functions holomorphic on an annulus $r < |z - z_0| < R$, the generalization is the Laurent series:

$$f(z) = \sum_{n=-\infty}^{\infty} a_n (z - z_0)^n$$

The **principal part** (negative powers) captures the singular behavior. The coefficient $a_{-1}$ is the **residue**, central to the residue theorem for evaluating integrals.

## See Also

- [[Holomorphic Functions]]
- [[Cauchy's Integral Theorem]]
- [[Complex Integration]]
- [[Complex Numbers]]
