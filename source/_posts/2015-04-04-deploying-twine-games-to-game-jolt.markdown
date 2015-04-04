---
layout: post
title: "Deploying Twine games to Game Jolt"
date: 2015-04-04 13:57:39 -0500
comments: true
categories:
-   adventurejam
---
The [#adventurejam](http://jams.gamejolt.io/adventurejam) started last night.  It lasts two weeks, until April 17.  I'll be covering my participation on here the blog under the [adventurejam](http://zerosalife.github.io/blog/categories/adventurejam/) tag.

Today, I'm going to deploy small prototype Twine game to [Game Jolt](http://gamejolt.com).  I made this game a while back.  It's a complete prototype, but it's still got some display flaws.  I'm putting it out there in all of its buggy glory.  The game served its purpose of familiarizing me with some of the ins and outs of Twine, as well as the build process I [described last week](http://zerosalife.github.io/blog/2015/03/28/building-twine-games-from-the-command-line/).

## *The Age of the Flying Boat*

I made a small prototype game based off of [Hayao Miyazaki](http://en.wikipedia.org/wiki/Hayao_Miyazaki)'s comic that was turned into the movie *[Porco Rosso](http://www.imdb.com/title/tt0104652/)*.  You must figure out how to fuel-up and start your airplane to respond to a desperate call for help.

You can play it [here on Game Jolt](http://gamejolt.com/games/adventure/the-age-of-the-flying-boat/58040/).

<!--more-->

## Deploying a Twine game to Game Jolt

Here's what it took for me to deploy my first game on Game Jolt.

### Play by the rules

First, I had to agree to the rules.

### Title, links, and copy

Next up, I had to enter some information about my game.

### Thumbnail and maturity rating

Then, I had a couple of necessary things to do: uploading a thumbnail and setting a surprisingly detailed maturity rating for my game.  There were several optional steps that I skipped for this game prototype.

There were a lot of headaches with the "thumbnail".  It must be 16:9 and it must be at least 588 pixels tall.  Sounds like a full screenshot, to me.  But, this constraint is necessary because Game Jolt uses a bunch of different dimensions to display the thumbnail on the website.

### Game Distribution

For my next trick, I uploaded a Game Distribution of the HTML persuasion.  I needed to upload a zip file containing my twine-generated `index.html`.

### Unhiding so people can play your game

Now, here's the critical part.  Pay attention.

There were two (2) final steps to make my game available on the site:

- First, I had to unhide my game's profile when I was satisfied with information I entered.

- Second, and most importantly, I had to specifically unhide the `html` we uploaded as a Game Distribution in the Distributions tab.

## Whew!

If you've followed along this far, we did it!  We uploaded a game to Game Jolt.  It's a surprisingly detailed process, but that amount of detail gives you a lot of tools make your game's presentation shine.

Go check out *[The Age of the Flying Boat](http://gamejolt.com/games/adventure/the-age-of-the-flying-boat/58040/)* and let me know what you think in the comments or on [twitter](http://twitter.com/zerosalife).
