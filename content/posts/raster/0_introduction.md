---
title: "Fast Software Rasterization: Introduction"
date: 2023-03-04T21:16:10-05:00
draft: false
---

# Introduction
Software rasterization is an interesting and challenging area because getting good results really relies on making the best use of the limited resources of the CPU.

This series covers how to make a fast software rasterizer with a focus on high polygon scenes and reducing overdraw.

## Fast software rasteriation requirements
In order for a software rasterizer to be fast, all of the following requirements must be fulfilled:

### Parallel
Modern CPUs have many cores, and rasterization is a compute heavy workload that is parallelizatble. The usual way to do this is partition the triangles for triangle processing and partition the render target for pixel processing.

### Vectorized
Modern CPUs are also data parallel, new X86 CPUs support at least AVX2 (8 floats per instruction) and some support AVX-512 for 16 floats per instruction. Using this enables each core to process multiple triangles and pixels at the same time.

### Cache efficient
A reasonable scene with 1,000,000 triangles where each triangle takes 32 bytes would already take 32MB of cache excluding any texture. Caches are relatively small compared to the size of an average scene that is rendered.

Cache size for Ryzen 3600:

* L1: 6 x 32KB
* L2: 6 x 512KB
* L3: 2 x 16MB

L1 being the fastest level unfortunately only has 16KB per hyperthread. This means that it's vital to structure a renderer in a way such that the cache is efficiently used.
