---
title: "MATH 457∕557 - Homework 9"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, math-457, homework, markov-chains, poisson-process]
sources: [HW9_MATH457_557_Spring_2026.pdf]
---

# MATH 457∕557 - Homework 9

**Course:** MATH 457∕557 — Applied Stochastic Processes, University of Alabama, Spring 2026

## Summary

This homework continues the study of the Poisson process, covering merging, thinning, and exponential races — the main tools for building complex models from simple Poisson components.

## Key Topics

- **Merging independent Poisson processes:** If $N_1(t)$ with rate $\lambda_1$ and $N_2(t)$ with rate $\lambda_2$ are independent Poisson processes, then $N_1(t) + N_2(t)$ is a Poisson process with rate $\lambda_1 + \lambda_2$. Generalizes to any finite number of independent processes.
- **Thinning (decomposition):** Each event in a Poisson process of rate $\lambda$ is independently classified as type 1 with probability $p$ or type 2 with probability $1-p$. The resulting type-1 and type-2 processes are independent Poisson processes with rates $\lambda p$ and $\lambda(1-p)$.
- **Exponential races — minimum of independent exponentials:** If $X_1 \sim \text{Exp}(\lambda_1)$ and $X_2 \sim \text{Exp}(\lambda_2)$ are independent, then

$$
\min(X_1, X_2) \sim \text{Exp}(\lambda_1 + \lambda_2)
$$

and the winner probability is

$$
P(X_i \text{ wins}) = \frac{\lambda_i}{\sum_j \lambda_j}
$$

Generalizes to $n$ independent exponentials: $\min(X_1, \ldots, X_n) \sim \text{Exp}(\lambda_1 + \cdots + \lambda_n)$.
- **Hardware store server problem (Exercise 2.9):** A queueing-type problem where customers arrive as a Poisson process and service times are exponential. Analyzing waiting times and server utilization. Involves binomial coefficients such as $\binom{12}{8}$.
- **U-turn police car problem:** A pursuit/detection problem modeled with Poisson arrivals and exponential times. Computing the probability of detection or escape using exponential race techniques.
- **Conditional expectations in Poisson setting:** Computing expected values conditioned on events defined in terms of the Poisson process, using properties of exponential distributions and independent increments.

## Key Takeaways

1. Merging and thinning are inverse operations that allow decomposition and recombination of Poisson processes — essential for modeling complex arrival patterns.
2. The exponential race ($\min$ of independent exponentials) is the key technique for continuous-time competing risks and is used throughout queueing theory and reliability.
3. The probability that one exponential beats another depends only on the ratio of rates — a clean and powerful result.
4. These tools (merging, thinning, exponential races) form the building blocks for continuous-time Markov chains, which generalize discrete-time chains to continuous time.

## See Also

- [[math-457-557-homework-8|MATH 457∕557 - Homework 8]]
- [[Poisson Process]]
- [[Markov Chains]]
