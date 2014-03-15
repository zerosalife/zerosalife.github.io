---
layout: post
title: "Cut it all right in two: bisect to find bugs"
date: 2014-03-08 10:25:02 -0600
comments: true
categories:
- algorithm
- tools
---

Imagine there's a lion in a desert.  You need to cage the lion or you
will be eaten.  In this example the desert is your code and the lion
is a bug that you're having a hard time pinning down.

There are many ways to trap a lion.  Here's one.

Build a fence dividing the desert in half going North to South.
Assuming the lion is not in the South section, divide the North
section in half with a fence going East to West.  Repeat the process
until your fence is arbitrarily small and has become a cage trapping
the lion.

But how does this relate to code?

Say you have a relatively large file that executes fine, but
introduces a bug into your larger system.  You suspect that something
has gone wrong with the large file, but you're not getting an error
implicating a specific line.

Cut it all right in two.

Comment out half the code in your large file and try to reproduce the
bug.  If you reproduce the bug, repeat the process as necessary until
you isolate the line producing the problem.

I learned about this approach for bugsleuthing from the [bot in #emacs on freenode](https://gist.github.com/stardiviner/8109774#file-temp-txt-L26).  It's particularly useful for tracking down bugs in large configuration files.  There's a list of humorous lion-trapping algorithm examples [here](http://faculty.smu.edu/yzhou/humor/lion.htm).
