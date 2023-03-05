---
title: "Fast Software Rasterization: Basics"
date: 2023-02-21T21:16:10-05:00
draft: false
---

# Scanline rasterization 

Historically, rasterization was performed using the scan line approach. This approach traverses from the top of the triangle to the bottom of the triangle one scanline at a time.

This has the advantage of simplicity but has limited parallelization potential. This was a great approach for rasterizers such as the Quake one, since that was targeted to single core CPUs.

The main disadvantage comes with parallelization. Dividing the work of triangle would typically be done by assigning different scanlines to each core. This causes each triangle to be cached on multiple cores and has scaling issues with high thread counts.

# Half space rasterization

Half-space tests each pixel against the triangle edge planes. If a pixel is inside all 3 planes, it is covered by the triangle.

This is commonly parallelized by using tile rasterization. Each thread processes all of the pixels in a given tile. This avoids the issue where multiple threads are accessing the same pixels and reduces how many threads will access the same triangle.

# Starting our journey

Let's start our journey with a simple single-threaded half space renderer.

For each triangle: Test all of the pixels in the bounding box of the triangle and shade accordingly.

- Check Z depth vs zbuffer
- Shade if the test passes

Performance? Work in progress

# Making it tile based
Before we can parallelize anything, we need to make the rasterization tile based at least. The tiling can be done in a single thread but the actual shading will be parallelized.

For the naive implementation:
- Transform and shade the vertices.
- Assign each triangle to the tiles they cover.

Phase 2:
- Parallel workers process the tiles.

# Parallelizing the tiling
Given a list of triangles, we want to partition the triangle processing and the pixel processing.

This is typically done by a "sort middle" architecture.

- Process triangles in parallel
- Sort the processed triangle
- Process the tiles

# Actually checking that the triangle intersects the tiles

# Vectorized triangle processing

# Reducing overdraw with coverage clipping
Ideally, each pixel would get rasterized only once. Assuming that alpha is disabled, 
The main idea here is that we can generate an array of coverage masks for each 8x8 block.

```c
void main() {
	int x = 2;
}
```