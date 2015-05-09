---
layout: post
title: "Raycast Lighting in Skytorn"
date: 2015-05-09 09:21:03 -0500
comments: true
categories:
-   lighting
-   design
-   mechanics
---
[@NoelFB](https://twitter.com/NoelFB/) posted a [screenshot](https://twitter.com/NoelFB/status/543586120731074561/photo/1) showing how dynamic lighting works in [Skytorn](http://skytorn-game.com/).

{% tweet http://twitter.com/NoelFB/status/543586120731074561/ %}

<!--more-->

## The algorithm

From what I can tell, the algorithm looks something like this:

1.  Raycast out for 360° around the light source, starting in a clockwise direction.  If the rays encounter a collidable object, add it to the list of pink lines defining the polygonal shape of the lit area.  If the ray exceeds the distance of the light gradient, clamp the triangle edge defining the pink line at that distance.

2.  For each of the collidable objects encountered, extend a ray past their vertices until it hits another collidable to create the obscured lighting effect visible to down and to the right of the light source.

3.  Finally construct a set of triangles by starting from the closest edge in the list defining the pink lines to form the polygon.

## That's all

That's it for this week.  Let me know if you have any insight into this or other lighting algorithms in the comments or on the tweets.
