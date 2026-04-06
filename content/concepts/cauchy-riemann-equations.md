---
title: Cauchy-Riemann Equations
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [complex-analysis, differentiation, pde]
sources: [MATH485LectureNote.pdf]
---

# Cauchy-Riemann Equations

The Cauchy-Riemann equations are the necessary (and, with mild regularity, sufficient) conditions for a complex function to be [[Holomorphic Functions|holomorphic]].

## Statement

Let $f(z) = u(x,y) + iv(x,y)$ where $z = x + iy$. If $f$ is holomorphic at $z_0 = x_0 + iy_0$, then:

$$\frac{\partial u}{\partial x}(x_0, y_0) = \frac{\partial v}{\partial y}(x_0, y_0), \qquad \frac{\partial u}{\partial y}(x_0, y_0) = -\frac{\partial v}{\partial x}(x_0, y_0)$$

**Sufficient condition:** If $u$ and $v$ have continuous first partial derivatives in a neighborhood of $z_0$ and satisfy the Cauchy-Riemann equations at $z_0$, then $f$ is holomorphic at $z_0$ (Source: [[MATH 485∕585 — Intro to Complex Variables]]).

## Derivation

The complex derivative $f'(z_0) = \lim_{h \to 0} \frac{f(z_0 + h) - f(z_0)}{h}$ must yield the same limit regardless of the direction $h$ approaches $0$:

- Along the real axis ($h = \Delta x$): $f'(z_0) = u_x + iv_x$
- Along the imaginary axis ($h = i\Delta y$): $f'(z_0) = v_y - iu_y$

Equating real and imaginary parts gives the Cauchy-Riemann equations.

## Consequences

- **Harmonic functions:** If $f = u + iv$ is holomorphic, then both $u$ and $v$ are harmonic: $\nabla^2 u = 0$ and $\nabla^2 v = 0$. The function $v$ is called the **harmonic conjugate** of $u$.
- **Derivative formula:** $f'(z) = u_x + iv_x = v_y - iu_y$.
- **Polar form:** In polar coordinates $(r, \theta)$, the equations become $u_r = \frac{1}{r}v_\theta$ and $v_r = -\frac{1}{r}u_\theta$.

## Examples

| $f(z)$ | $u(x,y)$ | $v(x,y)$ | CR satisfied? |
|---|---|---|---|
| $z^2 = (x^2 - y^2) + 2xyi$ | $x^2 - y^2$ | $2xy$ | Yes: $u_x = 2x = v_y$, $u_y = -2y = -v_x$ |
| $\bar{z} = x - iy$ | $x$ | $-y$ | No: $u_x = 1 \ne v_y = -1$ |
| $e^z = e^x\cos y + ie^x\sin y$ | $e^x\cos y$ | $e^x\sin y$ | Yes |

## See Also

- [[Holomorphic Functions]]
- [[Complex Numbers]]
- [[Complex Integration]]
