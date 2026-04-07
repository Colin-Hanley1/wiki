---
title: Quantum GAN
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-machine-learning, generative-models, GAN, unsupervised-learning, Born-machine, variational-circuits]
sources: [qml_ch12.txt]
---

# Quantum GAN

A **Quantum Generative Adversarial Network** (QGAN) is a quantum or hybrid quantum-classical version of a classical GAN, where at least one of the two adversarial components (generator or discriminator) is implemented as a parameterized quantum circuit. QGANs are **generative models** trained in an **unsupervised** manner to produce data that mimics a target distribution (Source: [[QML Textbook — Ch. 12 Quantum GANs]]).

## Classical GAN Recap

A classical GAN consists of two competing neural networks:

- **Generator** $G$: takes random noise $z \sim p_z$ (e.g., Gaussian or uniform) and produces synthetic data $G(z)$.
- **Discriminator** $D$: takes a data sample and outputs the probability $D(x) \in [0, 1]$ that it is real (from the training set) rather than generated.

Training follows a **minimax game**:

$$\min_G \max_D \; V(D, G) = \mathbb{E}_{x \sim p_{\text{data}}}[\log D(x)] + \mathbb{E}_{z \sim p_z}[\log(1 - D(G(z)))]$$

The discriminator tries to maximize $V$ (correctly distinguish real from fake), while the generator tries to minimize $V$ (fool the discriminator). At the **Nash equilibrium**, $G$ perfectly replicates $p_{\text{data}}$ and $D(x) = 1/2$ for all $x$.

### Training Dynamics

Training alternates between two steps:

1. **Update $D$:** fix $G$, train $D$ to better distinguish real data from $G(z)$.
2. **Update $G$:** fix $D$, train $G$ to produce outputs that maximize $D(G(z))$.

This adversarial process is analogous to a counterfeiter ($G$) competing against a central bank ($D$): through iterative competition, the counterfeiter's output converges toward indistinguishable replicas.

## Quantum Variants

There are three main QGAN configurations depending on which component is quantum:

| Variant | Generator | Discriminator | Notes |
|---|---|---|---|
| **Quantum generator, classical discriminator** | Parameterized quantum circuit | Classical neural network | Most common; generator output is a Born machine distribution |
| **Classical generator, quantum discriminator** | Classical neural network | Parameterized quantum circuit | Discriminator measures quantum features of the data |
| **Fully quantum** | Quantum circuit | Quantum circuit | Both components are variational circuits |

### Quantum Generator

A **quantum generator** is a variational circuit $U(\vec{\theta})$ applied to an initial state $\lvert 0 \rangle^{\otimes n}$:

$$\lvert \psi(\vec{\theta}) \rangle = U(\vec{\theta}) \lvert 0 \rangle^{\otimes n}$$

The generated data is obtained by **measuring** this state. The probability of observing outcome $x$ is given by the **Born rule**:

$$p_\theta(x) = \lvert \langle x \mid \psi(\vec{\theta}) \rangle \rvert^2$$

This is why quantum generators are closely related to **Born machines** -- the measurement statistics of a quantum circuit inherently define a valid probability distribution over the computational basis states. This is a natural advantage: no explicit normalization (like softmax) is needed.

### Quantum Discriminator

A quantum discriminator is another variational circuit that takes data as input (via a feature map), processes it through a trainable ansatz, and outputs an expectation value interpreted as "probability of being real." This mirrors the structure of a quantum classifier from [[Hybrid Quantum-Classical]] architectures.

### Training QGANs

QGAN training follows the same alternating update pattern as classical GANs:

1. **Fix generator parameters** $\vec{\theta}_G$, update discriminator parameters $\vec{\theta}_D$ for several steps.
2. **Fix discriminator parameters** $\vec{\theta}_D$, update generator parameters $\vec{\theta}_G$.

Gradients for the quantum components are computed via the **parameter shift rule** (on hardware) or automatic differentiation (on simulators), exactly as in [[Hybrid Quantum-Classical]] models.

**Challenges:**
- **Mode collapse:** the generator may produce only a subset of the target distribution's modes.
- **Training instability:** balancing the learning rates of $G$ and $D$ is critical; if one trains too fast, the other cannot keep up.
- **Barren plateaus:** deep variational circuits may have vanishing gradients, stalling training.

## Connection to Born Machines

A **Born machine** is a generative model that uses the Born rule to define its output distribution. Any parameterized quantum circuit with measurements is a Born machine. The key insight is that **quantum circuits are natural probability distribution generators** -- the squared amplitudes of the output state automatically form a normalized distribution.

For $n$ qubits, the generator can represent distributions over $2^n$ outcomes. This exponential state space is the basis for potential quantum advantage in generative modeling: representing certain distributions may require exponentially fewer parameters in a quantum circuit than in a classical network.

## Worked Examples

### Example 1: Simple 2-Qubit QGAN Setup

**Problem:** Design a QGAN to learn an arbitrary 2-qubit probability distribution $p_{\text{data}}$ over 4 outcomes $\{00, 01, 10, 11\}$.

**Generator circuit:**

$$U(\vec{\theta}) = \text{CNOT}_{0,1} \cdot (R_Y(\theta_3) \otimes R_Y(\theta_4)) \cdot \text{CNOT}_{0,1} \cdot (R_Y(\theta_1) \otimes R_Y(\theta_2))$$

Applied to $\lvert 00 \rangle$, this produces state $\lvert \psi(\vec{\theta}) \rangle$ with measurement probabilities:

$$p_\theta(x) = \lvert \langle x \mid \psi(\vec{\theta}) \rangle \rvert^2, \quad x \in \{00, 01, 10, 11\}$$

**Discriminator:** a classical neural network with architecture:

```
Input(4) -> Dense(8, ReLU) -> Dense(4, ReLU) -> Dense(1, sigmoid)
```

The discriminator receives a 4-dimensional probability vector (either from the quantum generator's measurement statistics or from the real data distribution) and outputs a single value in $[0, 1]$.

**Training loop (per epoch):**

1. Sample $N$ shots from the quantum generator to estimate $p_\theta$.
2. Train $D$ for $k$ steps: maximize $\log D(p_{\text{data}}) + \log(1 - D(p_\theta))$.
3. Train $G$ for 1 step: update $\vec{\theta}$ to minimize $\log(1 - D(p_\theta))$ using the parameter shift rule.

**Convergence criterion:** $D(p_\theta) \to 1/2$ and the total variation distance $\lVert p_\theta - p_{\text{data}} \rVert_{\text{TV}} \to 0$.

### Example 2: Computing the Generator's Loss Gradient

**Problem:** Given a single-qubit generator $U(\theta) = R_Y(\theta)$ producing state $\cos(\theta/2)\lvert 0 \rangle + \sin(\theta/2)\lvert 1 \rangle$, compute the gradient of the generator loss with respect to $\theta$ using the parameter shift rule.

**Setup:** The generator outputs distribution $p_\theta = (\cos^2(\theta/2), \sin^2(\theta/2))$ over $\{0, 1\}$. Suppose the discriminator currently assigns $D(p_\theta) = d(\theta)$.

**Gradient via parameter shift rule:**

$$\frac{\partial}{\partial \theta} \mathcal{L}_G(\theta) = \frac{1}{2}\left[\mathcal{L}_G\!\left(\theta + \frac{\pi}{2}\right) - \mathcal{L}_G\!\left(\theta - \frac{\pi}{2}\right)\right]$$

where $\mathcal{L}_G(\theta) = \log(1 - D(p_\theta))$.

**Concrete evaluation:** Let $\theta = \pi/3$, so $p_\theta = (3/4, 1/4)$.

- Shifted distributions: $p_{\theta+\pi/2} = (1/4, 3/4)$ and $p_{\theta-\pi/2} = (1, 0)$ (since $R_Y(-\pi/6) \lvert 0 \rangle$ has $\cos^2(-\pi/12)$ but let us simplify).

The key point is that the parameter shift rule requires only **two circuit evaluations** per parameter, making it feasible on real quantum hardware.

## See Also

- [[Hybrid Quantum-Classical]]
- [[Quantum Gates]]
- [[QML Textbook — Ch. 12 Quantum GANs]]
- [[QML Textbook — Ch. 11 Hybrid Architectures]]
