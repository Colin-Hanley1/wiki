---
title: "QML Textbook — Ch. 11 Hybrid Architectures"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-machine-learning, hybrid-architectures, PennyLane, Qiskit, PyTorch, TensorFlow]
sources: [qml_ch11.txt, qml_ch12.txt]
---

# QML Textbook — Ch. 11 Hybrid Architectures

**Source:** Combarro, E. F. & González-Castillo, S. (2023). *A Practical Guide to Quantum Machine Learning and Quantum Optimization.* Ch. 11: "The Best of Both Worlds: Hybrid Architectures."

## Overview

Chapter 11 introduces [[Hybrid Quantum-Classical]] neural networks — models that combine classical neural network layers with quantum neural network layers and train them as a single unit. The chapter covers the motivation behind hybrid architectures (NISQ-era hardware limitations, dimensionality reduction needs), their construction, and hands-on implementations in both PennyLane (with TensorFlow/Keras) and Qiskit (with PyTorch).

## Key Topics

### 11.1 — The What and Why of Hybrid Architectures

- A **hybrid QNN** is a classical neural network where one or more layers are replaced by quantum layers. The quantum layer accepts outputs from the preceding classical layer and feeds its outputs to the next layer.
- The entire network is trained end-to-end: both classical weights and quantum variational parameters are optimized jointly.
- **Primary motivation:** current quantum hardware is limited in qubit count and circuit depth. Classical layers handle dimensionality reduction (e.g., mapping 30 features down to 4), while the quantum layer performs classification or feature extraction.
- **Caution:** quantum layers are not a drop-in replacement for classical layers. Designers must be intentional about the role the quantum layer plays and ensure compatibility (e.g., using sigmoid activation before a feature map that expects inputs in $[0, 1]$).

### 11.2 — Hybrid Architectures in PennyLane

- PennyLane integrates quantum circuits into TensorFlow/Keras via `qml.qnn.KerasLayer`, which wraps a quantum node as a standard Keras layer.
- **Binary classification example:** classical dense layers reduce input dimension, followed by a quantum layer (ZZ feature map + two-local variational form on 4 qubits), trained with binary cross-entropy and Adam optimizer.
- **Training best practices** covered: early stopping on validation loss, hyperparameter tuning with Optuna, learning rate and batch size selection.
- **Multi-class classification** (ternary): the quantum layer returns expectation values on $k$ qubits (one per class), followed by a softmax activation. Uses the categorical cross-entropy loss:

$$H(\theta; x, y) = -\sum_{j=1}^{k} y_j \log(N_\theta(x)_j)$$

where $y$ is in one-hot form. Achieved 67% training / 60% test accuracy.

### 11.3 — Hybrid Architectures in Qiskit

- Qiskit interfaces with **PyTorch** (not TensorFlow). Substantial introduction to PyTorch: `nn.Module` subclassing, `forward` method, `DataLoader`, manual training loops with `loss.backward()` and `opt.step()`.
- The `TorchConnector` from `qiskit_machine_learning` wraps a Qiskit `TwoLayerQNN` as a PyTorch module, analogous to `KerasLayer` in PennyLane.
- **Binary classification with Qiskit:** 2-qubit QNN with ZZ feature map and two-local form, classical layers before and after, sigmoid activation on the output. Achieved 92% training / 74% test accuracy (with some overfitting).
- **Torch Runtime:** enables training QNNs on IBM quantum hardware via Qiskit Runtime, executing the full training loop as a single queued job.

## Key Findings

- Hybrid QNNs can match or exceed standalone QNNs by leveraging classical layers for dimensionality reduction and quantum layers for classification.
- Overfitting is a recurring challenge with small training datasets; more data and regularization are recommended.
- The parameter shift rule enables gradient computation on real quantum hardware; automatic differentiation works on simulators.

## Relevance

This chapter bridges [[Quantum Gates]] and classical deep learning, providing the practical toolkit for building NISQ-era quantum ML models. The hybrid approach is the standard paradigm for near-term quantum advantage experiments.

## See Also

- [[Hybrid Quantum-Classical]]
- [[Quantum Gates]]
- [[QML Textbook — Ch. 1 Foundations of Quantum Computing]]
- [[QML Textbook — Ch. 12 Quantum GANs]]
