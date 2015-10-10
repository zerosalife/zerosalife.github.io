---
layout: post
title: "Symbolic Links to Share Scripts Across Unity Projects"
date: 2015-10-10 13:27:14 -0500
comments: true
categories:
-   tools
-   Unity
---

I like to develop utility scripts in a common project where I can implement unit tests without cluttering up my game projects with [UnityTestTools](https://www.assetstore.unity3d.com/en/#!/content/13802) and duplicated test scripts.  If you're not sure what unit tests are, check out [this post I wrote about them](http://zerosalife.github.io/blog/2015/10/03/unit-testing-in-unity/).

To share code between projects I use [symlinks](https://en.wikipedia.org/wiki/Symbolic_link) to link the files from my utility project to individual games.

<!--more-->

I'm doing development on Mac OS X.  Other platforms may use different commands to create symbolic links.


    ln -s [source file] [destination file]


This command creates a symbolic link to the `[source file]` at the `[destination file]`.

That way, my I know my games will always use the up-to-date code.

## git Gotcha

One caveat is that the symlinked files show up in git version control as a blob of the filepath text instead of the actual code of the file.  This means that the symlinked files will not be tracked in the destination project's version control history.

That's okay with me, because I plan on developing the symlinked files in a separate parallel test project with all of their unit tests, etc.
