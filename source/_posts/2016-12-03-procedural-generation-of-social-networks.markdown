---
layout: post
title: "Procedural Generation of Social Networks"
date: 2016-12-03 12:21:41 -0500
comments: true
categories:
- procjam
---

I've been thinking about how to run a hexcrawl style campaign in a cyberpunk world.  Mobility is easy, so a spatially distributed procedurally generated map doesn't make much sense.  Characters could easily just look up information on an unfamiliar section of the map on whatever flavor of the internet exists in that world and buy a plane ticket or book a taxi ride to get there.

Transportation is cheap and the Sprawl has largely been explored.  This is not to say that a typical hexcrawl-style campaign couldn't work in a VR hacking setting.  Look no further than *[Uplink](http://www.ambrosiasw.com/games/uplink/)* to see a wonderful example.

In a cyberpunk setting the thing to be explored becomes the web of intrigue among the movers and the shakers in the campaign.  Crosses and double crosses become the shifting landscapes and wandering monster encounters of the political landscape.  See for, example this [blog post at Monsters and Manuals](http://monstersandmanuals.blogspot.com/2011/08/cyberpunk-sandbox.html) and [the organization chart from *The Wire*](https://en.wikipedia.org/wiki/Barksdale_Organization#/media/File:Barksdale2.jpg).

{% img center /images/assets/social-network.svg  %}

<!--more-->

After looking at a few good resources, I took this stab at crafting a social network generator:

## Defining connection types

Based on [this Monsters and Manuals blog post](http://monstersandmanuals.blogspot.com/2011/08/relationship-hexmap.html) I defined links as follows:

-   **Black:** Strong positive link
-   **Orange:** Communication (past or present)
-   **Yellow:** Awareness
-   **Red:** Hostility

## Making the connections

For my initial attempts, I've found that a social network with 8 actors is complex enough to get some interesting relationships.  I make twice as many random connections between the actors as there are actors.  So in this case, we're working with 16 random connections.

This means that some actors could have several connection sand some could have none.  On average there may be 1 or 2 connections between most of the actors in the network.

## Graphing it

I've [used rhizome in the past](http://zerosalife.github.io/blog/2014/04/26/clojure-rhizome-labeled-edge-tutorial/) to graph stuff.  This time around, I wanted more control over the characteristics of the resulting graph, so I went with [tangle](https://github.com/Macroz/tangle).

Tangle lets me change the node shape and edge colors, which is exactly what I needed to represent the types of connections in this social network.

You can see the resulting image above the fold.

## Additional resources

Here are a few additional resources worth noting:

-   <https://emshort.wordpress.com/2016/04/12/beyond-branching-quality-based-and-salience-based-narrative-structures/>
-   <http://maetl.net/talks/narrative-anxiety>
-   <http://maetl.net/notes/storyboard/narrative-graph-models>
