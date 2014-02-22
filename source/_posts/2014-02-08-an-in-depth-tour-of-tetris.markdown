---
layout: post
title: "An in-depth tour of Tetris"
date: 2014-02-08 08:34:35 -0600
comments: true
categories:
- AI
- design
- mechanics
- NES
---
{% img center http://upload.wikimedia.org/wikipedia/en/a/ae/Tetris_NES_play.png %}

-> Image from [wikipedia.org](http://en.wikipedia.org/wiki/Tetris). <-

This week I've spent quite some time reading
[this article](http://meatfighter.com/nintendotetrisai/) on
[MeatFighter.com](http://meatfighter.com/).  The article reverse
engineers the inner-workings of
[NES Tetris](http://en.wikipedia.org/wiki/Tetris#NES).  With superb
visual aids, the author, o\_\_1[^1] , surveys the mechanics and data
structures used to implement Tetris on the NES.  Then o\_\_1 designs
and implements an AI script to play Tetris with super-human speed and
precision.  o\_\_1 even describes how to try it at home, providing
instructions and the necessary Lua scripts to run the AI on your own
copy of Tetris.

I hope to see more articles looking back on classic games with this
tremendous attention to detail.  An older
[article looking at Pac-man AI](http://home.comcast.net/~jpittman2/pacman/pacmandossier.html)
shows similar obsessive depth.  Articles like these help supplement
our appreciation of these games as works of art by documenting the
essential technical complexities underlying these games.  I think
that's a good thing for everyone from hobby developers to professional
developers, as well as designers and fans.

[^1]: I'm referring to the author by the contact email listed on the website.
