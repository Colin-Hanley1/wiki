---
title: "QML Textbook — Ch. 9 Quantum SVMs"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, machine-learning, qml, svm, textbook]
sources: [qml_ch9]
---

## Bibliographic Info

- **Text**: *A Practical Guide to Quantum Machine Learning and Quantum Optimization* (Packt)
- **Chapter**: 9 — Quantum Support Vector Machines
- **Topics**: Classical SVMs, kernel trick, quantum feature maps, quantum kernel estimation

## Summary

Chapter 9 develops support vector machines from first principles and then shows how quantum computing can enhance them through quantum kernel estimation. The classical treatment covers hyperplane classifiers, hard- and soft-margin training, the Lagrangian dual formulation, and the kernel trick. The quantum section introduces quantum feature maps (angle encoding, amplitude encoding) and the quantum kernel function $k(\vec{a}, \vec{b}) = \lvert\langle\phi(\vec{a})\mid\phi(\vec{b})\rangle\rvert^2$.

## Key Concepts

### Classical SVMs

- An SVM classifies points $\vec{x} \in \mathbb{R}^n$ by the sign of $\vec{w} \cdot \vec{x} + b$, where the hyperplane $\vec{w} \cdot \vec{x} + b = 0$ separates two classes.
- **Hard-margin training**: find $\vec{w}, b$ that minimize $\frac{1}{2}\lVert\vec{w}\rVert^2$ subject to $y_j(\vec{w} \cdot \vec{x}_j + b) \ge 1$. Requires linearly separable data.
- **Soft-margin training**: introduces slack variables $\xi_j \ge 0$ and a penalty $C > 0$:

$$
\min \frac{1}{2}\lVert\vec{w}\rVert^2 + C\sum_j \xi_j \quad \text{s.t.} \quad y_j(\vec{w}\cdot\vec{x}_j + b) \ge 1 - \xi_j
$$

- **Lagrangian dual**: the equivalent formulation in terms of $\alpha_j$:

$$
\max \sum_j \alpha_j - \frac{1}{2}\sum_{j,k} y_j y_k \alpha_j \alpha_k (\vec{x}_j \cdot \vec{x}_k) \quad \text{s.t.} \quad 0 \le \alpha_j \le C, \;\sum_j \alpha_j y_j = 0
$$

- **Support vectors**: training points with $\alpha_j \neq 0$; they alone determine $\vec{w} = \sum_j \alpha_j y_j \vec{x}_j$.
- **Hinge loss**: $L(\vec{w}, b; \vec{x}, y) = \max\{0, 1 - y(\vec{w}\cdot\vec{x}+b)\}$.

### The Kernel Trick

- Map data via a feature map $\varphi: \mathbb{R}^n \to \mathbb{R}^N$ to a higher-dimensional space where it becomes linearly separable.
- A **kernel function** $k(\vec{x}, \vec{y}) = \varphi(\vec{x}) \cdot \varphi(\vec{y})$ computes the inner product in feature space without explicitly constructing $\varphi(\vec{x})$.
- In the dual formulation, replace every $\vec{x}_j \cdot \vec{x}_k$ with $k(\vec{x}_j, \vec{x}_k)$.

### Quantum Support Vector Machines

- A QSVM is a kernel-based SVM whose feature space is a space of quantum states.
- **Quantum feature map**: a parametrized circuit $\Phi(\vec{x})$ that prepares $\lvert\phi(\vec{x})\rangle = \Phi(\vec{x})\lvert 0 \rangle$.
- **Quantum kernel function**:

$$
k(\vec{a}, \vec{b}) = \lvert\langle\phi(\vec{a})\mid\phi(\vec{b})\rangle\rvert^2 = \lvert\langle 0 \rvert \Phi^\dagger(\vec{a})\Phi(\vec{b})\lvert 0\rangle\rvert^2
$$

  This equals the probability of measuring all zeros after applying $\Phi^\dagger(\vec{a})\Phi(\vec{b})$ to $\lvert 0 \rangle$.

### Quantum Feature Maps

- **Angle encoding**: each input $x_j$ parametrizes a rotation gate ($R_X$, $R_Y$, or $R_Z$) on qubit $j$. Encodes $n$ features on $n$ qubits.
- **Amplitude encoding**: encodes $2^n$ features in the amplitudes of an $n$-qubit state. Given input $x_0, \dots, x_{2^n - 1}$, prepares $\lvert\psi\rangle = \frac{1}{\sqrt{\sum_k x_k^2}} \sum_k x_k \lvert k \rangle$.

## Relevance

QSVMs are a canonical CQ model and one of the two major families of near-term QML algorithms (the other being [[Quantum Neural Network]]). The kernel-trick framework also illuminates connections between classical and quantum feature spaces.

## See Also

- [[Quantum SVM]]
- [[Quantum Machine Learning]]
- [[QML Textbook — Ch. 8 What Is QML]]
- [[QML Textbook — Ch. 10 Quantum Neural Networks]]
