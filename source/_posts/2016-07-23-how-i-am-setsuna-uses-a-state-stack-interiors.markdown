---
layout: post
title: "How I am Setsuna uses a State Stack: Interiors"
date: 2016-07-23 10:01:13 -0500
comments: true
categories:
- design
- tools
---

About [a quarter of the way through this playthrough](https://youtu.be/GUwmNnMXd4A?t%3D5m36s) of *I am Setsuna* at E3, the player enters a house.

<!--more-->

## Interiors

The player enters a house, which triggers a special case of the Map state, the Interior state to be pushed onto the stack.

    | Interior ←push |
    | Map            |

It's hard to tell how the interior state differs from the town map and the forest map from the beginning of the video.  In fact, I think that you could cover similar features with a simple Map state that knows where triggers (for, for example, Dialog or Treasure) and exits are placed.

So, it's likely ethat the I am Setsuna devs are using a gneeralized Map state to cover tehse cases

This leads us to the final state I want to explore, a state to capture the Overworld.
