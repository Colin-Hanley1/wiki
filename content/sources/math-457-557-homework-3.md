---
title: "MATH 457∕557 - Homework 3"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, math-457, homework, markov-chains]
sources: [HW3_MATH457_557_Spring_2026.pdf]
---

# MATH 457∕557 - Homework 3

**Course:** MATH 457∕557 — Applied Stochastic Processes, University of Alabama, Spring 2026

## Summary

This homework addresses the structural theory of Markov chains: communication classes, recurrence versus transience, and hitting/return times. These concepts determine the long-run qualitative behavior of a chain.

## Key Topics

- **Communication and class structure:** Two states communicate ($x \leftrightarrow y$) if each is reachable from the other, i.e., $p^{(n)}(x,y) > 0$ and $p^{(m)}(y,x) > 0$ for some $n, m \ge 1$. Communication is an equivalence relation, partitioning the state space into classes.
- **Recurrence vs transience:** A state is recurrent if $\rho_{xx} = 1$ (the chain returns to it with probability 1), transient if $\rho_{xx} < 1$ (there is positive probability of never returning). Recurrence and transience are class properties.
- **Hitting times $T_y$ and return times:** The hitting time $T_y$ is the first time the chain visits state $y$. The return time is $T_x$ starting from $x$. These are fundamental random variables for chain analysis.
- **Irreducibility:** A chain is irreducible if all states communicate — there is a single communicating class. Irreducibility simplifies analysis because recurrence/transience applies uniformly.
- **Decomposition into irreducible closed sets:** Every finite chain decomposes as

$$
S = T \cup C_1 \cup C_2 \cup \cdots
$$

where $T$ is the set of transient states and $C_1, C_2, \ldots$ are irreducible closed (recurrent) sets.
- **Chain on nonnegative integers:** A chain that moves from $x$ to $x+1$ with probability $p$ and to $0$ with probability $q = 1-p$. Computing the expected return time via first-step analysis:

$$
E_0[T_0] = \frac{1}{1-p}
$$

- **Gambler's ruin with $N = \infty$:** The classic ruin problem on $\{0, 1, 2, \ldots\}$ without an upper barrier. Determining ruin probability and expected duration.

## Key Takeaways

1. Communication classes are the fundamental structural unit of a Markov chain.
2. Recurrence guarantees the chain revisits every state in its class infinitely often; transience means eventual permanent departure.
3. First-step analysis (conditioning on the first transition) is the main technique for computing hitting times and return times.
4. On infinite state spaces, chains can be transient even when irreducible — a phenomenon absent in finite irreducible chains.

## See Also

- [[math-457-557-homework-2|MATH 457∕557 - Homework 2]]
- [[math-457-557-homework-4|MATH 457∕557 - Homework 4]]
- [[Markov Chains]]
- [[Recurrence and Transience]]
