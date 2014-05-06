---
layout: post
title: "styx_ebooks"
date: 2014-04-19 14:05:03 -0500
comments: true
categories:
-   design
-   mechanics
-   procedural generation
-   game
---
And now for something completely different: a [markov chain text generation](http://en.wikipedia.org/wiki/Markov_chain#Markov_text_generators) twitter bot.  Styx_ebooks tweets random text generated from a corpus of Bangsian fantasy novels.  Its name comes from [John Kendrick Bangs](http://en.wikipedia.org/wiki/John_Kendrick_Bangs)' novel *[A House-boat on the Styx](http://en.wikipedia.org/wiki/A_House-Boat_on_the_Styx)* and the general [twitter ebooks meme](http://knowyourmeme.com/memes/horse_ebooks).

I forked it from an earlier project by [@jiko](https://github.com/jiko), [lovecraft_ebooks](https://github.com/jiko/lovecraft_ebooks).  There were some minor implementation hurdles, mainly related to Twitter's API and oauth.  Reading the [python `twitter` package](https://pypi.python.org/pypi/twitter) `twitter.oauth` docstring set me straight.  You can check out the code in [my fork on github](https://github.com/zerosalife/styx_ebooks).

This sort of text generation algorithm isn't just useful for making annoying twitter bots.  You could alter some of the in-game text or dialog based on a corpus fed into a markov chain text generator. Especially in the case of a Lovecraftian horror game, I can see how this text could serve a thematic purpose in the story.

Say you've got a Lovecraftian horror game in which the player is an investigator who is trying to figure out what is happening to citizens of Innsmouth.  By interacting with NPCs, the player encounters hand written dialog, with occasional markov-generated gibberish thrown in. The amount of gibberish depends on how corrupted the individual denizens of Innsmouth are becoming.  If the player is not clever enough to determine who is corrupt, the player will be killed.  If the player determines the source of the corruption, the player wins.

Along the same line of reasoning, the concept I'm describing here mimics the game [ALZ](http://www.newgrounds.com/portal/view/634905), a touching short, playable in 2 or 3 minutes, which uses glitchy graphics to convey a sense of what it's like to live with Alzheimer's disease to the player.  I came across Dylan Carter's ALZ in a [post on the ANIMAL blog](http://www.animalnewyork.com/2014/making-alz-glitch-fueled-game-alzheimers/).  This approach of literally altering the player's experience of the game world to mimic the subjective experience of characters in the game is ripe for exploration.  I'd love to hear about more examples.

You can check out my bot, [@styx_ebooks](https://twitter.com/styx_ebooks), on twitter, happily tweeting the day away.
