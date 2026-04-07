---
title: "Quantum Machine Learning"
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, machine-learning, qml]
sources: [qml-textbook-ch-8-what-is-qml, qml-textbook-ch-9-quantum-svms, qml-textbook-ch-10-quantum-neural-networks]
---

Quantum Machine Learning (QML) is the study of machine learning algorithms that leverage quantum computing at some stage of their pipeline. The field sits at the intersection of quantum computing and classical ML, seeking to exploit properties like superposition, entanglement, and high-dimensional Hilbert spaces for computational or representational advantage.

## Taxonomy of QML Models

QML models can be classified along two axes: whether the **data** is classical (C) or quantum (Q), and whether the **processing** is classical or quantum. This yields four categories (Source: [[QML Textbook — Ch. 8 What Is QML]]):

| Category | Data | Processing | Description |
|----------|------|------------|-------------|
| **CC** | Classical | Classical | Standard ML (baseline) |
| **CQ** | Classical | Quantum | Classical inputs processed by quantum circuits; classical output via measurement |
| **QC** | Quantum | Classical | Quantum data analyzed by classical algorithms (e.g., quantum state tomography) |
| **QQ** | Quantum | Quantum | Quantum data processed by quantum algorithms (e.g., quantum error correction) |

Most near-term QML research focuses on **CQ models**, which accept classical data, encode it into quantum states, process it with parameterized quantum circuits, and return classical outputs via measurement. Both [[Quantum SVM]]s and [[Quantum Neural Network]]s are CQ models.

## Data Encoding Strategies

A central challenge in CQ models is **encoding classical data into quantum states**. The choice of encoding profoundly affects the expressiveness and trainability of the model (Source: [[QML Textbook — Ch. 9 Quantum SVMs]]).

### Angle Encoding

Each classical feature $x_j$ parametrizes a single-qubit rotation gate on qubit $j$:

$$
\lvert 0 \rangle^{\otimes n} \;\xrightarrow{\;R(x_1) \otimes \cdots \otimes R(x_n)\;}\; \lvert\phi(\vec{x})\rangle
$$

where $R$ can be $R_X$, $R_Y$, or $R_Z$. Encodes $n$ features using $n$ qubits. When using $R_Z$, Hadamard gates are applied first since $R_Z$ on $\lvert 0\rangle$ produces only a global phase.

### Amplitude Encoding

Encodes $2^n$ features in the amplitudes of an $n$-qubit state:

$$
\lvert\psi\rangle = \frac{1}{\sqrt{\sum_k x_k^2}} \sum_{k=0}^{2^n - 1} x_k \lvert k \rangle
$$

This is exponentially more compact than angle encoding but requires more complex state-preparation circuits.

### Basis Encoding

Encodes a binary string $x = x_1 x_2 \cdots x_n$ directly into the computational basis state $\lvert x_1 x_2 \cdots x_n \rangle$. Simple but limited to binary features.

## Quantum Feature Maps

A **quantum feature map** is a parameterized circuit $\Phi(\vec{x})$ that maps classical data $\vec{x}$ to a quantum state $\lvert\phi(\vec{x})\rangle = \Phi(\vec{x})\lvert 0 \rangle$. Feature maps are central to both QSVMs (where they define the kernel) and QNNs (where they form the encoding layer).

The choice of feature map determines which functions the quantum model can represent. A good feature map places data from different classes far apart in Hilbert space, making them easier to distinguish.

## The Barren Plateaus Problem

A major challenge in training variational quantum models is the **barren plateau** phenomenon: as the number of qubits grows, the gradient of the cost function can become exponentially small across most of parameter space. In a barren plateau, the loss landscape is essentially flat, making gradient-based optimization infeasible.

Barren plateaus can arise from:

- **Expressibility**: highly expressive random ansatze tend to produce barren plateaus.
- **Entanglement**: excessive entanglement in the circuit can wash out local gradient information.
- **Global cost functions**: cost functions that involve measurements on all qubits are more prone to barren plateaus than local ones.

Mitigation strategies include using structured ansatze, layer-wise training, local cost functions, and careful initialization.

## Relationship Between Quantum and Classical ML

QML does not replace classical ML --- it augments it. Key points of contact:

- **Kernel methods**: QSVMs use quantum circuits to compute kernel functions that would be intractable classically, then feed the kernel matrix into a classical SVM solver (Source: [[QML Textbook — Ch. 9 Quantum SVMs]]).
- **Variational optimization**: QNNs use classical optimizers (Adam, COBYLA, etc.) to update quantum circuit parameters, mirroring classical neural network training (Source: [[QML Textbook — Ch. 10 Quantum Neural Networks]]).
- **Hybrid architectures**: many practical QML systems interleave classical and quantum layers, using classical pre- and post-processing around a quantum core.
- **Expressiveness**: quantum models can represent functions in exponentially large Hilbert spaces, potentially capturing correlations that classical models cannot efficiently represent.

Whether these theoretical advantages translate into practical speedups on real-world tasks remains an active area of research.

## Worked Examples

### Example 1: Classifying the QML Taxonomy

**Problem**: A researcher builds a model that takes photographs of crystals (classical images), encodes pixel features into a quantum circuit, processes them with a parameterized ansatz, measures qubit expectation values, and outputs a crystal-type label. Which QML category does this model belong to?

**Solution**: The input data is classical (photographs converted to numerical features), and the processing uses a quantum circuit. The output is also classical (a label extracted from measurement). This is a **CQ model**. The quantum circuit handles the "inner" computation, but the overall pipeline has classical endpoints.

### Example 2: Angle Encoding a 2D Data Point

**Problem**: Encode the data point $\vec{x} = (\pi/3,\; \pi/4)$ into a 2-qubit state using angle encoding with $R_Y$ gates. Write the resulting state.

**Solution**: Starting from $\lvert 00 \rangle$, apply $R_Y(\pi/3)$ to qubit 1 and $R_Y(\pi/4)$ to qubit 2. Recall $R_Y(\theta)\lvert 0 \rangle = \cos(\theta/2)\lvert 0\rangle + \sin(\theta/2)\lvert 1\rangle$. So:

$$
R_Y(\pi/3)\lvert 0\rangle = \cos(\pi/6)\lvert 0\rangle + \sin(\pi/6)\lvert 1\rangle = \frac{\sqrt{3}}{2}\lvert 0\rangle + \frac{1}{2}\lvert 1\rangle
$$

$$
R_Y(\pi/4)\lvert 0\rangle = \cos(\pi/8)\lvert 0\rangle + \sin(\pi/8)\lvert 1\rangle
$$

The full 2-qubit state is the tensor product:

$$
\lvert\phi(\vec{x})\rangle = \left(\frac{\sqrt{3}}{2}\lvert 0\rangle + \frac{1}{2}\lvert 1\rangle\right) \otimes \left(\cos\frac{\pi}{8}\lvert 0\rangle + \sin\frac{\pi}{8}\lvert 1\rangle\right)
$$

Expanding: $\lvert\phi(\vec{x})\rangle = \frac{\sqrt{3}}{2}\cos\frac{\pi}{8}\lvert 00\rangle + \frac{\sqrt{3}}{2}\sin\frac{\pi}{8}\lvert 01\rangle + \frac{1}{2}\cos\frac{\pi}{8}\lvert 10\rangle + \frac{1}{2}\sin\frac{\pi}{8}\lvert 11\rangle$.

This state lives in a 4-dimensional Hilbert space, illustrating how angle encoding maps 2 classical features into a richer quantum representation.

## See Also

- [[Quantum SVM]]
- [[Quantum Neural Network]]
- [[Quantum Gates]]
- [[Qubit]]
- [[QML Textbook — Ch. 8 What Is QML]]
