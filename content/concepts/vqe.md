---
title: "VQE"
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, optimization, variational, vqe, quantum-chemistry]
sources: [qml-textbook-ch-7-vqe]
---

# VQE

The **Variational Quantum Eigensolver** (VQE) is a hybrid quantum-classical algorithm for finding the ground state energy of a Hamiltonian. Introduced by Peruzzo et al. (2014), it generalizes [[QAOA]] to arbitrary (non-diagonal) Hamiltonians and is especially important for quantum chemistry applications, where Hamiltonians describe molecular electronic structure.

## The Variational Principle

For any Hamiltonian $H$ with ground state energy $E_0$ (its smallest eigenvalue), the **variational principle** guarantees that for any quantum state $|\psi\rangle$:

$$
\langle \psi \mid H \mid \psi \rangle \geq E_0
$$

Equality holds if and only if $|\psi\rangle$ is a ground state of $H$. Therefore, minimizing the expectation value $\langle \psi(\vec{\theta}) \mid H \mid \psi(\vec{\theta}) \rangle$ over a parameterized family of states yields an upper bound on the true ground state energy.

**Proof sketch.** Let $\lambda_0 \leq \lambda_1 \leq \cdots$ be the eigenvalues of $H$ with eigenstates $\{|\lambda_j\rangle\}$. Expanding $|\psi\rangle = \sum_j c_j |\lambda_j\rangle$:

$$
\langle \psi \mid H \mid \psi \rangle = \sum_j |c_j|^2 \lambda_j \geq \lambda_0 \sum_j |c_j|^2 = \lambda_0 = E_0
$$

## Algorithm

**Input**: Hamiltonian $H$ expressed as a linear combination of Pauli tensor products:

$$
H = \sum_i \alpha_i \; P_i, \qquad P_i \in \{I, X, Y, Z\}^{\otimes n}
$$

**Algorithm 7.1 (VQE):**

1. Choose a **variational ansatz** $V(\vec{\theta})$ -- a parameterized quantum circuit.
2. Initialize parameters $\vec{\theta}_0$.
3. **While** stopping criteria not met:
   - **Quantum**: Prepare $|\psi(\vec{\theta})\rangle = V(\vec{\theta})|0\rangle$ and measure in appropriate bases.
   - **Classical**: Estimate $E(\vec{\theta}) = \langle \psi(\vec{\theta}) \mid H \mid \psi(\vec{\theta}) \rangle$ from measurement statistics.
   - **Classical**: Update $\vec{\theta}$ using an optimization algorithm.
4. Return the final energy estimate and optimal parameters $\vec{\theta}^*$.

## Ansatz Design

The **ansatz** (variational form) determines the expressiveness of the trial state space. Common choices include:

- **Hardware-efficient ansatz**: Layers of single-qubit rotations and entangling gates, designed for the device connectivity. General-purpose but may have barren plateaus.
- **Chemically-inspired ansatz** (e.g., UCCSD): Unitary Coupled Cluster with Singles and Doubles, motivated by classical quantum chemistry methods.
- **QAOA ansatz**: $V(\vec{\theta}) = \prod_k e^{-i\beta_k H_M} e^{-i\gamma_k H_C}$, the special case for combinatorial optimization.

## Expectation Value Estimation

Since $H = \sum_i \alpha_i P_i$, by linearity:

$$
\langle \psi \mid H \mid \psi \rangle = \sum_i \alpha_i \langle \psi \mid P_i \mid \psi \rangle
$$

Each $\langle \psi \mid P_i \mid \psi \rangle$ is estimated by measuring in the eigenbasis of $P_i$:

- For a $Z$ factor on qubit $j$: measure in the computational basis (no change).
- For an $X$ factor on qubit $j$: apply $H$ (Hadamard) before measuring.
- For a $Y$ factor on qubit $j$: apply $R_X(\pi/2)$ before measuring.
- For an $I$ factor: any measurement basis works.

Pauli terms that share the same measurement basis can be grouped and estimated simultaneously.

## Finding Excited States (Deflation)

After finding the ground state $|\psi_0\rangle$ with energy $\lambda_0$, construct the modified Hamiltonian:

$$
H' = H + C \, |\psi_0\rangle\langle\psi_0|
$$

where $C > 0$ is large enough to push $|\psi_0\rangle$ above the first excited energy $\lambda_1$. VQE on $H'$ then converges to the first excited state. The process can be repeated for higher excited states.

## VQE vs. QAOA vs. QPE

| Feature | VQE | QAOA | QPE |
|---|---|---|---|
| Hamiltonian type | General | Diagonal (Ising) | General |
| Ansatz | Flexible | Fixed structure | None (exact) |
| Hardware requirement | NISQ | NISQ | Fault-tolerant |
| Application domain | Chemistry, physics | Combinatorial optimization | Chemistry, physics |

## Worked Examples

### Example 1: VQE for a Single-Qubit Hamiltonian

**Problem.** Find the ground state energy of $H = 0.4\,Z + 0.6\,X$ using VQE with the ansatz $V(\theta) = R_Y(\theta)$.

**Solution.** The trial state is $|\psi(\theta)\rangle = R_Y(\theta)|0\rangle = \cos(\theta/2)|0\rangle + \sin(\theta/2)|1\rangle$.

Compute the expectation value analytically:

$$
\langle \psi(\theta) \mid Z \mid \psi(\theta) \rangle = \cos^2(\theta/2) - \sin^2(\theta/2) = \cos\theta
$$

$$
\langle \psi(\theta) \mid X \mid \psi(\theta) \rangle = 2\cos(\theta/2)\sin(\theta/2) = \sin\theta
$$

Therefore:

$$
E(\theta) = 0.4\cos\theta + 0.6\sin\theta
$$

To minimize, take $dE/d\theta = 0$:

$$
-0.4\sin\theta + 0.6\cos\theta = 0 \implies \tan\theta = \frac{0.6}{0.4} = 1.5 \implies \theta^* \approx 0.9828 + \pi \approx 4.124 \text{ rad}
$$

(We pick the root that gives a minimum, not a maximum.)

The ground state energy is:

$$
E_0 = -\sqrt{0.4^2 + 0.6^2} = -\sqrt{0.52} \approx -0.7211
$$

This matches the exact answer: for $H = a\,Z + b\,X$, the eigenvalues are $\pm\sqrt{a^2 + b^2}$.

On a quantum computer, we would estimate $\langle Z \rangle$ by measuring in the computational basis and $\langle X \rangle$ by applying $H$ before measuring, then combine: $E = 0.4 \langle Z \rangle + 0.6 \langle X \rangle$.

### Example 2: VQE for $\text{H}_2$ (Conceptual Outline)

**Problem.** Use VQE to estimate the ground state energy of the hydrogen molecule $\text{H}_2$ at a given bond length.

**Setup.** After applying the Jordan-Wigner transformation, the $\text{H}_2$ Hamiltonian in a minimal (STO-3G) basis can be written as a sum of Pauli terms on 2 qubits:

$$
H_{\text{H}_2} = g_0 I \otimes I + g_1 Z \otimes I + g_2 I \otimes Z + g_3 Z \otimes Z + g_4 X \otimes X + g_5 Y \otimes Y
$$

where the coefficients $g_i$ depend on the bond length (e.g., at equilibrium $\approx 0.735$ angstroms, $g_0 \approx -0.81$, etc.).

**VQE procedure:**

1. Choose a hardware-efficient ansatz, e.g., $R_Y(\theta_1)$ on qubit 0, $R_Y(\theta_2)$ on qubit 1, followed by a CNOT, followed by another layer of $R_Y$ rotations.
2. For each set of parameters $\vec{\theta}$, estimate $\langle H_{\text{H}_2} \rangle$ by measuring in three bases:
   - Computational basis ($Z$ terms): estimate $\langle ZI \rangle$, $\langle IZ \rangle$, $\langle ZZ \rangle$.
   - $X$ basis (apply $H \otimes H$): estimate $\langle XX \rangle$.
   - $Y$ basis (apply $R_X(\pi/2) \otimes R_X(\pi/2)$): estimate $\langle YY \rangle$.
3. Combine: $E(\vec{\theta}) = g_0 + g_1\langle ZI \rangle + g_2\langle IZ \rangle + g_3\langle ZZ \rangle + g_4\langle XX \rangle + g_5\langle YY \rangle$.
4. A classical optimizer (e.g., COBYLA, SPSA) updates $\vec{\theta}$ to minimize $E$.
5. The converged energy approximates the molecular ground state energy, typically within chemical accuracy ($\sim 1.6 \times 10^{-3}$ Hartree) of the exact value.

## See Also

- [[QAOA]]
- [[Grover's Algorithm]]
- [[Amplitude Amplification]]
- [[Quantum Gates]]
- [[QML Textbook — Ch. 7 VQE]]
