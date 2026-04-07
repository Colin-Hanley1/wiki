---
title: MATH 451∕551 Exam 2 Study Guide
type: analysis
created: 2026-04-07
updated: 2026-04-07
tags: [mathematical-statistics, exam-prep, confidence-intervals, hypothesis-testing]
sources: [Solution_HW5_MATH451_551_Spring2026_v7.pdf, HW6_MATH451_551_Spring2026_v7.pdf, HW7_MATH451_551_Spring2026_v9.pdf, HW8_MATH451_551_Spring2026_sol_v8.pdf]
---

# MATH 451∕551 Exam 2 Study Guide

**Exam:** Friday, April 10, 2026 — 1:00–1:50 PM (50 minutes), Gordon Palmer Hall 234
**Coverage:** Sections 8.5–8.9 (Confidence Intervals), HW5–HW8 (Type I and Type II)
**Allowed:** One two-sided A4 review sheet (handwritten or typed). No calculator. Tables provided (normal, $t$, $\chi^2$, $F$).

---

## 1. Pivotal Quantity Method (HW5, Sections 8.5–8.6)

### Core Idea

A **pivotal quantity** $Q(Y_1, \ldots, Y_n;\, \theta)$ is a function of data and the parameter whose distribution does **not** depend on $\theta$. To build a CI:

1. Identify $Q$ with known distribution
2. Find $a, b$ such that $P(a \le Q \le b) = 1 - \alpha$
3. Invert the inequality to isolate $\theta$

### Key Pivotal Quantities

| Setting | Pivot | Distribution |
|---|---|---|
| Normal mean, $\sigma$ known | $Z = \frac{\bar{Y} - \mu}{\sigma/\sqrt{n}}$ | $N(0,1)$ |
| Normal mean, $\sigma$ unknown | $T = \frac{\bar{Y} - \mu}{S/\sqrt{n}}$ | $t_{n-1}$ |
| Normal variance | $\frac{(n-1)S^2}{\sigma^2}$ | $\chi^2_{n-1}$ |
| Exponential rate (Ex 8.4) | $U = Y/\theta$ | $\text{Exp}(1)$ |
| Uniform$(0,\theta)$ max | $Y_{(n)}/\theta$ | $\text{Beta}(n,1)$ with CDF $(y/\theta)^n$ |

### Practice Problem: Exponential Pivotal (HW5 E2–E3)

For $Y \sim \text{Exp}(\theta)$, $U = Y/\theta \sim \text{Exp}(1)$. The 90% CI uses $P(a \le Y/\theta \le b) = 0.9$, inverted to give $Y/b \le \theta \le Y/a$. The **shortest** interval requires minimizing $1/a - 1/b$ subject to $e^{-a} - e^{-b} = 0.9$.

### Practice Problem: $\chi^2$ CI for Variance (HW5 E1/Ex 8.39)

For gamma-distributed $Y$ with $2Y/\beta \sim \chi^2_4$:

$$P(0.71072 \le 2Y/\beta \le 9.48773) = 0.9 \implies \frac{2Y}{9.48773} \le \beta \le \frac{2Y}{0.71072}$$

### Practice Problem: Uniform Order Statistic CI (HW5 E1/Ex 8.43)

For $Y_1, \ldots, Y_n \sim \text{Uniform}(0, \theta)$, $P(Y_{(n)} \le y) = (y/\theta)^n$. A lower 95% bound:

$$\hat{\theta}_L = Y_{(n)} / (0.95)^{1/n}$$

---

## 2. Small-Sample CIs (HW5–HW6, Section 8.7)

### Single Mean ($\sigma$ unknown)

$$\bar{Y} \pm t_{\alpha/2,\, n-1} \cdot \frac{S}{\sqrt{n}}$$

**Requires:** Normality assumption. Check: sample size, no extreme skew/outliers.

### Practice Problem (HW6 Ex 8.89a)

$n = 3$, $\bar{Y} = 3.57$, $S = 3.67$, 90% CI:

$$3.57 \pm 2.92 \times \frac{3.67}{\sqrt{3}}$$

where $t_{0.05, 2} = 2.92$ (2 df).

### Variance CI

$$\left(\frac{(n-1)S^2}{\chi^2_{\alpha/2,\, n-1}},\; \frac{(n-1)S^2}{\chi^2_{1-\alpha/2,\, n-1}}\right)$$

**Upper bound only** for $\sigma$:

$$\sigma \le \sqrt{\frac{(n-1)S^2}{\chi^2_{1-\alpha,\, n-1}}}$$

---

## 3. Two-Sample CIs (HW6, Section 8.8)

### Difference of Means (Equal Variances)

$$(\bar{Y}_1 - \bar{Y}_2) \pm t_{\alpha/2,\, n_1+n_2-2} \cdot S_p\sqrt{\frac{1}{n_1} + \frac{1}{n_2}}$$

where the **pooled variance** is:

$$S_p^2 = \frac{(n_1 - 1)S_1^2 + (n_2 - 1)S_2^2}{n_1 + n_2 - 2}$$

**Assumptions:** Independent normal populations with equal variances.

### Practice Problem (HW6 Ex 8.90)

$n_1 = 15$, $n_2 = 15$, $\bar{Y}_1 = 446$, $\bar{Y}_2 = 534$, $S_p^2 = 1894.5$, 95% CI:

$$446 - 534 \pm 2.048\sqrt{1894.5(1/15 + 1/15)}$$

where $t_{0.025, 28} = 2.048$.

---

## 4. Large-Sample CIs (HW7, Section 8.6)

### CI for a Proportion

$$\hat{p} \pm z_{\alpha/2}\sqrt{\frac{\hat{p}(1-\hat{p})}{n}}$$

Based on CLT: $\frac{\hat{p} - p}{\sqrt{p(1-p)/n}} \stackrel{d}{\to} N(0,1)$.

### Sample Size Determination

For margin of error $E$ with confidence $1 - \alpha$:

$$n = \left\lceil \frac{z_{\alpha/2}^2 \cdot \sigma^2}{E^2}\right\rceil$$

For proportions with unknown $p$, use conservative bound $p(1-p) \le 1/4$:

$$n = \left\lceil \frac{z_{\alpha/2}^2}{4E^2}\right\rceil$$

### Two-Sample Difference of Proportions

$$(\hat{p}_1 - \hat{p}_2) \pm z_{\alpha/2}\sqrt{\frac{\hat{p}_1(1-\hat{p}_1)}{n_1} + \frac{\hat{p}_2(1-\hat{p}_2)}{n_2}}$$

### Practice Problem (HW7)

Survey: $\hat{p} = 0.62$, $n = 500$, 95% CI:

$$0.62 \pm 1.96\sqrt{\frac{0.62 \times 0.38}{500}} = 0.62 \pm 0.0425$$

Sample size for margin $E = 0.03$ at 95%: $n = \lceil 1.96^2 / (4 \times 0.03^2)\rceil = \lceil 1067.1\rceil = 1068$.

---

## 5. Hypothesis Testing Basics (HW8 — Ex 8.111, 8.117 only)

### Framework

- $H_0$: null hypothesis, $H_a$: alternative
- **Type I error:** $\alpha = P(\text{reject } H_0 \mid H_0 \text{ true})$
- **Type II error:** $\beta = P(\text{fail to reject} \mid H_a \text{ true})$
- **P-value:** smallest $\alpha$ at which you'd reject

### CI–Test Duality

> Reject $H_0: \theta = \theta_0$ at level $\alpha$ $\iff$ $\theta_0 \notin$ the $(1-\alpha)$ CI for $\theta$.

This means you can use your CI formulas to answer hypothesis testing questions.

### One-Sample $t$-Test

$$T = \frac{\bar{Y} - \mu_0}{S/\sqrt{n}} \sim t_{n-1}$$

Reject $H_0: \mu = \mu_0$ if $|T| > t_{\alpha/2,\, n-1}$ (two-sided).

### Binomial Test

For $H_0: p = p_0$, compute exact binomial p-value or use normal approximation:

$$Z = \frac{\hat{p} - p_0}{\sqrt{p_0(1-p_0)/n}}$$

---

## 6. Key Things to Remember

1. **No calculator allowed** — leave answers as arithmetic expressions.
2. **Tables provided:** $Z$, $t$, $\chi^2$, $F$ — know how to read them (especially $\chi^2$ with one-sided vs two-sided $\alpha$).
3. **State assumptions** when asked: normality, independence, equal variances.
4. **One-sided bounds** use $z_\alpha$ or $t_\alpha$ (not $z_{\alpha/2}$).
5. **Shortest CI** for symmetric distributions uses equal tails; for $\chi^2$, the equal-tail version is standard but NOT the shortest.
6. **MATH 551 only** sections are extra credit for 451 students — attempt them.

---

## Homework-to-Topic Map

| HW | Key Exercises | Topics |
|---|---|---|
| HW5 | Ex 8.39, 8.41, 8.43, 8.81, 8.88, 8.96, 8.97, E2–E6 | Pivotal quantities, $\chi^2$ CIs, order stat CIs, shortest CI |
| HW6 | Ex 8.89, 8.90, 8.91, 8.99, 8.100 | Two-sample $t$-CIs, pooled variance, upper bounds for $\sigma$ |
| HW7 | Ex 8.49–8.67 range + Type II | Large-sample CIs, proportions, sample size, CLT |
| HW8 | Ex 8.111, 8.117 only | Hypothesis test setup, Type I/II errors, p-values, CI-test duality |

## See Also

- [[Confidence Intervals]]
- [[Hypothesis Testing]]
- [[MATH 451∕551 - Homework 5]]
- [[MATH 451∕551 - Homework 6]]
- [[MATH 451∕551 - Homework 7]]
- [[MATH 451∕551 - Homework 8]]
