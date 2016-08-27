---
layout: post
title: "Why does Pokemon GO use passive voice?"
date: 2016-08-27 09:21:50 -0500
comments: true
categories:
- design
---

A colleague of mine wondered why [Pokemon GO](http://www.pokemon.com/us/pokemon-video-games/pokemon-go/) uses the passive voice when reporting,

> Pikachu was caught!

The simple reason is nostalgia--that's the phrasing from the original [Generation 1 Pokemon games](http://bulbapedia.bulbagarden.net/wiki/Generation_I).

Was there a limitation inherent in the medium at the time that required using the passive voice?  Below I'll dig into the [disassembled Pokemon Red source code](https://github.com/pret/pokered) to answer the question of why Pokemon Go uses passive voice.

<!--more-->

[This code](https://github.com/pret/pokered/blob/master/text.asm#L2793-L2798) shows the text that is displayed when the player successfully uses a pokeball to capture a pokemon.  I'll break it down for you, using the [text macros](https://github.com/pret/pokered/blob/master/macros.asm#L221) for reference.

The `text` macro starts writing text, printing out the string `"All right!"`.  Then the `line` macro prints a special character `"@"` at the beginning of the bottom line in the text box.  The `TX_RAM` macro looks up a stored chunk of text based on the address stored in `wEnemyMonNick`, which points at the current enemy pokemon's name, and prints the name in the text box.  Then another `text` macro starts writing `" was"` following the enemy pokemon's name. And finally, the `cont` macro scrolls text to the next line, printing `"caught!@@"`.

I couldn't find a good reference, but I'm pretty sure that the `@` character is acting as a [newline character](https://en.wikipedia.org/wiki/Newline), more commonly `\n` these days.

The final text looks something like:

    All right!\n
    Pikachu was
    caught!!\n
    \n

Now you've seen the implementation of the text for catching pokemon.  Is there a technical reason for choosing to use passive voice?

Maybe `TX_RAM` can only be used with a `text` macro.  Based on a cursory glance over the [text](https://github.com/pret/pokered/blob/master/text.asm), I'd say that this is likely to be the case.  But that doesn't prevent the developers from choosing to say

    You caught
    Pikachu!

Could the developers have used a more active voice?  Yes!  Refer to this [link battle text](https://github.com/pret/pokered/blob/master/text.asm#L1130) for an example of `TX_RAM` beginning a dialogue.

The word "you" occurs [171 times in the Pokemon red codebase](https://github.com/pret/pokered/search?utf8%3D%25E2%259C%2593&q%3Dyou), without controlling for contents of text strings vs method and variable names.

There seems to be a general tendency to use "you" to refer to things that the player does, such as connecting the link cable between two Gameboys to trade pokemon, rather than the player character's actions in the game.  So that could have been a good reason to choose the passive voice.  Also, there could be some reasoning behind matching the original Japanese text that I'm missing here.
