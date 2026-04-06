---
title: Transformer
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [deep-learning, transformers, architecture, NLP]
sources: [AttentionIsAllYouNeed.pdf]
---

# Transformer

The **Transformer** is a neural network architecture for sequence transduction based entirely on [[Self-Attention]], introduced in [[Attention Is All You Need]] (Vaswani et al., 2017). It replaces recurrence and convolution with attention mechanisms, enabling massive parallelization and superior modeling of long-range dependencies.

## Architecture

### Encoder

A stack of $N = 6$ identical layers, each containing:

1. **[[Multi-Head Attention]]** (self-attention over the encoder input)
2. **Position-wise feed-forward network:** $\text{FFN}(x) = \max(0, xW_1 + b_1)W_2 + b_2$

Each sub-layer wrapped with a residual connection and layer normalization: $\text{LayerNorm}(x + \text{Sublayer}(x))$. All layers produce $d_{\text{model}} = 512$-dimensional outputs.

### Decoder

Same structure as encoder plus a third sub-layer: **cross-attention** over the encoder output. The decoder's self-attention is **masked** to prevent attending to future positions, preserving auto-regressive generation.

### Positional Encoding

Since there is no recurrence, position information is injected via fixed sinusoidal functions:

$$PE_{(\text{pos}, 2i)} = \sin\!\left(\frac{\text{pos}}{10000^{2i/d_{\text{model}}}}\right), \quad PE_{(\text{pos}, 2i+1)} = \cos\!\left(\frac{\text{pos}}{10000^{2i/d_{\text{model}}}}\right)$$

This allows the model to learn relative positional relationships and generalize to unseen sequence lengths.

## Key Properties

- **Constant-depth path** between any two positions → learns long-range dependencies easily
- **$O(1)$ sequential operations** per layer (vs. $O(n)$ for RNNs) → fully parallelizable
- **$O(n^2 \cdot d)$ complexity** per layer — quadratic in sequence length, which becomes a bottleneck for very long sequences

## Impact

The Transformer is the backbone of modern deep learning:

| Domain | Model | Year |
|---|---|---|
| NLP | BERT, GPT, T5, LLaMA | 2018–present |
| Vision | ViT, Swin Transformer | 2020–present |
| Protein structure | AlphaFold 2 | 2021 |
| Audio/Speech | Whisper | 2022 |
| Neural rendering | NeRF variants | 2020–present |

## See Also

- [[Self-Attention]]
- [[Multi-Head Attention]]
- [[Attention Is All You Need]]
- [[Multiresolution Hash Encoding]] — uses Transformer's sinusoidal encoding as starting point
