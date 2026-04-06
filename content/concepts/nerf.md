---
title: NeRF
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [deep-learning, neural-rendering, 3D-reconstruction, computer-graphics]
sources: [MRHE.pdf]
---

# NeRF

**Neural Radiance Fields (NeRF)** represent a 3D scene as a continuous volumetric function learned by a neural network. Given a set of 2D images with known camera poses, NeRF learns a mapping from 5D input (3D position + 2D viewing direction) to color and density, enabling photorealistic novel view synthesis.

## Formulation

The scene is modeled as a function $F_\Theta : (\mathbf{x}, \mathbf{d}) \to (\mathbf{c}, \sigma)$ where:

- $\mathbf{x} = (x, y, z)$ — 3D spatial position
- $\mathbf{d} = (\theta, \phi)$ — viewing direction
- $\mathbf{c} = (r, g, b)$ — emitted color
- $\sigma$ — volume density

Novel views are rendered via **volume rendering**: casting rays through the scene and integrating color weighted by accumulated transmittance.

## Training

The network is trained by minimizing the photometric loss between rendered and observed images. The original NeRF (Mildenhall et al., 2020) uses a frequency (sinusoidal) encoding of inputs — the same family of positional encodings introduced in [[Attention Is All You Need]].

## Speed Problem and Hash Encoding Solution

Original NeRF requires hours of training per scene. The [[Multiresolution Hash Encoding]] (Müller et al., 2022) reduces this to **~5 seconds** by replacing the large MLP + frequency encoding with a small MLP augmented by trainable hash tables. This achieves higher quality (24.58 vs 22.90 dB PSNR) with $8\times$ faster training (Source: [[Instant Neural Graphics Primitives with a Multiresolution Hash Encoding]]).

## See Also

- [[Multiresolution Hash Encoding]]
- [[Instant Neural Graphics Primitives with a Multiresolution Hash Encoding]]
- [[Transformer]] — source of frequency/positional encoding used in original NeRF
- [[NVIDIA]]
