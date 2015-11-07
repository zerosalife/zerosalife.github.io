---
layout: post
title: "Seeking artist for ProcJam 2015"
date: 2015-11-07 09:53:17 -0600
comments: true
categories:
-   procjam
-   Clojure
-   ClojureScript
---

[{% img center /images/assets/mvs-screenshot-small.png 800 613 %}](/images/assets/mvs-screenshot-full.png)

[\#ProcJam 2015](https://itch.io/jam/procjam) started yesterday.  I'm working on a mech vehicle generator web app.  You can check it out at [mech-vehicle-sheet.herokuapp.com](https://mech-vehicle-sheet.herokuapp.com/). The prototype layout and generation code is complete.  What I need now is an artist to replace the placekitten pictures I'm currently using.

<!--more-->

## The Roadmap

### Backend and client code

I'm working on setting up the web app, but the underlying generator code is done.  I've made it modular, so we can plug in as many or as few art assets as you like

### Layout

Largely cribbed from old [*Heavy Gear*](https://en.wikipedia.org/wiki/Heavy_Gear) character sheets.  I'm satisfied with it.  But if you have a better design, I'm all ears.

### Images

What I'm looking for are images of mechs in whatever style you choose that can be broken into individual layers composed of:

-   Head
-   Torso
-   Shoulders (left & right)
-   Arms (left & right)
-   Legs

-   Weapons

An example of what I'm thinking of here are the mechs from the *[Front Mission](https://en.wikipedia.org/wiki/Front_Mission)* series of games.  Mechs in that series had sprites that were composed of individual parts that composited together based on the customizations that you made to your mechs.  See this [example from the original *Front Mission* on SNES](http://www.spriters-resource.com/snes/frontmiss/sheet/38202/).

### Image layout

I'll write code (likely CSS) that composites your drawings based on the output of the generator to create custom, procedurally generated pictures to go along with each of the mechs.

## What I need from you

At the most basic level it would be nice to create several "families" of heads, torsos, shoulders, arms, and legs.  Creating cool weapons that map on to hard points, i.e. a shoulder mounted rocket launcher that could mount on the left shoulder, would be icing on the cake.

I'd like to work with an iterative process, if you're cool with that.  If you have rough sketches, pass them along.  They'll help with getting a sense for how to layout the composite images in CSS.  This thing doesn't have to be perfect, we can continually refine it as we go.

Communication and coordination to make sure I have the latest versions of your art assets.

## What I'll be working on

I'll be integrating the generator backend with the frontend, laying out any art assets, and extending the generator as time permits.

## What we'll get

We'll come out of this with a cool little generator to play with, hopefully creating many hilarious mecha.  Who knows, down the road this could lead to more collaboration between the two of us and/or the generator could serve as a component of a larger mecha game.

In any case, you will get equal billing on the generator itself and all blog posts about the generator.  You will retain all rights to the art you create.  Outside of the generator itself, I would only request to use the art assets in screenshots on the blog and twitter.

## Sound good?

Sound good?  Let me know on [twitter](https://twitter.com/zerosalife), I'm happy to communicate over DMs, in the comments below, or via email (my twitter handle at gmail)!
