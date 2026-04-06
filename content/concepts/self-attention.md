---
title: Self-Attention
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [deep-learning, attention, transformers]
sources: [AttentionIsAllYouNeed.pdf]
---

# Self-Attention

**Self-attention** (also called intra-attention) is an attention mechanism that relates different positions of a single sequence to compute a representation of that sequence. It is the core operation in the [[Transformer]] architecture.

## Scaled Dot-Product Attention

Given queries $Q$, keys $K$, and values $V$ (all derived from the same input sequence in self-attention):

$$\text{Attention}(Q, K, V) = \text{softmax}\!\left(\frac{QK^\top}{\sqrt{d_k}}\right) V$$

- **Dot product** $QK^\top$: measures compatibility between each query-key pair
- **Scaling** by $1/\sqrt{d_k}$: prevents large-magnitude dot products from saturating the softmax
- **Softmax**: converts scores to a probability distribution over values
- **Weighted sum** of $V$: produces the output representation

## Why Self-Attention

Compared to recurrent and convolutional layers (Source: [[Attention Is All You Need]]):

- **Maximum path length $O(1)$**: every position directly attends to every other — no information bottleneck from sequential processing
- **Parallelizable**: all positions computed simultaneously (vs. $O(n)$ sequential steps for RNNs)
- **Interpretable**: attention weights reveal which positions the model considers related

The tradeoff is $O(n^2)$ complexity in sequence length, motivating variants like sparse attention for long sequences.

## Variants in the Transformer

1. **Encoder self-attention**: each position attends to all positions in the encoder
2. **Decoder masked self-attention**: each position attends only to earlier positions (causal mask)
3. **Cross-attention**: decoder queries attend to encoder key-value pairs

All three use [[Multi-Head Attention]] to attend to different representation subspaces in parallel.

## See Also

- [[Multi-Head Attention]]
- [[Transformer]]
- [[Attention Is All You Need]]
