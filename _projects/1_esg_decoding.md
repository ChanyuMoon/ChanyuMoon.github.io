---
layout: page
title: Spinal-Based Motor Intention Decoding
description: Muscle-guided latent representation distillation for robust ESG-based motor intention decoding
img: assets/img/projects/esg_overview.png
importance: 1
category: research
---

**Period:** 2025.10 – 2026.08 · **Role:** Lead researcher (M.S. thesis research)

### Problem

Accurate estimation of motor intention is crucial for exoskeleton robot control. Electromyography (EMG) provides the most reliable motor intention signals, but it is often unattainable from patients with severe motor impairments such as quadriplegia. Electroencephalography (EEG) and Electrospinogram (ESG) are viable alternatives, yet isolating pure motor intention from them is hard because they are heavily entangled with sensory feedback.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/projects/esg_overview.png" title="Overview of previous and proposed methods" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Overview of previous and proposed methods.
</div>

### Method

We propose a decoding framework with two variants, **ESG-CL** (contrastive learning) and **ESG-DT** (domain translator). During training, EMG signals from other healthy subjects guide the model to distill pure motor representations from complex ESG signals; at inference only ESG is required.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/projects/esg_pipeline.png" title="ESG-DT and ESG-CL pipelines" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    (A) ESG-DT translates the ESG latent into the EMG latent space. (B) ESG-CL aligns ESG and EMG latents with InfoNCE.
</div>

### Validation

1. Comparative analysis against single-modality models on healthy subjects.
2. A simulated quadriplegia scenario (zero-EMG condition), where the target subject's EMG is completely withheld, comparing ESG-CL and ESG-DT against EEG-only and ESG-only baselines.
