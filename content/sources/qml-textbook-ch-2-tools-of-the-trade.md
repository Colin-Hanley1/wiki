---
title: "QML Textbook — Ch. 2 Tools of the Trade"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [quantum-computing, qiskit, pennylane, ocean, software-frameworks]
sources: [qml_ch2]
---

## Overview

Chapter 2 surveys the main software frameworks used for quantum computing and quantum machine learning. It focuses on three tools: **Qiskit** (IBM), **PennyLane** (Xanadu), and **Ocean** (D-Wave). The chapter provides hands-on introductions to building, simulating, and running quantum circuits.

## Key Topics

### Qiskit (IBM)

- **Architecture**: Qiskit Terra (circuit construction, BasicAer simulator), Qiskit Aer (high-performance C++ simulators with optional GPU support), Qiskit Machine Learning, Qiskit Optimization, Qiskit Nature, Qiskit Finance, Qiskit Experiments, Qiskit Metal, Qiskit Dynamics.
- **Circuit construction**: `QuantumCircuit(n, m)` for $n$ qubits and $m$ classical bits. Gates added via methods like `qc.x(0)`, `qc.h(0)`, `qc.cx(0, 1)`, `qc.rx(theta, q)`, `qc.u(theta, phi, lambd, q)`.
- **Measurements**: `qc.measure(qbits, bits)` or `qc.measure_all()`. Results retrieved via `result.get_counts()`.
- **Simulation**: `AerSimulator()` runs circuits with configurable shot counts. State vectors accessible via `qc.save_statevector()` and `result.get_statevector()`. Unitary matrices via the `'unitary'` simulation method.
- **Real hardware**: Access IBM Quantum devices through `IBMQ.load_account()` and `provider.get_backend()`. The `least_busy()` utility selects the least occupied device.
- **Qubit ordering caveat**: Qiskit assigns the top qubit (qubit 0) as the least significant bit, opposite to the standard convention.

### PennyLane (Xanadu)

- **Architecture**: Core package plus community plugins for Qiskit, Amazon Braket, Cirq, and QuEST.
- **Circuit definition**: Circuits are Python functions decorated with `@qml.qnode(dev)`. Gates are function calls like `qml.PauliX(wires=0)`, `qml.Hadamard(wires=0)`, `qml.RX(phi=theta, wires=w)`.
- **Devices**: Simulators like `qml.device('default.qubit', wires=2)`. The device object specifies qubit count.
- **Return values**: `qml.state()` for full state vector, `qml.expval()` for expectation values, `qml.sample()` for measurement samples.
- **Qubit ordering**: PennyLane uses the standard convention (first qubit is most significant bit).
- **Interoperability**: Best-in-class for quantum machine learning, with native TensorFlow and PyTorch integration.

### Ocean (D-Wave)

- **Purpose**: Unique framework for defining problems and running them on quantum annealers.
- **Problem specification**: Uses `dimod.BinaryQuadraticModel` for Ising and QUBO problems.
- **Hardware access**: D-Wave Leap cloud service provides free monthly computing time on quantum annealers.
- **Prerequisite knowledge**: Requires understanding of QUBO and Ising model formulations (covered in Ch. 3).

## Key Takeaways

- Qiskit and PennyLane are the recommended gate-based frameworks; Qiskit for its breadth, PennyLane for ML interoperability.
- Ocean fills a unique niche as the only major framework for quantum annealing.
- All frameworks are rapidly evolving; version pinning and documentation consultation are essential.
- Simulator performance is sufficient for learning; GPU acceleration available in Qiskit Aer for demanding tasks.

## See Also

- [[QML Textbook — Ch. 1 Foundations of Quantum Computing]]
- [[QML Textbook — Ch. 3 QUBO Problems]]
- [[QML Textbook — Ch. 4 Adiabatic QC and Quantum Annealing]]
- [[Quantum Gates]]
- [[Qubit]]
