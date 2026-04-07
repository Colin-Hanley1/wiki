---
title: "Grover's Algorithm"
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, search, amplitude-amplification, grovers-algorithm]
sources: [qml-textbook-ch-6-grover-adaptive-search]
---

# Grover's Algorithm

**Grover's algorithm** (Grover, 1996) is a quantum search algorithm that finds a marked element among $N$ unsorted items using $O(\sqrt{N})$ oracle queries, compared to $O(N)$ classically. It is the canonical example of [[Amplitude Amplification]] and serves as the foundation for Grover Adaptive Search (GAS), a quantum method for combinatorial optimization.

## Problem Setting

Given a Boolean function $f : \{0,1\}^n \to \{0,1\}$ accessible only as a black-box oracle, find an $x$ such that $f(x) = 1$. There are $N = 2^n$ possible inputs and $M$ marked elements (those satisfying $f$).

## Quantum Oracle

The oracle is a unitary $O_f$ acting on $n+1$ qubits:

$$
O_f |x\rangle |y\rangle = |x\rangle |y \oplus f(x)\rangle
$$

where $\oplus$ denotes addition modulo 2. This is reversible since applying $O_f$ twice returns the original state.

### Phase Oracle via Kickback

By preparing the ancilla in state $|{-}\rangle = \frac{1}{\sqrt{2}}(|0\rangle - |1\rangle)$, the oracle effectively applies a phase:

$$
O_f |x\rangle |{-}\rangle = (-1)^{f(x)} |x\rangle |{-}\rangle
$$

This **phase kickback** converts the bit-flip oracle into a phase oracle, marking target states with a $-1$ phase without disturbing the ancilla.

## Grover's Diffusion Operator

After the oracle marks states with a negative phase, the **diffusion operator** $D$ performs an inversion about the mean of all amplitudes. If each amplitude $a_x$ has mean $\bar{a}$, the diffusion maps $a_x \mapsto 2\bar{a} - a_x$. This increases the amplitude of marked states (which were made negative by the oracle) while decreasing the rest.

The diffusion operator is implemented as:

$$
D = H^{\otimes n} \; (2|0\rangle\langle 0| - I) \; H^{\otimes n}
$$

In circuit form (for $n$ qubits): apply $H^{\otimes n}$, apply $X$ to all qubits, apply a multi-controlled $Z$ gate, apply $X$ to all qubits, apply $H^{\otimes n}$.

## Geometric Picture

The algorithm operates in the 2D subspace spanned by:

- $|x_0\rangle$: uniform superposition of non-marked states
- $|x_1\rangle$: uniform superposition of marked states (or the single marked state)

Define $\theta$ by $\sin\theta = \sqrt{M/N}$. The initial state $|+\rangle^{\otimes n}$ makes angle $\theta$ with $|x_0\rangle$. Each Grover iteration (oracle + diffusion) rotates the state by $2\theta$ toward $|x_1\rangle$. After $m$ iterations, the state is

$$
\cos\bigl((2m+1)\theta\bigr)|x_0\rangle + \sin\bigl((2m+1)\theta\bigr)|x_1\rangle
$$

## Optimal Iteration Count

To maximize the probability of measuring a marked element, we need $\sin((2m+1)\theta) \approx 1$, giving

$$
m \approx \frac{\pi}{4\theta} - \frac{1}{2} \approx \frac{\pi}{4}\sqrt{\frac{N}{M}}
$$

For $M$ marked elements among $N$ total:

$$
m_{\text{opt}} = \left\lfloor \frac{\pi}{4}\sqrt{\frac{N}{M}} \right\rfloor
$$

**Warning**: Overshooting past $m_{\text{opt}}$ causes the success probability to oscillate back toward zero. The probability is periodic, not monotonically increasing.

## Unknown Number of Marked Elements

When $M$ is unknown, the Boyer-Brassard-Hoyer-Tapp (BBHT) method randomly selects $m$ from a geometrically growing range, guaranteeing at least probability $1/4$ of success per attempt while maintaining $O(\sqrt{N/M})$ average query complexity. Repeating $\sim 1000$ times makes failure probability negligible.

## Durr-Hoyer Algorithm (Grover Adaptive Search)

To find the **minimum** of a function $g$ over $\{0,1\}^n$:

1. Pick a random $x_0$ and compute $g(x_0)$.
2. Build an oracle that marks all $x$ with $g(x) < g(x_0)$.
3. Run Grover search; if a better $x_1$ is found, update the threshold.
4. Repeat with tightening thresholds until convergence.

This gives a quadratic speedup over brute-force minimization: $O(\sqrt{2^n})$ oracle calls to find the global minimum with probability $\geq 1/2$.

## Worked Examples

### Example 1: Grover Search with $N = 4$, One Marked Element

**Problem.** We have $n = 2$ qubits ($N = 4$ elements) and one marked element $|11\rangle$, so $f(x) = 1$ iff $x = 11$. How many Grover iterations are needed, and what does the circuit look like?

**Solution.** We have $M = 1$, $N = 4$. First compute $\theta$:

$$
\sin\theta = \sqrt{\frac{1}{4}} = \frac{1}{2} \implies \theta = \frac{\pi}{6}
$$

Optimal iterations: $m = \lfloor (\pi/4)\sqrt{4/1} \rfloor = \lfloor \pi/2 \rfloor = 1$.

**Circuit walkthrough (1 iteration):**

1. **Initialize**: $|00\rangle |1\rangle$.
2. **Hadamards**: Apply $H$ to all qubits (including ancilla) to get $\frac{1}{2}(|00\rangle + |01\rangle + |10\rangle + |11\rangle)|{-}\rangle$.
3. **Oracle $O_f$**: The oracle for $f(x) = 1$ iff $x = 11$ is a controlled-$Z$ (Toffoli-like) gate that flips the phase of $|11\rangle$. After the oracle, the state is $\frac{1}{2}(|00\rangle + |01\rangle + |10\rangle - |11\rangle)|{-}\rangle$.
4. **Diffusion operator**: Inversion about the mean. The amplitudes are $\{1/2, 1/2, 1/2, -1/2\}$, mean $= 1/4$. After inversion: $a_x \mapsto 2(1/4) - a_x$. Non-marked states: $1/2 - 1/2 = 0$. Marked state: $1/2 + 1/2 = 1$. The state becomes $|11\rangle|{-}\rangle$.
5. **Measure**: We obtain $|11\rangle$ with probability 1.

Grover's algorithm finds the marked element with certainty in a single iteration for $N = 4, M = 1$.

### Example 2: Overshooting Iterations with $N = 16$

**Problem.** For $n = 4$ qubits and $M = 1$ marked element, compute the success probability for $m = 3$ and $m = 6$ iterations.

**Solution.** We have $\sin\theta = 1/\sqrt{16} = 1/4$, so $\theta \approx 0.2527$ rad.

**At $m = 3$ (optimal):** $(2 \cdot 3 + 1)\theta = 7 \times 0.2527 \approx 1.769 \approx \pi/2$. Thus $\sin^2(7\theta) \approx \sin^2(\pi/2) \approx 1$. Success probability $\approx 96.1\%$.

**At $m = 6$:** $(2 \cdot 6 + 1)\theta = 13 \times 0.2527 \approx 3.285$. Since $\sin(3.285) \approx \sin(\pi - 3.285) \approx -0.144$, success probability $\approx 2.1\%$.

This illustrates the critical importance of choosing the right number of iterations. More is not always better.

## See Also

- [[Amplitude Amplification]]
- [[QAOA]]
- [[VQE]]
- [[Quantum Gates]]
- [[QML Textbook — Ch. 6 Grover Adaptive Search]]
