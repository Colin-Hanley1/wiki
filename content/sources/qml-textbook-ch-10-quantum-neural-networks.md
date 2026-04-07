---
title: "QML Textbook — Ch. 10 Quantum Neural Networks"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, machine-learning, qml, neural-networks, textbook]
sources: [qml_ch10]
---

## Bibliographic Info

- **Text**: *A Practical Guide to Quantum Machine Learning and Quantum Optimization* (Packt)
- **Chapter**: 10 — Quantum Neural Networks
- **Topics**: Variational circuits as QNNs, variational forms, parameter shift rule, QNN training

## Summary

Chapter 10 introduces quantum neural networks (QNNs) as the quantum analogue of classical neural networks. It shows how the three stages of a classical neural network --- data preparation, data processing, data output --- map onto a quantum circuit composed of a feature map, a trainable variational form (ansatz), and a measurement. The chapter covers several concrete variational forms (two-local, tree tensor) and discusses gradient computation via the parameter shift rule.

## Key Concepts

### From Classical NNs to QNNs

A classical neural network has three stages: (1) data preparation, (2) data processing through parameterized layers, (3) output. A QNN mirrors this:

1. **Data preparation**: encode classical input $\vec{x}$ into a quantum state via a feature map $F(\vec{x})$ (same maps used in QSVMs --- angle encoding, amplitude encoding, etc.).
2. **Data processing**: apply a variational form $V(\vec{\theta})$ --- a parameterized circuit whose parameters $\vec{\theta}$ are optimized during training.
3. **Data output**: measure the final state. For binary classification, a natural choice is the expectation value of a single qubit.

Schematically: $\lvert 0\rangle^{\otimes n} \xrightarrow{F(\vec{x})} \lvert\psi_{\text{enc}}\rangle \xrightarrow{V(\vec{\theta})} \lvert\psi_{\text{out}}\rangle \to \text{measurement}$.

### Variational Forms (Ansatze)

- **Feature maps** and **variational forms** are both variational circuits; the distinction is purpose: feature maps encode data, variational forms are trainable.
- **Layered structure**: a variational form with $k$ layers uses independent parameter vectors $\vec{\theta}_1, \dots, \vec{\theta}_k$, with entangling unitaries $U_{\text{ent}}^t$ between layers.

#### Two-Local Variational Form

On $n$ qubits with $k$ repetitions, uses $n \times (k+1)$ parameters. Each layer applies $R_Y(\theta_{rj})$ on every qubit $j$, followed by a cascade of CNOT gates for entanglement. Note: $k$ repetitions yield $k+1$ layers.

#### Tree Tensor Variational Form

Operates on $n = 2^k$ qubits with $k+1$ layers. Each successive layer has half the parameters of the previous, creating a tree-like structure with CNOT gates pairing qubits at increasing distances.

### Training QNNs

- QNNs are trained via classical optimization of the loss function, just like classical NNs.
- Gradients can be computed on a quantum computer using the **parameter shift rule**: for a gate parametrized by $\theta_i$,

$$
\frac{\partial}{\partial \theta_i} f(\vec{\theta}) = \frac{f(\theta_i + \pi/2) - f(\theta_i - \pi/2)}{2}
$$

  This requires two circuit evaluations per parameter per gradient component.

### Practical Considerations

- QNNs are CQ models: classical data in, classical output, quantum processing in the middle.
- Unlike QSVMs, QNNs are not a "particular case" of any classical model --- they are purely quantum, inspired by classical NNs.
- Implementation demonstrated in both PennyLane and Qiskit.

## Relevance

QNNs, together with [[Quantum SVM]]s, form the two pillars of near-term QML. The variational form / ansatz concept also connects back to VQE (Ch. 7) and forward to hybrid architectures (Ch. 11) and quantum GANs (Ch. 12).

## See Also

- [[Quantum Neural Network]]
- [[Quantum Machine Learning]]
- [[QML Textbook — Ch. 8 What Is QML]]
- [[QML Textbook — Ch. 9 Quantum SVMs]]
