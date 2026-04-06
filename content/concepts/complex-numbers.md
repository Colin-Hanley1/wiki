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

With these operations, $\mathbb{C}$ is a **field** — satisfying closure, commutativity, associativity, identity elements ($0$ and $1$), additive and multiplicative inverses, and distributivity (Source: [[MATH 485∕585 — Intro to Complex Variables]]).

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

## Worked Examples

### Example 1: Arithmetic and Division (Lecture Notes Ex. 1.9)

**Problem:** Write $\frac{1-i}{1+i}$ in the form $a + bi$.

**Solution:** Multiply numerator and denominator by the conjugate of the denominator:

$$\frac{1-i}{1+i} = \frac{(1-i)(1-i)}{(1+i)(1-i)} = \frac{1 - 2i + i^2}{1 - i^2} = \frac{1 - 2i - 1}{1 + 1} = \frac{-2i}{2} = -i$$

### Example 2: Polar Form Conversion (Lecture Notes Ex. 1.13)

**Problem:** Find the polar form of $z = -2 + i$.

**Solution:**

$$r = |z| = \sqrt{(-2)^2 + 1^2} = \sqrt{5}$$

Since $\Re(z) < 0$ and $\Im(z) > 0$, Theorem 1.14 gives:

$$\varphi = \arctan\!\left(\frac{1}{-2}\right) + \pi = \pi - \arctan\!\left(\frac{1}{2}\right) \approx 2.68$$

$$z = \sqrt{5}\left(\cos(2.68) + i\sin(2.68)\right)$$

### Example 3: Solving Quadratic Equations over $\mathbb{C}$ (Lecture Notes Ex. 1.10)

**Problem:** Solve $z^2 - (1+3i)z + (-2+2i) = 0$.

**Solution:** Complete the square: $\left(z - \frac{1+3i}{2}\right)^2 = -\frac{i}{2}$. Setting $w = z - \frac{1+3i}{2}$ and writing $w = a + bi$, equate real and imaginary parts of $w^2 = -i/2$:

$$a^2 - b^2 = 0, \quad 2ab = -\frac{1}{2}$$

Solving: $a = \pm\frac{1}{2}$, giving $w_1 = \frac{1}{2} - \frac{1}{2}i$ and $w_2 = -\frac{1}{2} + \frac{1}{2}i$. Therefore:

$$z_1 = 1 + i, \quad z_2 = 2i$$

(Source: [[MATH 485∕585 — Intro to Complex Variables]])

## Historical Note

Gerolamo Cardano (1501–1576) first manipulated $\sqrt{-1}$ while solving cubics. René Descartes (1596–1650) introduced the term "imaginary." The Argand diagram is named after Jean-Robert Argand (1768–1822), though Caspar Wessel (1745–1818) described it first.

## See Also

- [[Holomorphic Functions]]
- [[Cauchy-Riemann Equations]]
- [[Bayesian Networks]] — complex probability amplitudes appear in [[Q-Sample]]
