---
layout: post
title: "Shovel Knight's Old-school Tricks"
date: 2017-11-18 10:43:14 -0500
comments: true
categories:
-   design
-   mechanics
---
Here's a collection of relatively disorganized notes looking at [Shovel Knight's](http://yachtclubgames.com/shovel-knight/) design.

<!--more-->

Great article about parallax scrolling and plenty of other stuff from Shovel Knight: <http://gamasutra.com/blogs/DavidDAngelo/20140625/219383/Breaking_the_NES_for_Shovel_Knight.php>

Even some indies are getting into the spirit: <https://twitter.com/NoelFB/status/487185061972680705/photo/1>

Interview with the Shovel Knight creators Yacht Club Games: <https://www.nintendoworldreport.com/connectivity/38203/episode-144-ive-seen-some-badass-canes>.  The interview starts about 28 minutes into the podcast.

## Resolution

Shovel Knight runs on displays meant to run 1080p down to pocket-sized 3DS screens.  The fine article mentions that scaling Shovel Knight's NES-style graphics up to 1080p results in virtual pixels of about 4.5 x 4.5 1080p pixels.  It also mentions that the effective resolution
they shoot for is 400 x 240, resulting in an aspect ratio of 5:3.

According to the fine article and [wikipedia](http://en.wikipedia.org/wiki/Nintendo_Entertainment_System_technical_specifications), that's pretty close to a stretched out version of the original NES resolution.

For no other purpose than my own reference here, the DS' resolution is 256 x 192, according to [this article](http://www.usgamer.net/articles/final-fantasy-iii-pc-port).  The Gameboy is 160 x 144 according to [#gbajam](http://jams.gamejolt.io/gbjam3).  Typical NES background tiles are 16 x 16 pixels, foreground sprites are either 8 x 8 or 8 x 16 (Sources: [<http://wayofthepixel.net/index.php?topic=10784.5;wap2>](http://wayofthepixel.net/index.php?topic%3D10784.5%3Bwap2); <http://en.wikipedia.org/wiki/Nintendo_Entertainment_System_technical_specifications>).  For reference, Link's sprite in Legend of Zelda, an NES game, is 16 x 16, Link's sprite in Link's Awakening, a gameboy game, is 16 x 16, and Link's sprite in A Link to the Past, an SNES game, is 32 x 32.

<http://www.fortressofdoors.com/the-quest-to-upscale-pixel-art/>

And [NeoGeo](http://en.wikipedia.org/wiki/Neo_Geo_(system)) is:

> Display resolution: 320×224 (many games only used the centermost 304 pixels)
>
> Color palette: 65,536 (16-bit) (Not RGB565, but RGB666, where the lowest bit of each channel is shared with one bit)
>
> Maximum colors on screen: 4,096 (12-bit)
>
> Maximum sprites on screen: 380
>
> Minimum sprite size: 1×2
>
> Maximum sprite size: 16×512
>
> Maximum sprites per scanline: 96
>
> Simultaneous scroll planes: 3
>
> Aspect ratio: 4:3

And LDTV is: <http://en.wikipedia.org/wiki/Low-definition_television#References>

More modern resolutions considered: <http://gamedevelopment.tutsplus.com/articles/quick-tip-what-is-the-best-screen-resolution-for-your-game--gamedev-14723>

PS1: 320 pixel wide resolution.  SOTN: 356 pixels wide, tiling pattern consists of 16x16 blocks tiling with 16 colors each.

So the Shovel Knight screen is 25 x 15 tiles.

I find choosing an aesthetically pleasing aspect ratio to be a crucial design decision; one that I often approach on a trial and error basis.  Knowing what others have--in my humble opinion successfully--chosen gives a nice starting point *a priori* for projects with similar scope.

Mighty Gunvolt: <http://2-dimensions.com/2014/08/20/mighty-gunvolt-fine/>

Axiom Verge: 480x270

Mario Maker levels: 12 screens long by 2 screens tall, the longest
level was 512 blocks.

Vita is 960x544

## One comment on designer-player interaction through design

According to [this article](http://www.usgamer.net/articles/inside-shovel-knights-launch) by Chris Holt, the Shovel Knight designers were realtively wishy washy about including the fishing pole.  For the record, I like the addition of yet another superfluous minigame.  And it's useful for fishing up money bags left in pits when you die, so there.

The use of sparkles to mark pits containing potential fishing spoils illustrates a clever bit of design and interaction with the player through design.  You, the player, will notice that the pit in the fish-themed level has the sparkles.  So, naturally, you're very likely to fish there.  Bada-bing bada-boom: fish spoils.  The designers have communicated what the sparkles in the pits mean without having to resort to lame exposition from a tutorial or a helper character.

The great games of the NES-era that Shovel Knight emulates were littered with these kinds of ingenious communicative design patterns.  Here's [an interview with Shigeru Miyamoto](http://iwataasks.nintendo.com/interviews/#/wii/nsmb/0/3) talking about the deliberate design behind communicating the purpose of the iconic mushroom power-up in Super Mario Bros.

## Another fine example of introducing new mechanic in Shovel Knight.

In Treasure Knight's level you come across rocket platforms that fly horizontally when you activate a lever by hitting it with your shovel.  For my play-through this was the first time I encountered these platforms.

Since they are your means of conveyance to avoid spikes below, the devs could have been mischievous about it. As your intrepid game design blogger is well versed in virtual button pressing, my first reaction is to hop on the platform and press boot-ton--viciously strike the lever with the shovel. Ah, but doing so leads to a spikey death for those with slow reaction times--your intrepid blogger, yeah, yeah.

The second time through YIB, meaning me, and likely you, meaning you, would be more wary; carefully timing the necessary jump to avoid the spikes. The devs, in their wise and studied ways, saw fit to embed a dig-able reward nugget in the wall. It's lodged in such a way that when you knock it loose it lands just so, so when you shovel it to dislodge the pecuniary treats within, you also hit the lever, activating te rocket platform. Now you know to look ahead and carefully time your jump. No harm no foul. No wordy tutorial, telling you, "Hey, listen. This platform shoots off when you hit the lever."

You learned the new mechanic, and thus the behavior necessary to interact with it, through previously ingrained behavior beaten into your head with a thousand gem pickups.  It's devilishly clever.

## Shovel Knight's toolset

### Physics

Box2D

### Level Editor

Tiled Map Editor

### Pixel Editor

Pro Motion

### Audio Engine

FMOD Sound System

### Rendering

Angle

### Rendering and Input

SDL
