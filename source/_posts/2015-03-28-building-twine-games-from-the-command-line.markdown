---
layout: post
title: "Building Twine games from the command line"
date: 2015-03-28 10:20:35 -0500
comments: true
categories:
-   Twine
-   Unity3d
-   tools
---
I got it in my craw to write a short [Twine](http://twinery.org/) game a while back.  I wanted to familiarize myself with the language.  And writing a short game in Twine seemed to be lower hanging fruit than trying to implement my own text adventure framework for Unity or some other game engine.

<!--more-->

## Why not Unity?

That being said, there are other text adventure frameworks available in the Unity App Store and there's a very intriguing Twine parser for Unity called [Yarn](http://www.platoevolved.com/blog/unity-plugins/#!/~/product/category%3D2743024&id%3D35627540).

Yarn seems well suited to writing Bioware- and Black Isle-style dialogues, where individual characters' dialogues are stored in separate Twine files with scripts to load them at runtime.  It doesn't seem like it does anything to solve the woes of writing a larger (than one dialog tree) game in the usual Twine GUI.

There's too much to be learned by implementing things available on the Unity App Store for me to pass that up in favor of saving time.  It's true that my time is the most valuable asset I have, but it's also very likely that I'll spend just as much time trying to figure out or modify a Unity plugin from the App Store as I would trying to implement something similar on my own.  That being said, in this case for what I wanted to do, Twine was the path of least resistance.

## Why the command line?

I live in my text editor.  So, having to write in the Twine GUI tool's rudimentary text editor isn't really my bag.  I've trained my muscle memory to use these short cuts without thinking.  In fact, I don't even bother to backspace to correct typos, I use the keyboard shortcut in my editor to automatically step through the suggested spelling corrections for the last word.  I'm entrenched.

Also, dealing with the visual clutter of the Twine GUI drives me nuts.  If I want 30 links from a single Twine Passage, I don't want to have to do that manually, and I certainly don't want to try to organize it so it's visually appealing.  There're algorithms for that visualizing stuff, and algorithms are better at it (than I am).

## Getting started

The first step is to [install `twee`](https://github.com/tweecode/twee) the command line tool used to compile Twine files.

Then *all* you have to do is write your story in the proper [Twine file format](https://github.com/tweecode/TwineQuest/wiki/Twee-file-format).  This is the hardest part, not because the syntax is complicated, but because you've actually got to come up with an interesting and interactive story!

## Compiling your twine files

`Twee` will output files to HTML formatted in the usual Twine style.  It gets tedious to type commands over and over again, so I automate building the HTML with a Makefile.

```make Makefile
story.html : *.tw tweefiles/*.tw
        ~/twee/twee -t sugarcane $^ > $@
        open story.html

json: *.tw tweefiles/*.tw
        ~/twee/twee -t json $^ > story.json

clean:
        rm -f story.html

.PHONY: json
```

Placing this Makefile in the root of your twine directory allows you to compile the HTML file by the commands `make clean; make`.  You can read more about the Makefile syntax in the [GNU make manual](http://www.gnu.org/software/make/manual/make.html#Rule-Syntax).  The Makefile looks for Twine file format ending in `.tw`, either in the root directory or a directory for `tweefiles/`.

You can also compile to the JSON format by using `make json`.

## Getting some of the newer Twine features to work

I [couldn't get some of the newer Twine features to work](https://github.com/tweecode/twee/issues/12) when I compiled the twee code from the command line.  I think this stems from the twee command line tool failing to parse some of the newer features implemented in the Twine GUI.

In order to get some of the newer features to work, use the `Makefile` to compile the twee code, then import the resulting `.html` file in the Twine GUI.  Finally export HTML from the Twine GUI.

That being said, it was still nice to rapidly iterate through versions of a story without having to get bogged down in the Twine GUI.  I could write Twine code organized in files in a logical arrangement, then compile them into a single HTML file for testing and release.  Let me know if you have suggestions that would improve this Twine workflow or if you take a different approach.
