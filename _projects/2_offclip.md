---
layout: page
title: OFF-CLIP
description: Improving normal detection confidence in radiology CLIP (MICCAI 2025, early accept top 9%)
img: assets/img/projects/offclip_pipeline.png
importance: 2
category: research
related_publications: true
redirect: /projects/offclip/
---

**Period:** 2024.06 – 2025.09 · **Role:** Co-first author. Identified the first problem, formulated the off-diagonal term loss, and implemented all baseline models for benchmarking.

### Problem

Vision-language models that detect abnormalities in chest X-rays suffer from high false-positive rates on normal images. Analyzing the data, we found two bottlenecks:

1. Normal images and reports are semantically similar across patients, yet conventional InfoNCE treats different normal patients as negative pairs, which breaks up the normal cluster.
2. Reports of abnormal patients also contain normal sentences (e.g. "There is no pneumothorax."). Forcing these to align with abnormal images degrades performance.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/projects/offclip_problem.png" title="Problem definition" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    (a) Conventional diagonal InfoNCE loss, (b) false positives in normal pairs, (c) false negatives in abnormal pairs.
</div>

### Method

- **Off-diagonal term loss:** treat all normal image-text pairs as positives.
- **Text filtering:** an LLM rewrites each report into sentences, a sentence-level anomaly classifier labels them, and normal sentences are removed from abnormal reports.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/projects/offclip_pipeline.png" title="OFF-CLIP pipeline" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    OFF-CLIP pipeline: text prompting and filtering, off-diagonal term loss, and abnormal InfoNCE loss.
</div>

### Results

Applied to CARZero, OFF-CLIP raises zero-shot normal AUC from 0.25 → 0.86 on VinDr-CXR, 0.32 → 0.74 on Open-I, 0.24 → 0.77 on PadChest, and 0.38 → 0.81 on CheXpert, while maintaining or improving abnormal-class performance.

**Publication:** {% cite park2025off %}
