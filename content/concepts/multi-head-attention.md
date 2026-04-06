---
title: Multi-Head Attention
type: concept
created: 2026-04-06
updated: 2026-04-06
tags: [deep-learning, attention, transformers]
sources: [AttentionIsAllYouNeed.pdf]
---

# Multi-Head Attention

**Multi-head attention** runs multiple [[Self-Attention]] functions in parallel, each with different learned projections, then concatenates and projects the results. Introduced in [[Attention Is All You Need]] as the core building block of the [[Transformer]].

## Formulation

$$\text{MultiHead}(Q, K, V) = \text{Concat}(\text{head}_1, \ldots, \text{head}_h)\, W^O$$

where each head is:

$$\text{head}_i = \text{Attention}(Q W_i^Q,\; K W_i^K,\; V W_i^V)$$

**Parameters:** $W_i^Q, W_i^K \in \mathbb{R}^{d_{\text{model}} \times d_k}$, $W_i^V \in \mathbb{R}^{d_{\text{model}} \times d_v}$, $W^O \in \mathbb{R}^{hd_v \times d_{\text{model}}}$.

In the original Transformer: $h = 8$ heads, $d_k = d_v = d_{\text{model}} / h = 64$.

## Why Multiple Heads

A single attention head averages over all attended positions, which can wash out fine-grained patterns. Multiple heads allow the model to:

- Attend to **different representation subspaces** simultaneously
- Capture **different types of relationships** (e.g., syntactic vs. semantic)
- Maintain computational cost similar to single-head full-dimensional attention

## Role in the Transformer

Multi-head attention appears in three places:

| Location | Queries from | Keys/Values from | Masking |
|---|---|---|---|
| Encoder self-attention | Encoder layer $l-1$ | Encoder layer $l-1$ | None |
| Decoder self-attention | Decoder layer $l-1$ | Decoder layer $l-1$ | Causal (future masked) |
| Encoder-decoder attention | Decoder layer $l-1$ | Encoder output | None |

## See Also

- [[Self-Attention]]
- [[Transformer]]
- [[Attention Is All You Need]]
