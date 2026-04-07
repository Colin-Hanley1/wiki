---
title: "QML Textbook — Ch. 8 What Is QML"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, machine-learning, qml, textbook]
sources: [qml_ch8]
---

## Bibliographic Info

- **Text**: *A Practical Guide to Quantum Machine Learning and Quantum Optimization* (Packt)
- **Chapter**: 8 — What Is Quantum Machine Learning?
- **Topics**: Classical ML foundations, neural networks, gradient descent, QML taxonomy

## Summary

Chapter 8 bridges classical machine learning and quantum machine learning. It opens with a self-contained review of classical ML fundamentals --- models, loss functions, training procedures, and generalization --- then builds a simple neural network classifier using TensorFlow. The chapter closes by introducing the landscape of QML and how quantum computing can be integrated into ML workflows.

## Key Concepts

### Classical ML Foundations

- **Three ingredients of ML**: a computational model (powerful enough for the task), data (preferably lots of it), and a training procedure to optimize model parameters.
- **Perceptron**: simplest parametric classifier. Given inputs $x_1, \dots, x_N$, weights $w_i$, and bias $b$, it outputs 1 if $\sum_{i=1}^{N} w_i x_i + b \ge 0$ and 0 otherwise. Cannot implement XOR.
- **Generalization error** (true error): probability of misclassifying a random unseen input. Estimated via a held-out test set.
- **Overfitting**: model fits training data too well but fails on unseen data. Caused by too-powerful models or too-small datasets.
- **Train / validation / test split**: training set optimizes parameters, validation set selects hyperparameters, test set provides final assessment.

### Types of Machine Learning

- **Supervised learning**: labeled data; predict labels (classification) or continuous values (regression).
- **Unsupervised learning**: unlabeled data; clustering, generative models (e.g., GANs).
- **Reinforcement learning**: agent interacts with environment, maximizes rewards via a learned policy.

### Neural Networks

- A neural network arranges neurons (perceptrons) into layers. Each neuron $n$ in layer $l$ computes:

$$
a_l^n = h_l^n\!\left(b_l^n + \sum_{k=1}^{N_{l-1}} w_{kl}^n \, a_{l-1,k}\right)
$$

- **Activation functions**: step function (historical), sigmoid $S(x) = e^x/(e^x+1)$, ELU, ReLU $R(x)=\max\{0,x\}$.
- Neural networks are **universal function approximators**.

### Loss Functions and Gradient Descent

- **Mean squared error** (MSE): $L(\theta; x, y) = (M_\theta(x) - y)^2$.
- **Binary cross-entropy**: $H(\theta; x, y) = -y\log(M_\theta(x)) - (1-y)\log(1 - M_\theta(x))$.
- **Gradient descent**: iteratively update parameters via $\theta_{k+1} = \theta_k - \tau \nabla L(\theta_k)$, where $\tau$ is the learning rate.
- **Backpropagation**: enables efficient exact gradient computation in neural networks.
- **Adam** (Adaptive Moment Estimator): dynamically adjusts learning rate during optimization.

### QML Taxonomy

The chapter introduces a framework for categorizing QML models along two axes --- classical (C) vs. quantum (Q) --- for both inputs/outputs and processing:

| Category | Data | Processing | Example |
|----------|------|------------|---------|
| CC | Classical | Classical | Standard ML |
| CQ | Classical | Quantum | QSVMs, QNNs |
| QC | Quantum | Classical | Tomography-based learning |
| QQ | Quantum | Quantum | Quantum error correction |

Most practical near-term QML models are **CQ**: classical data in, classical output, with quantum processing in the middle.

## Relevance

This chapter provides the ML foundations assumed by all later QML chapters. The neural network and gradient descent material directly underpins [[Quantum Neural Network]], while the loss function discussion applies to training any variational quantum model. The QML taxonomy frames the field covered in chapters 9--12.

## See Also

- [[Quantum Machine Learning]]
- [[Quantum Neural Network]]
- [[Quantum SVM]]
- [[QML Textbook — Ch. 9 Quantum SVMs]]
- [[QML Textbook — Ch. 10 Quantum Neural Networks]]
