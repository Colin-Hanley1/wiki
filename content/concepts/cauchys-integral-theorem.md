---
title: Cauchy's Integral Theorem
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [complex-analysis, integration, fundamental-theorem]
sources: [MATH485LectureNote.pdf]
---

# Cauchy's Integral Theorem

The foundational result of complex integration: holomorphic functions integrate to zero around closed contours in simply connected domains.

## Statement

Let $D \subseteq \mathbb{C}$ be a simply connected domain and let $f: D \to \mathbb{C}$ be holomorphic. Then for every closed contour $C$ in $D$:

$$\oint_C f(z)\,dz = 0$$

(Source: [[MATH 485∕585 — Intro to Complex Variables]])

## Equivalent Formulations

- **Path independence:** If $f$ is holomorphic on a simply connected domain, then $\int_C f\,dz$ depends only on the endpoints of $C$, not on the path.
- **Existence of antiderivative:** On a simply connected domain, every holomorphic function has a holomorphic antiderivative.
- **Deformation principle:** If $C_1$ and $C_2$ are homotopic closed contours in a domain where $f$ is holomorphic, then $\oint_{C_1} f\,dz = \oint_{C_2} f\,dz$.

## Proof Approaches

1. **Via Green's theorem** (requires $f'$ continuous): Apply Green's theorem to the real and imaginary parts, then use the [[Cauchy-Riemann Equations]].
2. **Goursat's proof** (no extra regularity): Proves the result for triangles first (by successive bisection and a shrinking-triangle argument), then extends to general contours.

The MATH 485∕585 notes include a supplementary section on contour integrals over triangles, suggesting the Goursat approach.

## Consequences

- **Cauchy's Integral Formula:** $f(z_0) = \frac{1}{2\pi i}\oint_C \frac{f(z)}{z - z_0}\,dz$ — recovers function values from boundary data.
- **Liouville's theorem:** Bounded entire functions are constant (follows from Cauchy's inequality).
- **Fundamental Theorem of Algebra:** Every non-constant polynomial has a root in $\mathbb{C}$ (via Liouville).
- **Taylor/Laurent series:** Holomorphic functions are analytic; see [[Power Series (Complex Analysis)]].
- **Bounds for holomorphic functions:** Cauchy's inequality gives $|f^{(n)}(z_0)| \le \frac{n! M}{r^n}$ where $M = \max_{|z - z_0| = r} |f(z)|$.

## See Also

- [[Complex Integration]]
- [[Holomorphic Functions]]
- [[Cauchy-Riemann Equations]]
- [[Power Series (Complex Analysis)]]
