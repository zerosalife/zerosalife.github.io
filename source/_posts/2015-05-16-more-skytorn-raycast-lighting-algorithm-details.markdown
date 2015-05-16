---
layout: post
title: "More Skytorn Raycast Lighting Algorithm Details"
date: 2015-05-16 11:10:29 -0500
comments: true
categories:
-   lighting
-   design
-   mechanics
-   algorithms
---
[Last week](http://zerosalife.github.io/blog/2015/05/09/raycast-lighting-in-skytorn/) I covered the lighting algorithm [@NoelFB](https://twitter.com/NoelFB) is implementing for [Skytorn](http://skytorngame.com/).  Noel was nice enough to correct my mistaken assumptions about the inner workings of the lighting algorithm.

Looks like I kind of inverted the polarity of the raycasting with regard to the player and the level geometry.

{% tweet http://twitter.com/NoelFB/status/543586120731074561/ %}

<!--more-->

## The algorithm

The algorithm doesn't raycast in the full 360° circle around player&#x2013;that would be too costly.  Instead, it takes advantage of the fact that the level's ground collision geometry is stored in a grid.

1.  Given the player's location, there is a small list of collision geometry in the 8 or so grid cells surrounding the player.

2.  The lighting algorithm raycasts from the corners of the level geometry to the player, instead of from the player out to the geometry.

3.  Then, to prevent the lighting from looking too triangular, the algorithm adds a few more raycasts out from the player to the geometry in between the other raycasts.

## That's actually all there is to it

The algorithm I originally envisioned was naive and costly.  But, it's nice to hear that I wasn't far off&#x2013;I simply inverted the solution.  It was also nice to learn about a benefit of storing level geometry in a grid that I previously failed to appreciate.

Heaping thanks to [@NoelFB](https://twitter.com/NoelFB/) for helping explain the algorithm, instead of getting bent out of shape about my lame attempt to reverse engineer the inner workings of [Skytorn](http://skytorn-game.com/) from a screenshot.
