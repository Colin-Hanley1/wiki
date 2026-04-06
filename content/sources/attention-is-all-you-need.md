---
title: Attention Is All You Need
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [deep-learning, transformers, attention, NLP, machine-translation]
sources: [AttentionIsAllYouNeed.pdf]
---

# Attention Is All You Need

**Authors:** [[Ashish Vaswani]], Noam Shazeer, Niki Parmar, Jakob Uszkoreit, Llion Jones, Aidan N. Gomez, Łukasz Kaiser, Illia Polosukhin
**Institutions:** [[Google Brain]], Google Research, University of Toronto
**Venue:** NeurIPS 2017 (NIPS 2017), Long Beach, CA
**Year:** 2017

## Overview

Introduces the **[[Transformer]]** architecture — the first sequence transduction model based entirely on [[Self-Attention]], dispensing with recurrence and convolutions. Achieves state-of-the-art on machine translation while being far more parallelizable than RNN-based models.

## Key Contributions

### The Transformer Architecture

An encoder-decoder model built from stacked layers of:

1. **[[Multi-Head Attention]]** — parallel attention heads attending to different representation subspaces.
2. **Position-wise feed-forward networks** — two linear transformations with ReLU: $\text{FFN}(x) = \max(0, xW_1 + b_1)W_2 + b_2$.
3. **Residual connections + layer normalization** around each sub-layer: $\text{LayerNorm}(x + \text{Sublayer}(x))$.

Both encoder and decoder use $N = 6$ identical layers with $d_{\text{model}} = 512$.

### Scaled Dot-Product Attention

$$\text{Attention}(Q, K, V) = \text{softmax}\!\left(\frac{QK^\top}{\sqrt{d_k}}\right) V$$

Scaling by $1/\sqrt{d_k}$ prevents dot products from growing large and pushing softmax into saturated regions.

### Multi-Head Attention

$$\text{MultiHead}(Q, K, V) = \text{Concat}(\text{head}_1, \ldots, \text{head}_h) W^O$$

where $\text{head}_i = \text{Attention}(QW_i^Q, KW_i^K, VW_i^V)$. Uses $h = 8$ heads with $d_k = d_v = 64$.

Three applications in the Transformer: encoder self-attention, decoder masked self-attention, and encoder-decoder cross-attention.

### Positional Encoding

Since the model has no recurrence, position information is injected via sinusoidal encodings:

$$PE_{(\text{pos}, 2i)} = \sin(\text{pos} / 10000^{2i/d_{\text{model}}}), \quad PE_{(\text{pos}, 2i+1)} = \cos(\text{pos} / 10000^{2i/d_{\text{model}}})$$

Allows the model to attend by relative position and extrapolate to unseen sequence lengths.

## Why Self-Attention

| Property | Self-Attention | Recurrent | Convolutional |
|---|---|---|---|
| Complexity per layer | $O(n^2 \cdot d)$ | $O(n \cdot d^2)$ | $O(k \cdot n \cdot d^2)$ |
| Sequential ops | $O(1)$ | $O(n)$ | $O(1)$ |
| Max path length | $O(1)$ | $O(n)$ | $O(\log_k n)$ |

Self-attention connects all positions in $O(1)$ sequential operations with $O(1)$ maximum path length — critical for learning long-range dependencies.

## Results

- **WMT 2014 EN-DE:** 28.4 BLEU (>2 BLEU over previous best including ensembles)
- **WMT 2014 EN-FR:** 41.8 BLEU (single model SOTA), trained in 3.5 days on 8 P100 GPUs
- Also applies to English constituency parsing, demonstrating generality beyond translation.

## Significance

The Transformer became the foundation for nearly all subsequent large language models (BERT, GPT, T5, etc.) and has been adapted across domains including vision (ViT), protein structure (AlphaFold), and audio (Whisper). The [[Multi-Head Attention]] mechanism and the [[Self-Attention]] paradigm are now ubiquitous in deep learning.

## See Also

- [[Transformer]]
- [[Self-Attention]]
- [[Multi-Head Attention]]
- [[Multiresolution Hash Encoding]] — uses the Transformer's positional encoding as a baseline
- [[Google Brain]]
