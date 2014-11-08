---
layout: post
title: "INSceptahdeckWU"
date: 2014-11-08 08:28:39 -0600
comments: true
categories:
-   design
-   procedural generation
-   clojure
-   procjam
-   7dfps
---

## #procjam updates

[#procjam](https://twitter.com/search?q%3Dprocjam) is upon us.  The conference is on and popping, streaming at <http://www.twitch.tv/procjam>.  I'll try to precede my #procjam posts with a little update on some of the cool things I've seen that need pointing out during the jam itself.

[@GalaxyKate](https://twitter.com/GalaxyKate) will be streaming [some tutorials](http://vimeo.com/111272682) today, following the conference.

[@sudorossy](https://twitter.com/SudoRossy) is currently streaming some development and modeling at <http://www.twitch.tv/sudorossy>.  I imagine that sudorossy will continue this throughout the jam.

The [#7dfps](https://twitter.com/search?q%3D7dfps) jam is also going on this week.  So, I've decided to release my third person procedural tweeter.  Or maybe it's a fourth person tweeter, third person once removed.

## Fourth-person tweets

I'm at it again, [making a twitter bot](http://zerosalife.github.io/blog/2014/04/19/styx-ebooks/) like [@styx_ebooks](https://twitter.com/styx_ebooks).  Only this time it's in a completely different language and it's got a completely different corpus.  Corpus is a Latin way of saying text, in case you forgot.

<!--more-->

## Making the tweets

The basic algorithm works like this.

The bot creates a huge textfile containing lyrics from Wu Tang Clan songs.  I trim away a lot of the information about verses and choruses, but I keep the punctuation because I like the sense of rhythm it creates.

Based on the relationship between the words in this corpus file, the bot builds a [markov process](http://en.wikipedia.org/wiki/Markov_chain) to generate the text of the tweets.  To do so, the bot generates a transition matrix using [Janiczek's Clojure markov library](https://github.com/Janiczek/markov).  It then takes random walks through that matrix to produce a string of text with a similar relationship between words to the input lyrics corpus.

## Making it a command line app

This is the first time I've tried to make a command line application in Twitter.  Luckily there are some good tools out there.

I wondered how to deal with multiple options and inputs, and the good news is: it's just as easy as you'd think.  You simply add conditionals to deal with the possible behaviors of your program.  The magic of `parse-opts` handles the rest.  Options with long names automatically become keys to the option dictionary, and if you've marked them as a `:flag` you can depend on the truth-value to control the flow of your program.

You may think it's odd that I'm using options instead of actions as in the `cli` example, but hey.  It's my program.  Your program can work the way you want it too.  I'm going to make sure to document it so you can use the Rebel INS or build a twitter bot based on this code.

To build the app, I use `lein bin` from the command line.

I'm interested in [daemonizing](http://www.rkn.io/2014/02/06/clojure-cookbook-daemons/) the application.  That is to say, I'm interested in turning it into a persistent process that runs in the background on my computer.  But for now, I've set up a simple [cron](http://en.wikipedia.org/wiki/Cron) script to tweet every few hours.

## Logging

When I do tweets from the command line there's some dark magic going on that I don't understand.  Anyway it seems to invoke the `Log4j`, so I [set that up according to this blog post](http://www.bahmanm.com/blogs/how-to-add-logging-to-a-clojure-project).

## Markov chain text generation

One of the quirks of the markov package I used is that it stops generating 'random walks' when it reaches states that it has not been trained on.  As you can imagine when using imagery-rich, neologism-laden rap music, there are many words that occur once, even in a very large corpus.  Being unique is kind of a goal of the form, a fact reflected in [at least one alias](http://en.wikipedia.org/wiki/Ol%2527_Dirty_Bastard).

In order to make more realistic texts, it's common to increase the order of the transition matrix.  That is to say, to determine the probability for a following word from the prior two or more words.  However, given my idiosyncratic corpus, this leads the 'random walk' algorithm to halt, giving me too few words in my output.

Interestingly, in this case, dialing back the order tends to lead to more rhyming and a few recognizable couplets, which I find kinda nice.

## Setting up the twitter account

I ran into a problem getting an app set up for the bot's twitter account.  I am merely one person, and thus have need for merely one cell phone.  Since twitter requires a unique mobile number for authenticating apps, I was out of luck.  That is, until I found this [blog post showing how to use the same app on multiple bot clients](http://dghubble.com/blog/posts/twitter-app-write-access-and-bots/).

Faithful readers may remember my wildly popular, and yet still somehow deeply underrated, [Bangsian](http://en.wikipedia.org/wiki/Bangsian_fantasy) fantasy bot, [@styx_ebooks](https://twitter.com/styx_ebooks).  Using `twurl` I was able to grant access to the [@styx_ebooks](https://twitter.com/styx_ebooks) app credentials for the new bot.

## Moving on

You can find the source code over on [github.](http://github.com/zerosalife/insceptahdeckwu)

Here's one of my favorite tweets so far:

{% tweet https://twitter.com/insceptahdeckwu/status/529619098758823937 %}

From here the sky's the limit.  I could try analyzing the generated text to try to build lines or stanzas.  I could try to reorder words to reflect the syntax present from the transcription.  I could try to represent individual emcees with unique corpora.
