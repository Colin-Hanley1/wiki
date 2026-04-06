---
title: Multiresolution Hash Encoding
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [deep-learning, neural-rendering, hash-encoding, computer-graphics]
sources: [MRHE.pdf]
---

# Multiresolution Hash Encoding

A trainable input encoding for neural networks that maps spatial coordinates to feature vectors via a hierarchy of hash tables at multiple resolutions. Introduced by Müller et al. (2022) at [[NVIDIA]], it enables training neural graphics primitives (including [[NeRF]]) in seconds rather than hours.

## Method

### Hash Table Hierarchy

$L$ levels of hash tables at geometrically spaced resolutions:

$$N_l = \lfloor N_{\min} \cdot b^l \rfloor, \quad b = \exp\!\left(\frac{\ln N_{\max} - \ln N_{\min}}{L-1}\right)$$

Each level stores a table of $T$ trainable $F$-dimensional feature vectors. At coarse resolutions, the mapping from grid vertices to table entries is 1:1. At fine resolutions, the table acts as a **hash table** with collisions.

### Encoding Pipeline

For input $\mathbf{x} \in \mathbb{R}^d$:

1. At each level $l$, hash the surrounding voxel vertices to table indices
2. Look up $F$-dimensional feature vectors from $\theta_l$
3. Linearly interpolate based on $\mathbf{x}$'s position within the voxel
4. Concatenate all $L$ levels plus auxiliary inputs $\xi \in \mathbb{R}^E$
5. Feed through a small MLP: $m(\mathbf{y}; \Phi)$ where $\mathbf{y} \in \mathbb{R}^{LF + E}$

### Collision Resolution via Gradient Averaging

Hash collisions are **not** resolved explicitly (no probing, chaining, or bucketing). Instead, colliding gradients average during backpropagation, and the **largest gradients dominate** — automatically prioritizing regions with fine-scale detail. The neural network learns to disambiguate collisions.

## Key Properties

- **$O(1)$ lookup** — no tree traversal or control flow divergence
- **Task-agnostic** — same architecture for gigapixel images, SDFs, radiance caching, and NeRF
- **Adaptive** — hash collisions naturally allocate capacity to regions with complex detail
- **Compact** — 20× fewer parameters than dense grids at comparable quality

## Relation to Prior Encodings

| Encoding | Type | Adaptivity | Key Limitation |
|---|---|---|---|
| Frequency (sinusoidal) | Fixed | None | Requires large MLP |
| Dense grid | Parametric | Low | $O(N^3)$ memory for 3D |
| Octree/sparse grid | Parametric | High | Requires pruning heuristics |
| **Hash table (this work)** | Parametric | High | None (collisions handled implicitly) |

The frequency encoding baseline originated in [[Attention Is All You Need]] as positional encoding for the [[Transformer]].

## See Also

- [[NeRF]]
- [[Instant Neural Graphics Primitives with a Multiresolution Hash Encoding]]
- [[Transformer]] — source of the sinusoidal baseline encoding
- [[NVIDIA]]
