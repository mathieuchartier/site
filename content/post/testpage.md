---
title: "Rasterization basic"
date: 2022-01-30T21:16:10-05:00
# draft: true
---


# Scan line VS half-space

Scan line goes from the top of the triangle and follows the edges until the bottom vertex is reached.

Half-space tests each pixel against the triangle edge planes. If a pixel is inside all 3 planes, it is covered by the triangle.