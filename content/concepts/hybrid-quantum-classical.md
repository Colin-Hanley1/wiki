---
title: Hybrid Quantum-Classical
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-machine-learning, hybrid-architectures, NISQ, PennyLane, Qiskit, variational-circuits]
sources: [qml_ch11.txt, qml_ch12.txt]
---

# Hybrid Quantum-Classical

A **hybrid quantum-classical** model combines classical neural network layers with quantum neural network (QNN) layers into a single, end-to-end trainable architecture. The classical and quantum parameters are optimized jointly via gradient-based methods, treating the quantum circuit as a differentiable layer (Source: [[QML Textbook — Ch. 11 Hybrid Architectures]]).

## Motivation: Why Hybrid?

Current quantum hardware operates in the **NISQ** (Noisy Intermediate-Scale Quantum) regime, imposing severe constraints:

- **Limited qubit counts** (tens to low hundreds) restrict the dimensionality of data that can be directly encoded.
- **Shallow circuit depths** are needed to avoid decoherence and accumulated gate errors.
- **No quantum error correction** means noise degrades results as circuits grow.

A purely quantum approach would require compressing high-dimensional data (e.g., 30 features) to fit the available qubits, typically via lossy dimensionality reduction (PCA). Hybrid architectures solve this by letting **classical layers handle dimensionality reduction** while the **quantum layer performs classification or feature extraction** in a low-dimensional space that fits the quantum hardware.

## Architecture Pattern

The standard pattern is a "quantum sandwich": classical pre-processing layers, a quantum layer, and optional classical post-processing layers.

```
Input (d features)
    |
[Classical Layer 1]  Dense(d -> 8), activation = sigmoid/ELU
    |
[Classical Layer 2]  Dense(8 -> n_qubits), activation = sigmoid
    |
[  Quantum Layer  ]  Feature Map -> Variational Form -> Measurement
    |                 (e.g., ZZ map + TwoLocal on 4 qubits)
    |                 Returns k expectation values
    |
[Classical Layer 3]  Dense(k -> num_classes), activation = softmax
    |
Output (class probabilities)
```

### Components of the Quantum Layer

1. **Feature map** (data encoding): maps classical inputs into a quantum state. Common choices include angle encoding (`AngleEmbedding`) and the ZZ feature map.
2. **Variational form** (trainable ansatz): parameterized circuit with rotation gates ($R_Y$, $R_Z$) and entangling gates (CNOT, CZ). Parameters $\vec{\theta}$ are optimized during training.
3. **Measurement:** expectation values of observables (e.g., $M = \lvert 0 \rangle\langle 0 \rvert$ on selected qubits) produce classical outputs. For $k$-class problems, measure $k$ qubits.

### Design Considerations

- **Activation compatibility:** if the feature map expects inputs in $[0, 1]$, the preceding layer should use a bounded activation (sigmoid), not an unbounded one (ELU).
- **Output normalization:** for multi-class classification, apply softmax after the quantum layer to produce a valid probability distribution.
- **Depth vs. expressibility:** more repetitions (layers) in the variational form increase expressibility but risk barren plateaus and longer training times.

## Training via Backpropagation Through Quantum Layers

Hybrid models are trained as a single unit. Gradients flow through both classical and quantum layers:

1. **On simulators:** automatic differentiation (adjoint method) computes exact gradients, just as in classical backpropagation.
2. **On real hardware:** the **parameter shift rule** computes gradients by evaluating the circuit at shifted parameter values:

$$\frac{\partial}{\partial \theta} \langle O \rangle(\theta) = \frac{1}{2}\left[\langle O \rangle\!\left(\theta + \frac{\pi}{2}\right) - \langle O \rangle\!\left(\theta - \frac{\pi}{2}\right)\right]$$

3. **Numerical differentiation** is always available as a fallback.

The optimizer (typically Adam) updates both classical weights $w$ and quantum parameters $\vec{\theta}$ in each step.

## Framework Integration

### PennyLane + TensorFlow/Keras

PennyLane wraps quantum circuits as Keras layers via `qml.qnn.KerasLayer`:

```python
# Define quantum node
@qml.qnode(dev, interface="tf")
def qnn(inputs, theta):
    qml.AngleEmbedding(inputs, range(n_qubits))
    TwoLocal(n_qubits, theta, reps=2)
    return qml.expval(qml.Hermitian(M, wires=[0]))

# Wrap as Keras layer
qlayer = qml.qnn.KerasLayer(qnn, {"theta": 8}, output_dim=1)

# Build hybrid model
model = tf.keras.models.Sequential([
    tf.keras.layers.Dense(8, activation="sigmoid"),
    tf.keras.layers.Dense(4, activation="sigmoid"),
    qlayer
])
```

Training proceeds exactly like a classical Keras model: `model.compile(...)` then `model.fit(...)`.

### Qiskit + PyTorch

Qiskit uses `TorchConnector` to embed a `TwoLayerQNN` into a PyTorch `nn.Module`:

```python
class HybridQNN(nn.Module):
    def __init__(self):
        super().__init__()
        self.layer1 = nn.Linear(16, 2)
        qnn = TwoLayerQNN(2, zzfm, twolocal, input_gradients=True)
        self.qnn = TorchConnector(qnn)
        self.final_layer = nn.Linear(1, 1)

    def forward(self, x):
        x = torch.sigmoid(self.layer1(x))
        x = self.qnn(x)
        x = torch.sigmoid(self.final_layer(x))
        return x
```

PyTorch requires manual training loops (`loss.backward()`, `opt.step()`), offering more flexibility than Keras.

## Worked Examples

### Example 1: Binary Classification with a Hybrid QNN (PennyLane)

**Problem:** Classify the Breast Cancer Wisconsin dataset (569 samples, 30 features) using a hybrid QNN with 4 qubits.

**Setup:**
- Normalize data with `MaxAbsScaler`, then reduce to 4 features via PCA.
- Quantum layer: ZZ feature map + two-local variational form (1 rep, 8 parameters) on 4 qubits, measuring $\langle M \rangle$ on qubit 0.
- Wrap as `KerasLayer`, compile with Adam ($\text{lr} = 0.005$) and binary cross-entropy.

**Training:** 16 epochs with early stopping (patience = 2) on validation loss.

**Results:** Training accuracy = 71%, validation accuracy = 72%, test accuracy = 72%.

**Takeaway:** the hybrid model achieves reasonable accuracy on a real-world dataset despite using only 4 qubits. The classical PCA pre-processing allows the quantum layer to operate in a manageable-dimensional space.

### Example 2: Multi-Class Classification (Ternary, PennyLane)

**Problem:** Classify a synthetic 3-class dataset (1000 samples, 20 features).

**Setup:**
- Quantum layer on 4 qubits returns 3 expectation values (one per class).
- Targets encoded in one-hot form; softmax applied after quantum layer.
- Loss function: categorical cross-entropy:

$$H(\theta; x, y) = -\sum_{j=1}^{k} y_j \log(N_\theta(x)_j)$$

- Model architecture:

```
Input(20) -> Dense(8, ELU) -> Dense(4, sigmoid) -> QuantumLayer(3 outputs) -> Softmax
```

**Training:** 50 epochs with early stopping, Adam ($\text{lr} = 0.001$), batch size 10.

**Results:** Training accuracy = 67%, validation accuracy = 53%, test accuracy = 60%. Low validation accuracy suggests overfitting, potentially fixable with more training data.

**Takeaway:** extending hybrid QNNs to multi-class problems is straightforward -- measure $k$ qubits for $k$ classes, add softmax, and use categorical cross-entropy.

## See Also

- [[Quantum Gates]]
- [[Quantum GAN]]
- [[QML Textbook — Ch. 11 Hybrid Architectures]]
- [[QML Textbook — Ch. 1 Foundations of Quantum Computing]]
