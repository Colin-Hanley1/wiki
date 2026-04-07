---
title: "Quantum SVM"
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, machine-learning, qml, svm, kernel-methods]
sources: [qml-textbook-ch-9-quantum-svms]
---

A **Quantum Support Vector Machine** (QSVM) is a support vector machine that uses a quantum computer to evaluate a kernel function defined over a space of quantum states. It is a CQ model: classical data goes in, a quantum circuit computes the kernel, and a classical SVM solver handles training and prediction (Source: [[QML Textbook — Ch. 9 Quantum SVMs]]).

## Classical SVM Recap

### Hyperplane Classifiers

A support vector machine classifies points $\vec{x} \in \mathbb{R}^n$ by the sign of $\vec{w} \cdot \vec{x} + b$, where the decision boundary is the hyperplane $\vec{w} \cdot \vec{x} + b = 0$. The parameters $\vec{w}$ (normal vector) and $b$ (bias) fully define the classifier.

### Margin Maximization

The **margin** is the distance between the two parallel hyperplanes $\vec{w} \cdot \vec{x} + b = \pm 1$ that bracket the decision boundary. This distance equals $2 / \lVert\vec{w}\rVert$. SVMs are trained to maximize this margin, which improves generalization.

### Hard-Margin Training

When data is linearly separable, training solves:

$$
\min_{\vec{w}, b} \; \frac{1}{2}\lVert\vec{w}\rVert^2 \quad \text{subject to} \quad y_j(\vec{w} \cdot \vec{x}_j + b) \ge 1 \;\;\forall j
$$

### Soft-Margin Training

For non-separable data, slack variables $\xi_j \ge 0$ are introduced:

$$
\min_{\vec{w}, b, \vec{\xi}} \; \frac{1}{2}\lVert\vec{w}\rVert^2 + C\sum_j \xi_j \quad \text{subject to} \quad y_j(\vec{w}\cdot\vec{x}_j + b) \ge 1 - \xi_j, \;\; \xi_j \ge 0
$$

The hyperparameter $C > 0$ controls the trade-off between margin width and tolerance of misclassification.

### Lagrangian Dual

The dual formulation introduces multipliers $\alpha_j$:

$$
\max_{\vec{\alpha}} \; \sum_j \alpha_j - \frac{1}{2}\sum_{j,k} y_j y_k \alpha_j \alpha_k (\vec{x}_j \cdot \vec{x}_k) \quad \text{s.t.} \quad 0 \le \alpha_j \le C, \;\; \sum_j \alpha_j y_j = 0
$$

The weight vector is recovered as $\vec{w} = \sum_j \alpha_j y_j \vec{x}_j$. Points with $\alpha_j \neq 0$ are called **support vectors**.

### The Kernel Trick

The dual depends on data only through inner products $\vec{x}_j \cdot \vec{x}_k$. By replacing these with a kernel function $k(\vec{x}_j, \vec{x}_k) = \varphi(\vec{x}_j) \cdot \varphi(\vec{x}_k)$, one implicitly maps data into a high-dimensional feature space without computing $\varphi$ explicitly. This enables nonlinear classification.

## Quantum Kernel Estimation

A QSVM uses a quantum feature map $\Phi(\vec{x})$ to prepare a quantum state $\lvert\phi(\vec{x})\rangle = \Phi(\vec{x})\lvert 0\rangle$. The quantum kernel is:

$$
K(\vec{a}, \vec{b}) = \lvert\langle\phi(\vec{a}) \mid \phi(\vec{b})\rangle\rvert^2 = \lvert\langle 0 \rvert \Phi^\dagger(\vec{a})\,\Phi(\vec{b}) \lvert 0\rangle\rvert^2
$$

This equals the probability of measuring all zeros after applying $\Phi^\dagger(\vec{a})\Phi(\vec{b})$ to $\lvert 0\rangle$. Since $\Phi$ is unitary, $\Phi^\dagger$ is obtained by reversing the gate order and inverting each gate.

### Building the Kernel Matrix

For a training set of $m$ points, the kernel matrix $K \in \mathbb{R}^{m \times m}$ has entries:

$$
K_{ij} = \lvert\langle\phi(\vec{x}_i) \mid \phi(\vec{x}_j)\rangle\rvert^2
$$

This matrix is computed on the quantum computer (one circuit evaluation per pair), then fed into a classical SVM solver. Note $K_{ii} = 1$ for all $i$ (a state has unit overlap with itself).

### Properties

- **Symmetry**: $K(\vec{a}, \vec{b}) = K(\vec{b}, \vec{a})$ because $\lvert\langle\phi(\vec{a})\mid\phi(\vec{b})\rangle\rvert^2 = \lvert\langle\phi(\vec{b})\mid\phi(\vec{a})\rangle\rvert^2$.
- **Positive semi-definiteness**: guaranteed by construction, satisfying Mercer's conditions.

## Worked Examples

### Example 1: Computing a Quantum Kernel Entry

**Problem**: Consider a 1-qubit angle-encoding feature map using $R_Y$: $\Phi(x) = R_Y(x)$. Compute the quantum kernel $K(0, \pi/2)$.

**Solution**: The feature map produces:

$$
\lvert\phi(0)\rangle = R_Y(0)\lvert 0\rangle = \lvert 0\rangle
$$

$$
\lvert\phi(\pi/2)\rangle = R_Y(\pi/2)\lvert 0\rangle = \cos(\pi/4)\lvert 0\rangle + \sin(\pi/4)\lvert 1\rangle = \frac{1}{\sqrt{2}}(\lvert 0\rangle + \lvert 1\rangle)
$$

The overlap is:

$$
\langle\phi(0) \mid \phi(\pi/2)\rangle = \langle 0 \rvert \frac{1}{\sqrt{2}}(\lvert 0\rangle + \lvert 1\rangle) = \frac{1}{\sqrt{2}}
$$

Therefore:

$$
K(0, \pi/2) = \left\lvert\frac{1}{\sqrt{2}}\right\rvert^2 = \frac{1}{2}
$$

**Interpretation**: The two data points $x=0$ and $x=\pi/2$ have kernel value $1/2$, indicating moderate similarity in the quantum feature space. A value of 1 would mean identical encoding; 0 would mean orthogonal states.

### Example 2: Kernel Matrix for Three Points

**Problem**: Using the same 1-qubit $R_Y$ feature map, compute the $3 \times 3$ kernel matrix for the dataset $\{0, \pi/3, \pi\}$.

**Solution**: We need $\lvert\langle\phi(x_i)\mid\phi(x_j)\rangle\rvert^2$ for each pair. With $R_Y$ angle encoding:

$$
\langle\phi(a)\mid\phi(b)\rangle = \cos\frac{a}{2}\cos\frac{b}{2} + \sin\frac{a}{2}\sin\frac{b}{2} = \cos\frac{a-b}{2}
$$

So $K(a, b) = \cos^2\!\left(\frac{a-b}{2}\right)$.

Computing each entry:

- $K(0, 0) = \cos^2(0) = 1$
- $K(0, \pi/3) = \cos^2(\pi/6) = 3/4$
- $K(0, \pi) = \cos^2(\pi/2) = 0$
- $K(\pi/3, \pi/3) = 1$
- $K(\pi/3, \pi) = \cos^2(\pi/3) = 1/4$
- $K(\pi, \pi) = 1$

$$
K = \begin{pmatrix} 1 & 3/4 & 0 \\ 3/4 & 1 & 1/4 \\ 0 & 1/4 & 1 \end{pmatrix}
$$

Note that $K(0, \pi) = 0$, meaning $x=0$ and $x=\pi$ map to orthogonal quantum states ($\lvert 0\rangle$ and $\lvert 1\rangle$), making them maximally distinguishable. This kernel matrix would be passed to a classical SVM solver.

## See Also

- [[Quantum Machine Learning]]
- [[Quantum Neural Network]]
- [[Quantum Gates]]
- [[QML Textbook — Ch. 9 Quantum SVMs]]
