---
title: "QUBO"
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [optimization, quantum-computing, combinatorial-optimization, ising-model]
sources: [qml_ch3, qml_ch4]
---

## Definition

**Quadratic Unconstrained Binary Optimization (QUBO)** is a class of combinatorial optimization problems of the form:

$$
\text{Minimize } q(x_0, x_1, \dots, x_m) \quad \text{subject to } x_j \in \{0, 1\}, \; j = 0, \dots, m
$$

where $q$ is a quadratic polynomial in the binary variables $x_j$. In matrix notation, this is often written as:

$$
\text{Minimize } \vec{x}^T Q \vec{x}
$$

where $Q$ is an upper-triangular (or symmetric) matrix encoding both linear and quadratic coefficients. Diagonal entries $Q_{jj}$ capture linear terms (since $x_j^2 = x_j$ for binary variables), and off-diagonal entries $Q_{jk}$ capture interaction terms.

QUBO problems are $NP$-hard and serve as the standard input format for quantum annealers such as those built by D-Wave. Many important combinatorial problems---Max-Cut, Subset Sum, Knapsack, graph coloring, binary linear programming---can be reduced to QUBO (Source: [[QML Textbook — Ch. 3 QUBO Problems]]).

## Equivalence with the Ising Model

The Ising model and QUBO are interconvertible. The Ising model uses spin variables $z_j \in \{-1, +1\}$ and minimizes an energy function:

$$
E(z_0, \dots, z_m) = -\sum_{j,k} J_{jk} z_j z_k - \sum_j h_j z_j
$$

### Ising to QUBO

Substitute $z_j = 1 - 2x_j$ (so $x_j = 0 \Leftrightarrow z_j = 1$ and $x_j = 1 \Leftrightarrow z_j = -1$). This transforms the energy into a quadratic polynomial in the binary variables $x_j$.

### QUBO to Ising

Substitute $x_j = (1 - z_j) / 2$. Two adjustments are needed:

1. Replace $z_j^2$ with $1$ (since $z_j \in \{-1, +1\}$ implies $z_j^2 = 1$).
2. Drop constant terms (they do not affect which assignment is optimal, but must be added back to recover the original objective value).

## Quantum Formulation

In the quantum setting, spin variables become Pauli $Z$ operators. The Ising Hamiltonian:

$$
H = -\sum_{(j,k) \in E} J_{jk} Z_j Z_k - \sum_j h_j Z_j
$$

is a Hermitian matrix whose ground state (minimum-eigenvalue eigenvector) encodes the optimal solution. The **variational principle** guarantees that the minimum of $\langle \psi \mid H \mid \psi \rangle$ over all quantum states is achieved on a computational basis state, which directly corresponds to a variable assignment (Source: [[QML Textbook — Ch. 3 QUBO Problems]]).

## Formulating Max-Cut as QUBO

Given a graph $G = (V, E)$, the Max-Cut problem partitions vertices into two sets to maximize the number of edges between them. In Ising form:

$$
\text{Minimize } \sum_{(j,k) \in E} z_j z_k \quad \text{subject to } z_j \in \{-1, +1\}
$$

Applying $z_j = 1 - 2x_j$:

$$
z_j z_k = (1 - 2x_j)(1 - 2x_k) = 1 - 2x_j - 2x_k + 4x_j x_k
$$

So the QUBO objective (dropping the constant $\lvert E \rvert$) is:

$$
\text{Minimize } \sum_{(j,k) \in E} (4 x_j x_k - 2x_j - 2x_k)
$$

## Penalty Method for Constraints

Since QUBO is *unconstrained*, constraints must be absorbed into the objective via penalty terms. Given an equality constraint $g(\vec{x}) = 0$:

$$
q_{\text{penalized}}(\vec{x}) = f(\vec{x}) + B \cdot [g(\vec{x})]^2
$$

where $B$ is a penalty coefficient chosen large enough that violating the constraint always costs more than any feasible objective value. For inequality constraints $g(\vec{x}) \leq c$, first introduce binary slack variables to convert to equality, then apply the penalty method (Source: [[QML Textbook — Ch. 3 QUBO Problems]]).

## Worked Examples

### Example 1: Converting a Max-Cut Instance to QUBO

**Problem**: Find the maximum cut of a triangle graph with vertices $\{0, 1, 2\}$ and edges $E = \{(0,1), (1,2), (0,2)\}$.

**Step 1 --- Ising formulation**:

$$
\text{Minimize } z_0 z_1 + z_1 z_2 + z_0 z_2, \quad z_j \in \{-1, +1\}
$$

**Step 2 --- Substitute** $z_j = 1 - 2x_j$:

For each edge term:

$$
z_j z_k = (1 - 2x_j)(1 - 2x_k) = 1 - 2x_j - 2x_k + 4x_j x_k
$$

Summing over all three edges:

$$
3 - 2(2x_0 + 2x_1 + 2x_2) + 4(x_0 x_1 + x_1 x_2 + x_0 x_2)
$$

$$
= 3 - 4x_0 - 4x_1 - 4x_2 + 4x_0 x_1 + 4x_1 x_2 + 4x_0 x_2
$$

**Step 3 --- Drop the constant** (does not affect optimization):

$$
\text{Minimize } -4x_0 - 4x_1 - 4x_2 + 4x_0 x_1 + 4x_1 x_2 + 4x_0 x_2
$$

**Step 4 --- Verify**: Try $x_0 = 1, x_1 = 0, x_2 = 0$ (vertex 0 in one set, vertices 1 and 2 in the other): objective $= -4 + 0 + 0 + 0 + 0 + 0 = -4$. Try $x_0 = 1, x_1 = 0, x_2 = 1$: objective $= -4 - 4 + 0 + 0 + 4 + 0 = -4$. Both cut 2 edges. The minimum is $-4$ (with constant $3$ restored, Ising value is $-1$, meaning 2 edges cut out of 3).

### Example 2: Subset Sum as QUBO

**Problem**: Given $S = \{1, 4, -2\}$ and target $T = 2$, is there a subset summing to $T$?

**Step 1 --- Define cost function**: Let $x_j \in \{0, 1\}$ indicate whether element $j$ is selected.

$$
c(x_0, x_1, x_2) = (1 \cdot x_0 + 4 \cdot x_1 + (-2) \cdot x_2 - 2)^2
$$

$$
= (x_0 + 4x_1 - 2x_2 - 2)^2
$$

**Step 2 --- Expand**:

$$
= x_0^2 + 16x_1^2 + 4x_2^2 + 4 + 8x_0 x_1 - 4x_0 x_2 - 4x_0 - 16x_1 x_2 - 16x_1 + 8x_2
$$

**Step 3 --- Simplify** using $x_j^2 = x_j$:

$$
= x_0 + 16x_1 + 4x_2 + 4 + 8x_0 x_1 - 4x_0 x_2 - 4x_0 - 16x_1 x_2 - 16x_1 + 8x_2
$$

$$
= -3x_0 + 0 \cdot x_1 + 12x_2 + 8x_0 x_1 - 4x_0 x_2 - 16x_1 x_2 + 4
$$

**Step 4 --- Verify**: Try $x_0 = 0, x_1 = 1, x_2 = 1$: sum $= 4 + (-2) = 2 = T$. Cost $= 0$. This is the global minimum, confirming a positive answer.

## See Also

- [[Quantum Annealing]]
- [[QML Textbook — Ch. 3 QUBO Problems]]
- [[QML Textbook — Ch. 4 Adiabatic QC and Quantum Annealing]]
- [[Quantum Gates]]
