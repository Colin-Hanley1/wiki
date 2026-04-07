---
title: "QML Textbook — Ch. 12 Quantum GANs"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-machine-learning, quantum-GAN, generative-models, unsupervised-learning, PennyLane, Qiskit]
sources: [qml_ch12.txt]
---

# QML Textbook — Ch. 12 Quantum GANs

**Source:** Combarro, E. F. & González-Castillo, S. (2023). *A Practical Guide to Quantum Machine Learning and Quantum Optimization.* Ch. 12: "Quantum Generative Adversarial Networks."

## Overview

Chapter 12 introduces [[Quantum GAN]]s (QGANs), the quantum counterpart of classical Generative Adversarial Networks. This is the textbook's entry into **unsupervised learning** within the QML setting. QGANs are generative models trained to produce data distributions that mimic a training dataset, without requiring labeled data.

## Key Topics

### 12.1 — GANs and Their Quantum Counterparts

- **Counterfeiting analogy:** the generator is a counterfeiter producing fake money; the discriminator is the central bank detecting fakes. Through iterative competition, the generator's output converges toward the real distribution.
- **Classical GAN structure:** a generator $G$ takes random noise $z$ and produces fake data $G(z)$; a discriminator $D$ outputs the probability that its input is real. Training follows the **minimax game:**

$$\min_G \max_D \; V(D, G) = \mathbb{E}_{x \sim p_{\text{data}}}[\log D(x)] + \mathbb{E}_{z \sim p_z}[\log(1 - D(G(z)))]$$

- At the **Nash equilibrium**, $G$ perfectly replicates $p_{\text{data}}$ and $D$ outputs $1/2$ for all inputs.
- **Types of QGANs:** the quantum component can appear in the generator, the discriminator, or both. When a parameterized quantum circuit serves as the generator, the output distribution is sometimes called a **Born machine** (since measurement probabilities follow the Born rule).

### 12.2 — Quantum GANs in PennyLane

- Implementations use PennyLane with TensorFlow interface, building on the [[Hybrid Quantum-Classical]] patterns from Chapter 11.
- The **quantum generator** is a variational circuit whose measurement distribution serves as the generated data.
- The **discriminator** can be either a classical neural network or a second quantum circuit.
- Training alternates between updating the discriminator (to better distinguish real from generated) and updating the generator (to better fool the discriminator).

### 12.3 — Quantum GANs in Qiskit

- Qiskit implementation uses PyTorch, leveraging the `TorchConnector` and training infrastructure from Chapter 11.

## Key Findings

- QGANs represent the first unsupervised QML model in the textbook, broadening the scope beyond classification and regression.
- The adversarial training dynamic introduces unique challenges: mode collapse, training instability, and the need to balance generator/discriminator learning rates.
- Quantum generators have a natural connection to Born machines — the measurement statistics of a quantum circuit inherently define a probability distribution.

## Relevance

QGANs connect quantum computing to the broader generative AI landscape. The Born machine perspective is especially interesting because quantum circuits naturally produce probability distributions, potentially offering an advantage for sampling tasks that are classically hard.

## See Also

- [[Quantum GAN]]
- [[Hybrid Quantum-Classical]]
- [[QML Textbook — Ch. 11 Hybrid Architectures]]
- [[Quantum Gates]]
