---
title: MATH 485/585 — Intro to Complex Variables
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [complex-analysis, math-485, lecture-notes, university-of-alabama]
sources: [MATH485LectureNote.pdf]
---

# MATH 485/585 — Intro to Complex Variables

**Author:** [[Lukas Bundrock]]
**Institution:** [[University of Alabama]], Department of Mathematics
**Term:** Spring 2026
**Reference text:** Saff, E.B. and Snider, A.D., *Fundamentals of Complex Analysis with Applications to Engineering and Science*

## Overview

Lecture notes for an introductory course on functions of a complex variable, emphasizing differential and integral theory. The course is computation-focused: formal proofs are often sketched, with the main emphasis on applying techniques to solve problems. The notes are structured as a lecture script (updated throughout the semester) rather than a polished textbook.

## Chapter Summary

### 1. Complex Numbers — Definition and Basic Operations

- Motivates $\mathbb{C}$ by the failure of $\mathbb{R}$ to solve $x^2 + 1 = 0$. Historical note: Cardano (1501–1576) first worked with $\sqrt{-1}$; Descartes coined "imaginary."
- **Definition:** $z = a + bi$, $a, b \in \mathbb{R}$. Addition and multiplication defined component-wise.
- **Field axioms:** $\mathbb{C}$ with standard addition and multiplication forms a field (closure, commutativity, associativity, identities, inverses, distributivity). Contrasted with $M_2$ (2×2 real matrices), which fails commutativity and universal invertibility.
- **Absolute value and conjugate:** $|z| = \sqrt{a^2 + b^2}$, $\bar{z} = a - bi$. Key properties: $|z|^2 = z\bar{z}$, triangle inequality $|z_1 + z_2| \le |z_1| + |z_2|$, reverse triangle inequality.
- **Polar form:** $z = r(\cos\varphi + i\sin\varphi)$, $r = |z|$, $\varphi = \mathrm{Arg}(z) \in (-\pi, \pi]$. Piecewise formula for principal argument. Product rule: $z_1 z_2 = r_1 r_2 (\cos(\varphi_1 + \varphi_2) + i\sin(\varphi_1 + \varphi_2))$.
- **De Moivre's formula:** $(\cos x + i\sin x)^n = \cos(nx) + i\sin(nx)$.

### 2. Complex-Valued Functions and Sequences

- Any complex function $f(z) = u(x,y) + iv(x,y)$ decomposes into real and imaginary parts $u, v : \tilde{D} \to \mathbb{R}$.
- **Sequences:** Boundedness and convergence of $(z_n) \subset \mathbb{C}$ reduce to the real and imaginary parts (Theorem 2.5). No order on $\mathbb{C}$, so no monotonicity or bounded-above/below.
- **Limits of functions:** $\varepsilon$-$\delta$ definition for $\lim_{z \to z_0} f(z) = L$. Geometrically: punctured disk in domain maps into disk in codomain.
- **Sequential characterization (Theorem 2.13):** $\lim_{z \to z_0} f(z) = L$ iff $f(z_n) \to L$ for every sequence $z_n \to z_0$.
- **Continuity (Definition 2.17):** $\varepsilon$-$\delta$ formulation; equivalent sequential characterization (Theorem 2.20). Sums, products, quotients, and compositions of continuous functions are continuous.
- **Limit at infinity (Remark 2.12):** requires convergence along all directions simultaneously — stronger than real $\pm\infty$.

### 3. Topology of the Complex Plane

- Open discs $B_r(z_0)$, interior points, open/closed sets, boundary, closure, boundedness.
- Ambient-space dependence: $(0,1)$ is open in $\mathbb{R}$ but not in $\mathbb{C}$.

### 4. Complex Differentiation

- [[Cauchy-Riemann Equations]] (content in later chapters of the notes).

### 5. Elementary Functions

- Complex exponential and trigonometric functions.
- [[Complex Logarithm]] and its branches.
- Complex powers and roots.

### 6. Complex Integration

- Antiderivatives, contour integrals on triangles.
- [[Cauchy's Integral Theorem]] and [[Cauchy's Integral Formula]].
- Bounds for [[Holomorphic Functions]].

### 7. Series Expansions of Holomorphic Functions

- [[Power Series]] recap and convergence.
- Taylor series for holomorphic functions.

## Notable Features

- Worked examples dominate: quadratic equations over $\mathbb{C}$, polar form computations, explicit $\varepsilon$-$\delta$ proofs for continuity.
- Exercises on algebraic structures ($GL_2$, $\mathbb{Q}^2$ as fields) show the non-triviality of field axioms.
- The treatment of limits and continuity closely parallels real analysis (Calculus I–III), making the transition explicit.

## See Also

- [[Complex Numbers]]
- [[Holomorphic Functions]]
- [[Cauchy-Riemann Equations]]
- [[Complex Integration]]
- [[Cauchy's Integral Theorem]]
- [[Power Series (Complex Analysis)]]
- [[Lukas Bundrock]]
- [[University of Alabama]]
