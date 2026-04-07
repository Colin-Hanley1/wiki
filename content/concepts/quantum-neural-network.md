---
title: "Quantum Neural Network"
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, machine-learning, qml, neural-networks, variational-circuits]
sources: [qml-textbook-ch-10-quantum-neural-networks]
---

A **Quantum Neural Network** (QNN) is a variational quantum circuit designed for machine learning tasks, inspired by the structure of classical neural networks. A QNN encodes classical data into a quantum state via a feature map, processes it through a trainable parameterized circuit (the ansatz or variational form), and extracts a classical output via measurement (Source: [[QML Textbook — Ch. 10 Quantum Neural Networks]]).

## Architecture

A QNN on $n$ qubits consists of three stages:

### 1. Data Encoding (Feature Map)

A feature map $F(\vec{x})$ encodes classical input $\vec{x}$ into a quantum state:

$$
\lvert\psi_{\text{enc}}\rangle = F(\vec{x})\lvert 0\rangle^{\otimes n}
$$

Any quantum feature map can be used --- angle encoding, amplitude encoding, etc. (see [[Quantum Machine Learning]]).

### 2. Trainable Ansatz (Variational Form)

A parameterized circuit $V(\vec{\theta})$ transforms the encoded state:

$$
\lvert\psi_{\text{out}}\rangle = V(\vec{\theta})\lvert\psi_{\text{enc}}\rangle
$$

The variational form typically has a **layered structure**: $k$ layers, each consisting of parameterized single-qubit rotations $G_j(\vec{\theta}_j)$ followed by entangling gates $U_{\text{ent}}$:

$$
V(\vec{\theta}) = G_k(\vec{\theta}_k) \prod_{j=1}^{k-1} \left[U_{\text{ent}}^j \cdot G_j(\vec{\theta}_j)\right]
$$

Common variational forms include:

- **Two-local**: $R_Y(\theta_{rj})$ gates on each qubit followed by a CNOT cascade. Uses $n(k+1)$ parameters for $n$ qubits and $k$ repetitions.
- **Tree tensor**: operates on $n = 2^k$ qubits with a tree-like CNOT structure, each layer halving the parameter count.

### 3. Measurement

A measurement operator extracts a classical output. For binary classification, a common choice is the expectation value of a Pauli-$Z$ measurement on the first qubit:

$$
f(\vec{x}, \vec{\theta}) = \langle\psi_{\text{out}} \rvert Z_1 \lvert\psi_{\text{out}}\rangle
$$

This gives a value in $[-1, 1]$ that can be thresholded for classification.

## Training via the Parameter Shift Rule

QNNs are trained by minimizing a loss function $\mathcal{L}(\vec{\theta})$ using gradient descent. On a quantum computer, gradients cannot be computed by backpropagation. Instead, the **parameter shift rule** provides exact gradients using only circuit evaluations.

For a cost function $f(\vec{\theta})$ that depends on a parameter $\theta_i$ through a gate of the form $e^{-i\theta_i G/2}$ (where $G$ has eigenvalues $\pm 1$, as is the case for Pauli rotation gates):

$$
\frac{\partial}{\partial \theta_i} f(\vec{\theta}) = \frac{f(\theta_i + \pi/2) - f(\theta_i - \pi/2)}{2}
$$

This requires exactly **two circuit evaluations** per parameter per gradient component --- one with $\theta_i$ shifted by $+\pi/2$ and one by $-\pi/2$. For $p$ parameters, a full gradient requires $2p$ circuit runs.

### Gradient Descent Update

With the gradient in hand, parameters are updated classically:

$$
\vec{\theta}_{t+1} = \vec{\theta}_t - \tau \nabla_{\vec{\theta}} \mathcal{L}(\vec{\theta}_t)
$$

where $\tau$ is the learning rate. Standard classical optimizers (Adam, COBYLA, etc.) can be used.

## QNN vs. QSVM

| Aspect | QNN | QSVM |
|--------|-----|------|
| Trainable parameters | Circuit parameters $\vec{\theta}$ optimized via gradient descent | Dual variables $\alpha_j$ optimized via quadratic programming |
| Quantum role | Feature map + trainable ansatz + measurement | Feature map + kernel evaluation only |
| Classical analogue | Inspired by neural networks (not a special case) | Special case of kernel SVM |
| Gradient computation | Parameter shift rule on quantum circuit | Not needed (kernel matrix computed once) |

## Worked Examples

### Example 1: A 1-Qubit QNN Forward Pass

**Problem**: Consider a 1-qubit QNN for binary classification with angle encoding using $R_Y(x)$ and a single trainable gate $R_Y(\theta)$. The measurement is $\langle Z \rangle$. Compute the output $f(x, \theta)$ for $x = \pi/2$ and $\theta = \pi/3$.

**Solution**: The circuit acts on $\lvert 0\rangle$ as:

$$
\lvert\psi\rangle = R_Y(\theta)\, R_Y(x)\lvert 0\rangle = R_Y(\pi/3)\, R_Y(\pi/2)\lvert 0\rangle
$$

Since $R_Y(\alpha)R_Y(\beta) = R_Y(\alpha + \beta)$, we have:

$$
\lvert\psi\rangle = R_Y(5\pi/6)\lvert 0\rangle = \cos\frac{5\pi}{12}\lvert 0\rangle + \sin\frac{5\pi}{12}\lvert 1\rangle
$$

The expectation value of $Z$ is:

$$
f(x, \theta) = \langle\psi\rvert Z\lvert\psi\rangle = \cos^2\frac{5\pi}{12} - \sin^2\frac{5\pi}{12} = \cos\frac{5\pi}{6} = -\frac{\sqrt{3}}{2} \approx -0.866
$$

Since this is negative (close to $-1$), the QNN would classify this input as one class. Different values of $\theta$ shift the decision boundary.

### Example 2: Parameter Shift Rule Gradient

**Problem**: Using the same 1-qubit QNN, compute $\frac{\partial f}{\partial \theta}$ at $x = \pi/2$, $\theta = \pi/3$ using the parameter shift rule.

**Solution**: From the analysis above, $f(x, \theta) = \cos(x + \theta)$. We apply the parameter shift rule:

$$
\frac{\partial f}{\partial \theta} = \frac{f(x, \theta + \pi/2) - f(x, \theta - \pi/2)}{2}
$$

Evaluate:

$$
f(\pi/2, \pi/3 + \pi/2) = \cos(\pi/2 + 5\pi/6) = \cos(4\pi/3) = -\frac{1}{2}
$$

Wait --- let us be more careful. We have $f(x, \theta) = \cos(x + \theta)$, so:

$$
f(\pi/2,\; \pi/3 + \pi/2) = \cos\!\left(\frac{\pi}{2} + \frac{\pi}{3} + \frac{\pi}{2}\right) = \cos\frac{4\pi}{3} = -\frac{1}{2}
$$

$$
f(\pi/2,\; \pi/3 - \pi/2) = \cos\!\left(\frac{\pi}{2} + \frac{\pi}{3} - \frac{\pi}{2}\right) = \cos\frac{\pi}{3} = \frac{1}{2}
$$

Therefore:

$$
\frac{\partial f}{\partial \theta} = \frac{-1/2 - 1/2}{2} = -\frac{1}{2}
$$

We can verify: $\frac{d}{d\theta}\cos(x + \theta) = -\sin(x + \theta) = -\sin(5\pi/6) = -1/2$. The parameter shift rule gives the exact gradient.

## See Also

- [[Quantum Machine Learning]]
- [[Quantum SVM]]
- [[Quantum Gates]]
- [[QML Textbook — Ch. 10 Quantum Neural Networks]]
