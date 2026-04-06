---
title: Instant Neural Graphics Primitives with a Multiresolution Hash Encoding
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [deep-learning, neural-rendering, hash-encoding, NeRF, computer-graphics]
sources: [MRHE.pdf]
---

# Instant Neural Graphics Primitives with a Multiresolution Hash Encoding

**Authors:** Thomas Müller, Alex Evans, Christoph Schied, Alexander Keller
**Institution:** [[NVIDIA]]
**Venue:** ACM Transactions on Graphics (SIGGRAPH 2022)
**Year:** 2022

## Overview

Introduces a **[[Multiresolution Hash Encoding]]** that enables training neural graphics primitives (NeRF, SDFs, gigapixel images) in seconds rather than hours. The key idea: replace the MLP's input encoding with a hierarchy of hash tables containing trainable feature vectors, allowing a much smaller network to achieve high quality.

## Core Method

### Multiresolution Hash Table Structure

A cascade of $L$ hash tables at geometrically spaced resolutions from coarse ($N_{\min}$) to fine ($N_{\max}$):

$$N_l = \lfloor N_{\min} \cdot b^l \rfloor, \quad b = \exp\!\left(\frac{\ln N_{\max} - \ln N_{\min}}{L - 1}\right)$$

Each table maps grid vertices to $F$-dimensional trainable feature vectors. At coarse resolutions the mapping is 1:1; at fine resolutions, multiple vertices **hash-collide** into the same entry.

### Encoding Pipeline

For input coordinate $\mathbf{x}$:

1. **Hash** surrounding voxel vertices at each resolution level $l$
2. **Look up** $F$-dimensional feature vectors from hash table $\theta_l$
3. **Interpolate** linearly based on $\mathbf{x}$'s position within the voxel
4. **Concatenate** all levels plus auxiliary inputs → encoded vector $\mathbf{y} \in \mathbb{R}^{LF + E}$
5. **Feed** through a small MLP $m(\mathbf{y}; \Phi)$

### Why Hash Collisions Work

Colliding training gradients average, so the **largest gradients dominate** — the hash tables automatically prioritize regions with the most important fine-scale detail. No pruning, splitting, or structural updates needed during training.

### Performance

- Hash lookups are $O(1)$ with no control flow → maps perfectly to GPU parallelism
- Fully-fused CUDA kernels minimize wasted bandwidth
- Combined speedup: **several orders of magnitude** over prior methods

## Key Results

| Task | Training Time | Quality |
|---|---|---|
| Gigapixel image | Seconds | Competitive with frequency encoding |
| Neural SDF | Seconds | State-of-the-art |
| Neural radiance caching | Real-time | Replaces costly Monte Carlo |
| [[NeRF]] | ~5 seconds | 24.58 dB PSNR (vs 22.90 for frequency enc.) |

With $T = 2^{19}$ hash table entries and a 10k-parameter MLP, achieves quality comparable to 33.6M-parameter dense grids while training over $8\times$ faster.

## Comparison of Encodings

| Encoding | Params | Adaptivity | Speed | Quality |
|---|---|---|---|---|
| None | ~411k | — | Slow | Poor |
| Frequency (Vaswani/NeRF) | ~438k | Fixed | Slow | Good |
| Dense grid (single res.) | ~33.6M | Low | Fast | Good |
| Dense grid (multi res.) | ~16.3M | Medium | Fast | Better |
| **Hash table (this paper)** | ~12.6M | High | Fast | Best |

## Connection to Transformers

The frequency (sinusoidal) encoding used as baseline originates from [[Attention Is All You Need]], where it serves as positional encoding. This paper replaces that fixed encoding with a learned, spatially adaptive alternative.

## See Also

- [[Multiresolution Hash Encoding]]
- [[NeRF]]
- [[Attention Is All You Need]] — origin of frequency/positional encoding
- [[NVIDIA]]
