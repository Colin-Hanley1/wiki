---
title: QML Exam Study Guide
type: analysis
created: 2026-04-09
updated: 2026-04-09
tags: [quantum-computing, quantum-machine-learning, study-guide, exam]
sources: [QuantumMLTextbook.pdf]
---

# QML Exam Study Guide

Broad-strokes review of the QML textbook (Combarro & Gonzalez-Castillo, Packt 2023). Covers Chapters 1--12.

---

## Part I: Quantum Computing Foundations (Ch. 1--2)

### Qubits

- A qubit is a unit vector in $\mathbb{C}^2$:

$$|\psi\rangle = a|0\rangle + b|1\rangle, \quad |a|^2 + |b|^2 = 1$$

- Measurement collapses: outcome 0 with probability $|a|^2$, outcome 1 with probability $|b|^2$.
- Dirac notation: kets $|v\rangle$ (column vectors), bras $\langle v|$ (conjugate-transpose), inner product $\langle u \mid v \rangle$.
- $n$ qubits live in $\mathbb{C}^{2^n}$ --- exponential state space is the source of quantum computational power.

### Quantum Gates

- **Unitary matrices**: $U^\dagger U = I$. Preserves normalization, guarantees reversibility.
- Key single-qubit gates:
  - **X** (NOT): flips $|0\rangle \leftrightarrow |1\rangle$. Pauli matrix.
  - **Z**: phase flip, $Z|1\rangle = -|1\rangle$.
  - **H** (Hadamard): $H|0\rangle = |+\rangle = \frac{1}{\sqrt{2}}(|0\rangle + |1\rangle)$. Creates superposition.
- Key multi-qubit gates:
  - **CNOT**: flips target if control is $|1\rangle$. Creates entanglement.
  - **Toffoli**: universal for classical reversible computation.
- **Universal gate set**: $\{H, T, \text{CNOT}\}$ can approximate any unitary.

### Entanglement and No-Cloning

- Entangled states (e.g., Bell states) cannot be factored as tensor products.
- **No-cloning theorem**: cannot copy an arbitrary quantum state.

### Software Frameworks (Ch. 2)

| Framework | Vendor | Paradigm | Note |
|-----------|--------|----------|------|
| **Qiskit** | IBM | Gate-based | Qubit 0 = least significant bit (reversed convention) |
| **PennyLane** | Xanadu | Gate-based | Best for QML; native PyTorch/TF integration |
| **Ocean** | D-Wave | Annealing | For QUBO/Ising problems on D-Wave hardware |

---

## Part II: Quantum Optimization (Ch. 3--7)

### QUBO and the Ising Model (Ch. 3)

- **QUBO**: minimize $\vec{x}^T Q \vec{x}$ over binary $x_j \in \{0,1\}$. NP-hard.
- **Ising model**: minimize $-\sum J_{jk} Z_j Z_k - \sum h_j Z_j$. Ground state encodes the solution.
- **Interconversion**: $z_j = 1 - 2x_j$ (Ising $\to$ QUBO), $x_j = (1 - z_j)/2$ (QUBO $\to$ Ising).
- **Penalty method**: embed constraints by adding $B \cdot [g(\vec{x})]^2$ to the objective.
- **Key insight**: the variational principle guarantees the minimum energy is achieved on a computational basis state.

### Adiabatic QC and Quantum Annealing (Ch. 4)

- **Adiabatic QC**: interpolate Hamiltonian $H(t) = A(t) H_0 + B(t) H_1$. Start in ground state of $H_0$; end in ground state of $H_1$ (the problem Hamiltonian).
- **Adiabatic theorem**: system stays in the ground state if evolution is slow enough. Required time $T \propto 1/\Delta^2$ where $\Delta$ is the minimum spectral gap.
- **AQC is universal** --- polynomially equivalent to the circuit model.
- **Quantum annealing**: practical, non-universal restriction. Final Hamiltonian restricted to Ising form. Runs are non-adiabatic (repeated sampling).
  - Initial Hamiltonian: $H_0 = -\sum X_j$, ground state $|+\rangle^{\otimes n}$.
  - Advantage over simulated annealing: quantum tunneling through barriers vs. thermal hopping over them.
- **D-Wave**: D-Wave Advantage has 5000+ qubits.

### QAOA (Ch. 5)

- **Idea**: discretize adiabatic evolution into $p$ layers. Hybrid quantum-classical.
- **Parameterized state**:

$$|\vec{\beta}, \vec{\gamma}\rangle = \prod_{k=1}^{p} e^{-i\beta_k H_M} e^{-i\gamma_k H_C} \; |+\rangle^{\otimes n}$$

- $2p$ parameters. Recovers adiabatic limit as $p \to \infty$.
- **Circuit decomposition**:
  - Mixer layer: $R_X(2\beta_k)$ on every qubit.
  - Cost layer: $R_Z$ for linear terms; CNOT--$R_Z$--CNOT gadget for $Z_j Z_k$ terms.
- **Loop**: prepare state $\to$ measure $M$ times $\to$ estimate energy $\to$ classical optimizer updates $(\vec{\beta}, \vec{\gamma})$ $\to$ repeat.
- Can handle higher-order (HOBO/PUBO) problems by generalizing the ZZ gadget.

### Grover's Algorithm and GAS (Ch. 6)

- **Problem**: find marked item among $N = 2^n$ elements.
- **Quantum oracle**: $O_f|x\rangle|y\rangle = |x\rangle|y \oplus f(x)\rangle$. Phase kickback converts to phase oracle.
- **Grover iterate**: oracle $\to$ diffusion operator (inversion about the mean).
- **Optimal iterations**: $m_{\text{opt}} = \lfloor \frac{\pi}{4}\sqrt{N/M} \rfloor$ for $M$ marked elements. **Overshooting oscillates probability back to zero.**
- **Complexity**: $O(\sqrt{N})$ queries vs. $O(N)$ classically.
- **Geometric picture**: rotation by $2\theta$ in 2D subspace, where $\sin\theta = \sqrt{M/N}$.
- **Durr-Hoyer (GAS)**: adapts Grover to find function minima. Quadratic speedup.
- **Not NISQ-friendly** --- requires fault-tolerant hardware.

### VQE (Ch. 7)

- **Goal**: find ground state energy $E_0$ of an arbitrary Hamiltonian $H$.
- **Variational principle**: $\langle \psi(\vec{\theta}) \mid H \mid \psi(\vec{\theta}) \rangle \geq E_0$.
- **Algorithm**: choose ansatz $V(\vec{\theta})$, prepare $|\psi(\vec{\theta})\rangle = V(\vec{\theta})|0\rangle$, measure to estimate energy, classically optimize $\vec{\theta}$.
- **Hamiltonian decomposition**: $H = \sum \alpha_i P_i$ where $P_i$ are Pauli tensor products.
  - Diagonal terms ($Z$): measure in computational basis.
  - Off-diagonal ($X$, $Y$): change measurement basis first ($H$ for $X$; $R_X(\pi/2)$ for $Y$).
- **Ansatz types**: hardware-efficient, chemically-inspired (UCCSD), QAOA-style.
- **Excited states**: deflation method --- add penalty $C|\psi_0\rangle\langle\psi_0|$ to push ground state energy up.
- **VQE generalizes QAOA**: QAOA is VQE with a specific ansatz and Ising Hamiltonian.
- More noise-robust than QPE (which requires deep circuits).

### Optimization Algorithms at a Glance

| Algorithm | Type | Hardware | Best For |
|-----------|------|----------|----------|
| **Quantum Annealing** | Analog | D-Wave | Large QUBO/Ising |
| **QAOA** | Variational (hybrid) | NISQ gate-based | Combinatorial optimization |
| **Grover/GAS** | Exact | Fault-tolerant | Unstructured search, optimization |
| **VQE** | Variational (hybrid) | NISQ gate-based | Ground state energy (chemistry) |

---

## Part III: Quantum Machine Learning (Ch. 8--12)

### QML Taxonomy (Ch. 8)

| Label | Data | Processing | Example |
|-------|------|------------|---------|
| **CC** | Classical | Classical | Standard ML |
| **CQ** | Classical | Quantum | QSVMs, QNNs (most near-term QML) |
| **QC** | Quantum | Classical | Quantum tomography |
| **QQ** | Quantum | Quantum | Quantum error correction |

### Classical ML Recap (Ch. 8)

- **Perceptron**: output 1 if $\sum w_i x_i + b \geq 0$. Cannot solve XOR.
- **Neural networks**: layers of neurons with activation functions (sigmoid, ReLU). Universal approximators.
- **Loss functions**: MSE, binary cross-entropy.
- **Training**: gradient descent $\theta_{k+1} = \theta_k - \tau \nabla L$, backpropagation, Adam.
- **Generalization**: train/validation/test split, overfitting.

### Data Encoding Strategies

| Method | Qubits Needed | Description |
|--------|---------------|-------------|
| **Angle encoding** | $n$ qubits for $n$ features | Each feature parametrizes a rotation gate |
| **Amplitude encoding** | $n$ qubits for $2^n$ features | Features stored in state amplitudes |
| **Basis encoding** | $n$ qubits for $n$-bit string | Binary string as computational basis state |

### Quantum SVMs (Ch. 9)

- Classical SVM: find max-margin hyperplane. Kernel trick enables nonlinear classification via feature maps.
- **Quantum kernel**: replace classical kernel with

$$K(\vec{a}, \vec{b}) = \lvert\langle\phi(\vec{a}) \mid \phi(\vec{b})\rangle\rvert^2$$

- Quantum feature map $\Phi(\vec{x})$ prepares state $|\phi(\vec{x})\rangle$ via a parametrized circuit.
- Kernel matrix $K_{ij}$ computed on quantum hardware, then fed to a classical SVM solver.
- $K_{ii} = 1$ always. $K(\vec{a}, \vec{b})$ equals probability of measuring all zeros after $\Phi^\dagger(\vec{a})\Phi(\vec{b})|0\rangle$.

### Quantum Neural Networks (Ch. 10)

- **Architecture**: data encoding $F(\vec{x})|0\rangle^n$ $\to$ trainable ansatz $V(\vec{\theta})$ $\to$ measurement.
- **Variational forms**: two-local ($n(k+1)$ parameters), tree tensor.
- **Parameter shift rule** (exact quantum gradient):

$$\frac{\partial f}{\partial \theta_i} = \frac{f(\theta_i + \pi/2) - f(\theta_i - \pi/2)}{2}$$

- Requires **two circuit evaluations per parameter** per gradient component.
- QNNs are CQ models. Not a special case of any classical model.

### QNN vs. QSVM

| | QSVM | QNN |
|--|------|-----|
| **Trainable quantum params** | None (fixed feature map) | Yes ($\vec{\theta}$) |
| **Classical optimization** | SVM solver on kernel matrix | Gradient descent on $\vec{\theta}$ |
| **Quantum role** | Kernel evaluation only | Full model (encoding + processing) |

### Hybrid Quantum-Classical Architectures (Ch. 11)

- **Motivation**: NISQ constraints (few qubits, shallow circuits). Classical layers handle dimensionality reduction; quantum layer does classification.
- **"Quantum sandwich"**: classical pre-processing $\to$ quantum layer $\to$ classical post-processing.
- **End-to-end training**: classical weights and quantum parameters optimized jointly via backpropagation.
  - Simulators: automatic differentiation.
  - Hardware: parameter shift rule.
- **Framework integration**: PennyLane + Keras (`KerasLayer`), Qiskit + PyTorch (`TorchConnector`).

### Quantum GANs (Ch. 12)

- **GAN minimax game**:

$$\min_G \max_D \; V(D,G) = \mathbb{E}_{x \sim p_{\text{data}}}[\log D(x)] + \mathbb{E}_{z \sim p_z}[\log(1 - D(G(z)))]$$

- Nash equilibrium: $G$ replicates $p_{\text{data}}$, $D$ outputs $1/2$.
- **Quantum variants**: quantum generator (most common), quantum discriminator, or fully quantum.
- **Born machine**: quantum circuit as natural probability distribution generator. Output distribution $p_\theta(x) = |\langle x \mid \psi(\theta)\rangle|^2$.
- **Challenges**: mode collapse, training instability, barren plateaus.
- First unsupervised QML model in the textbook.

### The Barren Plateaus Problem

- Gradients become **exponentially small** as qubit count grows.
- Causes: high expressibility, excessive entanglement, global cost functions.
- Mitigations: structured ansatze, layer-wise training, local cost functions.

---

## Key Themes to Remember

1. **Variational/hybrid pattern**: most NISQ algorithms (QAOA, VQE, QNNs, QGANs) follow the same loop --- prepare parameterized quantum state, measure, classically optimize parameters.
2. **QUBO/Ising equivalence**: interconvertible via $z_j = 1 - 2x_j$. Foundation for quantum annealing and QAOA.
3. **Encoding matters**: angle, amplitude, and basis encoding have different qubit costs and expressiveness.
4. **Parameter shift rule**: the universal method for computing exact gradients on quantum hardware. Two evaluations per parameter.
5. **Spectral gap**: governs adiabatic evolution time ($T \propto 1/\Delta^2$) and annealing difficulty.
6. **Grover's $\sqrt{N}$ speedup**: quadratic, not exponential. Overshooting is dangerous.
7. **NISQ vs. fault-tolerant**: variational algorithms (QAOA, VQE, QNNs) are NISQ-friendly. Grover's and Shor's need fault tolerance.
8. **Quantum kernels vs. QNNs**: QSVMs have no trainable quantum parameters (fixed feature map + classical SVM); QNNs have trainable quantum parameters.

---

## Quick-Reference Formulas

| Formula | Context |
|---------|---------|
| $\lvert\psi\rangle = a\lvert 0\rangle + b\lvert 1\rangle$, $\lvert a\rvert^2 + \lvert b\rvert^2 = 1$ | Qubit state |
| $U^\dagger U = I$ | Unitarity (quantum gates) |
| $T \propto 1/\Delta^2$ | Adiabatic theorem |
| $m_{\text{opt}} = \lfloor \frac{\pi}{4}\sqrt{N/M} \rfloor$ | Grover optimal iterations |
| $\langle\psi\lvert H\lvert\psi\rangle \geq E_0$ | Variational principle (VQE) |
| $K(\vec{a},\vec{b}) = \lvert\langle\phi(\vec{a})\mid\phi(\vec{b})\rangle\rvert^2$ | Quantum kernel |
| $\frac{\partial f}{\partial \theta_i} = \frac{f(\theta_i+\pi/2) - f(\theta_i-\pi/2)}{2}$ | Parameter shift rule |

## See Also

- [[QML Textbook — Ch. 1 Foundations of Quantum Computing]]
- [[QML Textbook — Ch. 3 QUBO Problems]]
- [[QML Textbook — Ch. 5 QAOA]]
- [[QML Textbook — Ch. 6 Grover Adaptive Search]]
- [[QML Textbook — Ch. 7 VQE]]
- [[QML Textbook — Ch. 8 What Is QML]]
- [[QML Textbook — Ch. 9 Quantum SVMs]]
- [[QML Textbook — Ch. 10 Quantum Neural Networks]]
- [[QML Textbook — Ch. 11 Hybrid Architectures]]
- [[QML Textbook — Ch. 12 Quantum GANs]]
- [[Quantum Machine Learning]]
- [[QAOA]]
- [[Grover's Algorithm]]
- [[VQE]]
- [[Quantum SVM]]
- [[Quantum Neural Network]]
- [[Quantum GAN]]
