---
title: Holomorphic Functions
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [complex-analysis, differentiation, analytic-functions]
sources: [MATH485LectureNote.pdf]
---

# Holomorphic Functions

A complex function $f: D \to \mathbb{C}$ (where $D \subseteq \mathbb{C}$ is open) is **holomorphic** (or **complex-differentiable**) at $z_0 \in D$ if the limit

$$f'(z_0) = \lim_{z \to z_0} \frac{f(z) - f(z_0)}{z - z_0}$$

exists. A function holomorphic on all of $D$ is called holomorphic on $D$. Functions holomorphic on all of $\mathbb{C}$ are called **entire**.

## Relation to Real Differentiability

Writing $f(z) = u(x,y) + iv(x,y)$, holomorphicity is a much stronger condition than real differentiability of $u$ and $v$. The key constraint is the [[Cauchy-Riemann Equations]]:

$$\frac{\partial u}{\partial x} = \frac{\partial v}{\partial y}, \qquad \frac{\partial u}{\partial y} = -\frac{\partial v}{\partial x}$$

If $u$ and $v$ have continuous first partial derivatives and satisfy Cauchy-Riemann, then $f$ is holomorphic (Source: [[MATH 485∕585 — Intro to Complex Variables]]).

## Key Properties

- **Analyticity:** Holomorphic functions are analytic — they equal their Taylor series in a neighborhood of every point. (This is a deep theorem, unlike the real case.)
- **Cauchy's integral theorem:** $\oint_C f(z)\,dz = 0$ for closed contours in simply connected domains. See [[Cauchy's Integral Theorem]].
- **Cauchy's integral formula:** $f(z_0) = \frac{1}{2\pi i}\oint_C \frac{f(z)}{z - z_0}\,dz$.
- **Liouville's theorem:** A bounded entire function is constant.
- **Maximum modulus principle:** $|f|$ cannot attain a local maximum inside an open connected domain unless $f$ is constant.

## Examples

| Function | Holomorphic? | Notes |
|---|---|---|
| $f(z) = z^n$ | Yes (entire) | Polynomial |
| $f(z) = e^z$ | Yes (entire) | $e^z = e^x(\cos y + i\sin y)$ |
| $f(z) = \bar{z}$ | No | Fails Cauchy-Riemann |
| $f(z) = |z|^2$ | No | Only real-differentiable |
| $f(z) = 1/z$ | Yes on $\mathbb{C}\setminus\{0\}$ | Pole at origin |

## See Also

- [[Complex Numbers]]
- [[Cauchy-Riemann Equations]]
- [[Complex Integration]]
- [[Cauchy's Integral Theorem]]
- [[Power Series (Complex Analysis)]]
