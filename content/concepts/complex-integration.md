---
title: Complex Integration
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [complex-analysis, integration, contour-integrals]
sources: [MATH485LectureNote.pdf]
---

# Complex Integration

Integration of complex functions along curves (contours) in the complex plane. Central to complex analysis — connects holomorphicity, series representations, and evaluation of real integrals.

## Contour Integrals

Given a smooth curve $C$ parametrized by $z(t) = x(t) + iy(t)$, $t \in [a,b]$, and a continuous function $f: D \to \mathbb{C}$:

$$\int_C f(z)\,dz = \int_a^b f(z(t))\,z'(t)\,dt$$

This reduces to real integrals: if $f = u + iv$ and $dz = dx + i\,dy$, then

$$\int_C f\,dz = \int_C (u\,dx - v\,dy) + i\int_C (v\,dx + u\,dy)$$

## Key Properties

- **Linearity:** $\int_C (\alpha f + \beta g)\,dz = \alpha\int_C f\,dz + \beta\int_C g\,dz$
- **Reversal:** $\int_{-C} f\,dz = -\int_C f\,dz$
- **ML-inequality:** $\left|\int_C f\,dz\right| \le M \cdot L(C)$ where $M = \max_{z \in C}|f(z)|$ and $L(C)$ is the arc length.

## Antiderivatives

If $F'(z) = f(z)$ on a domain $D$, then $\int_C f\,dz = F(z(b)) - F(z(a))$ for any contour $C$ in $D$ from $z(a)$ to $z(b)$. Path-independence holds when $f$ has an antiderivative.

## Central Theorems

- **[[Cauchy's Integral Theorem]]:** If $f$ is holomorphic on a simply connected domain, then $\oint_C f\,dz = 0$ for every closed contour in that domain.
- **Cauchy's Integral Formula:** $f(z_0) = \frac{1}{2\pi i}\oint_C \frac{f(z)}{z - z_0}\,dz$ for $z_0$ inside $C$.
- **Generalized formula:** $f^{(n)}(z_0) = \frac{n!}{2\pi i}\oint_C \frac{f(z)}{(z - z_0)^{n+1}}\,dz$.

These results have no real-variable analogue — they are consequences of the rigidity imposed by the [[Cauchy-Riemann Equations]] (Source: [[MATH 485∕585 — Intro to Complex Variables]]).

## Applications to Real Integrals

Contour integration techniques (residue theorem, Jordan's lemma) allow evaluation of real integrals that resist elementary methods, e.g.:

$$\int_{-\infty}^{\infty} \frac{\cos x}{x^2 + 1}\,dx = \frac{\pi}{e}$$

## See Also

- [[Holomorphic Functions]]
- [[Cauchy's Integral Theorem]]
- [[Cauchy-Riemann Equations]]
- [[Power Series (Complex Analysis)]]
