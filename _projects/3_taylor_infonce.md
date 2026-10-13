---
layout: page
title: Efficient Contrastive Learning
description: Linear-complexity InfoNCE via first-order Taylor expansion for biomedical time series (ICTC 2025)
img: assets/img/projects/taylor_efficiency.png
importance: 3
category: research
related_publications: true
---

**Period:** 2025.02 – 2025.10 · **Role:** Co-first author. Led the mathematical formulation of the first-order Taylor approximation.

### Problem

The standard InfoNCE loss requires a batch-by-batch similarity matrix, so memory and compute grow quadratically with batch size.

### Method

Writing the second term of InfoNCE as $$f(t) = \log \sum_j \exp(st)$$ and expanding around $$t = 0$$ gives $$f(t) \simeq \log B + \left(\frac{1}{B}\sum_j s\right) t$$. Substituting $$s = r_i \cdot z_j$$ and $$t = 1$$:

$$
\mathcal{L}_{ap} = -\frac{1}{B} \sum_{i}^{B} (r_i \cdot z_i) + \log B + \left( \frac{1}{B} \sum_{i}^{B} r_i \right) \cdot \left( \frac{1}{B} \sum_{j}^{B} z_j \right)
$$

The cross term reduces to a dot product of batch means, so no similarity matrix is ever formed.

### Results

Integrated into TS2Vec and evaluated on UCI HAR:

| Method   | Accuracy | AUPRC  | Time (s) | GPU peak (MB) | Throughput (items/s) |
| -------- | -------- | ------ | -------- | ------------- | -------------------- |
| Original | 0.9213   | 0.9485 | 60.1     | 20576.0       | 122.4                |
| Taylor   | 0.9087   | 0.9291 | 31.9     | 8214.0        | 230.6                |

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/projects/taylor_efficiency.png" title="Efficiency across model configurations" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Time, peak memory, speedup (up to 7.3x), and memory reduction (up to 8.5x) across model configurations.
</div>

**Publication:** {% cite jeong2025efficient %}
