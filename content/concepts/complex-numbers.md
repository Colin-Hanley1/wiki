---
title: Complex Numbers
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [complex-analysis, algebra, field-theory]
sources: [MATH485LectureNote.pdf]
---

# Complex Numbers

The set $\mathbb{C} = \{z = a + bi : a, b \in \mathbb{R}\}$, where $i^2 = -1$. Complex numbers extend the reals to guarantee solvability of all polynomial equations (Fundamental Theorem of Algebra).

## Definition and Arithmetic

A complex number $z = a + bi$ has **real part** $\Re(z) = a$ and **imaginary part** $\Im(z) = b$. Two complex numbers are equal iff their real and imaginary parts agree.

**Operations:** For $z_1 = a + bi$, $z_2 = c + di$:

- Addition: $z_1 + z_2 = (a+c) + (b+d)i$
- Multiplication: $z_1 z_2 = (ac - bd) + (bc + ad)i$

With these operations, $\mathbb{C}$ is a **field** — satisfying closure, commutativity, associativity, identity elements ($0$ and $1$), additive and multiplicative inverses, and distributivity (Source: [[MATH 485/585 — Intro to Complex Variables]]).

**Multiplicative inverse:** For $z = a + bi \ne 0$:

$$z^{-1} = \frac{a}{a^2 + b^2} - \frac{b}{a^2 + b^2}i$$

obtained by multiplying numerator and denominator by the conjugate $\bar{z}$.

## Absolute Value and Conjugate

- **Absolute value:** $|z| = \sqrt{a^2 + b^2}$ (Euclidean distance to origin)
- **Complex conjugate:** $\bar{z} = a - bi$ (reflection about the real axis)

Key properties:

| Property | Formula |
|---|---|
| Double conjugation | $\overline{\overline{z}} = z$ |
| Conjugate of sum | $\overline{z_1 + z_2} = \bar{z}_1 + \bar{z}_2$ |
| Conjugate of product | $\overline{z_1 z_2} = \bar{z}_1 \bar{z}_2$ |
| Modulus-conjugate relation | $|z|^2 = z\bar{z}$ |
| Multiplicativity of modulus | $|z_1 z_2| = |z_1||z_2|$ |
| Triangle inequality | $|z_1 + z_2| \le |z_1| + |z_2|$ |
| Reverse triangle inequality | $\big||z_1| - |z_2|\big| \le |z_1 - z_2|$ |

## Polar Form

Any $z \in \mathbb{C}$ can be written as $z = r(\cos\varphi + i\sin\varphi)$, where $r = |z| \ge 0$ and $\varphi \in (-\pi, \pi]$ is the **principal argument** $\mathrm{Arg}(z)$.

**Geometric interpretation:** Multiplication multiplies moduli and adds arguments:

$$z_1 z_2 = r_1 r_2 \big(\cos(\varphi_1 + \varphi_2) + i\sin(\varphi_1 + \varphi_2)\big)$$

**De Moivre's formula:** $(\cos x + i\sin x)^n = \cos(nx) + i\sin(nx)$ for $n \in \mathbb{Z}$.

## Representation in $\mathbb{R}^2$

The mapping $z \mapsto (\Re(z), \Im(z))$ is a vector space isomorphism $\mathbb{C} \cong \mathbb{R}^2$. This identification — the **Argand diagram** — underlies the geometric interpretation of complex analysis.

## Historical Note

Gerolamo Cardano (1501–1576) first manipulated $\sqrt{-1}$ while solving cubics. René Descartes (1596–1650) introduced the term "imaginary." The Argand diagram is named after Jean-Robert Argand (1768–1822), though Caspar Wessel (1745–1818) described it first.

## See Also

- [[Holomorphic Functions]]
- [[Cauchy-Riemann Equations]]
- [[Bayesian Networks]] — complex probability amplitudes appear in [[Q-Sample]]
