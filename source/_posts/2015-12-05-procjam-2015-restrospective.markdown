---
layout: post
title: "ProcJam 2015 Restrospective"
date: 2015-12-05 13:05:46 -0600
comments: true
categories:
- procjam
- Clojure
- ClojureScript
---

[{% img center /images/assets/mvs-screenshot-post-procjam.png 2108 1942 %}](/images/assets/mvs-screenshot-post-procjam.png)
I made a lot of progress on my mech generator for ProcJam 2015.  It's up on the web at [mech-vehicle-sheet.herokuapp.com](<https://mech-vehicle-sheet.herokuapp.com/>).  The code is available on [github](https://github.com/zerosalife/mech-vehicle-sheet).

<!--more-->

## Clojure and Clojurescript

I used [Clojure](http://clojure.org/) and [ClojureScript](https://github.com/clojure/clojurescript) with [Om/React](https://github.com/omcljs/om) via [Quiescent](https://github.com/levand/quiescent) to make development quick and easy.  Refactorings, which I spent the majority of my time on, were a breeze compared to other languages I've been developing in lately.  While this project doesn't have a fancy UI, choosing React made it straightforward to divide the UI into sensible chunks, which I implemented as components.

## No artist

Didn't find an artist.  Although, starting to look for an artist the day after ProcJam started was inadvisable.  I think not finding an artist is actually a benefit.

Not finding an artist pushed me to come up with the idea of not just choosing and laying out art assets proceedurally but allso generating the art proceduarlly.  I'm thinking of somethign along the lines of what I've seen @strangethink do.

I want to generate symmetric parts for mechs based on the manufacturer.  Same thing for weapons, in the style of [the Borderlands series](<http://borderlands.wikia.com/wiki/Weapons#Weapon_Components>).

You can see the beginnings of a template as part of the latest revisions on [mech-vehicle-sheet.herokuapp.com](<https://mech-vehicle-sheet.herokuapp.com/>).

## Not done yet

Going to keep developing this project in my spare time, possibly for participation in another gamejam or just for fun.  I'll post updates on the blog when I get major features implemented.

My tentative to-do list is:

- Generate images for each mech part
- Add similar generation for the weapons
- Create different art styles based on manufacturer
