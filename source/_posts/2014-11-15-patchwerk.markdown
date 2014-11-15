---
layout: post
title: "Patchwerk"
date: 2014-11-15 08:22:18 -0500
comments: true
categories:
-   procjam
-   Clojure
-   Quil
---
## Procjam updates

I've spent the week at a couple of major international conferences sponsored to some degree by old dead-tree journals.  I was struck, following last weekends' [#procjam](https://twitter.com/search?q%3Dprocjam) [talks](http://www.twitch.tv/procjam), by the lack of openness.  None of these talks are going to be made freely available.  Photography and recording is actively discouraged.  The official conference hashtags, when provided, were silent or only used by those in attendance.  While this exclusivity may generate profits for the aforementioned dead-tree journals and give a leg up to those fortunate enough to be able to attend these conferences, I find it ethically reprehensible in the 21st century, given the tools that we have available.

I'd like to once again thank [@mtrc](https://twitter.com/mtrc) for hosting *and streaming* \#procjam.  Because conference was made freely available, I was able to interact with the attendees in a way that would be impossible if I was trying to divine through twitter what was going on behind closed doors.  I think this kind of openness can only generate more interest and ideas, regardless of the field of study.

## Patchwerk

A [Quil](https://github.com/quil/quil) sketch designed to generate patterns for quilts.  The code is [available on github](https://github.com/zerosalife/patchwerk).

[{% img center https://raw.githubusercontent.com/zerosalife/patchwerk/master/patchwerk-example.png %}](https://github.com/zerosalife/patchwerk/blob/master/patchwerk-example.png)

<!--more-->

## What is Quil?

Quil is a port of [Processing](http://processing.org) to [Clojure](http://clojure.org/).

## Motivation

When I came across some interesting pictures of quilts, I was struck by the regularity of the shapes used to construct them.  A quilt is simply a grid of squares containing some pattern of simple shapes.  I thought it would be interesting to have an algorithm generate the grid (what I guess quilters probably call a pattern), so I set out to build some functions in Quil to draw a few simple shapes that I identified in the squares of the quilts and then to randomly draw them in a grid.

## How to model a quilt

Using the fundamental assumption I already stated: a quilt is just a grid of squares.  My algorithm defines a `grid-width` and `grid-height` along with a `square-size` in pixels that determine the overall size of the quilt pattern to generate.  This allows you to generate an arbitrary number of quilt squares of a certain size.

Each square contains a subgrid with a defined `sub-grid-width` and `sub-grid-height`.  In retrospect, it would probably be better to define one parameter because if the dimensions are not square, everything will be screwed up.

I then define several basic drawing functions to fill the squares of the grid.  The procedural generation's `draw` algorithm knows about each of the drawing functions, called `pattern-funcs`, and picks one of the `patterns` to draw each square of the grid.

## The drawing functions

The primary elements of the quilt squares that I wanted to replicate were large squares, smaller checkers, triangles, and a mixed pattern of small triangles with a square that I called "fish".

The squares (see the square second left from the top right) and the smaller checkers (see quilt square fourth down from the top left) use the same drawing function.  However, they differ in that they utilize different helper functions return the correctly sized vertices and support multiple calls for the smaller checkers.

The triangles (see square in the top right) use a lookup table, `triangle-lookup-table`, to store information about the appropriate "legs" for a triangle with a point in a given corner.  By using a common syntax for the vertices, the `draw-triangle` algorithm can share the vertex lookup algorithm with the square routines.

Then the culmination of my dastardly plan involves marrying a square from the smaller checker function with flanking triangles, based on the subgrid this time instead of the larger grid.  The result is a pattern that looks like a fish to me (see quilt square in the top left).  Because I built the abstract drawing functions, I simply have to take care of the four directional possibilities and let the drawing functions more fundamental handle the work.

## Future plans: toward Patchwerk 1.0.0

The project is in need of a major refactoring session, when I can find the time.  I developed it in a single monolithic Clojure file for ease of testing in the REPL.  It will be easier to maintain and understand if I separate out the distinct functionalities into their own namespaces.  The ones that come to mind are `patchwerk.grid` to handle the generation of the grid, `patchwerk.patterns` to manage the drawing functions, and `patchwerk.util` to house the helper functions.  I'd also like to make it clear which functions use the `quil.core` namespace instead of using `:refer :all`.

There is also [some interesting new functional middleware for Quil](https://github.com/quil/quil/wiki/Functional-mode-(fun-mode)).  It provides a framework for you to separate out the mutable state from your Quil functions so that you avoid side effects and can program pure functions, in Processing's typically imperative syntax.  To get this up and running, I imagine that I will have to represent the pixel grid in the `state` map.

Eventually, and this is beyond the scope of 1.0.0, I'm intrigued by the possibility of [porting this code over to Clojurescript](https://github.com/quil/quil/wiki/ClojureScript) and creating a web-based version of the application.
