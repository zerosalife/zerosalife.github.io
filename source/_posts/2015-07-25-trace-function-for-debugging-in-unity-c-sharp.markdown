---
layout: post
title: "Trace function for debugging in Unity C#"
date: 2015-07-25 09:00:31 -0500
comments: true
categories:
-   Unity
-   Unity3d
-   C#
-   tools
---

Inspired by [a video from the excellent Double Fine Documentary interviews with Massive Chalice artists and developers](https://www.youtube.com/watch?v=btN095elmh4&feature=youtu.be&t=1985), I wanted to come up with a way of conditionally including debug statements in development code, but not in production.  Luckily I wasn't the first person to think of this.

[Dan Puzey](https://twitter.com/danpuzey) [wrote an abstraction layer](http://blog.puzey.net/simple-better-unity-logging/) over Unity's built-in `Debug` library.  The library contains several functions for various types of logging.  The most important piece for me is `VerboseFormat`, which combines string formatting with conditional attributes.  I'll explain a bit more about how these pieces work below.

<!--more-->

## String Formatting

To my surprise, Unity's C# implementation, Mono, doesn't use standard `printf`-like string formatting syntax.  Instead of `%s` or other commonly used formatting variables, C# uses curly braces around numbers to interpolate variables passed in to the `String.Format` call as arguments.

Dan's `VerboseFormat` function wraps `String.Format`, so you can call `VerboseFormat` with C# formatting strings.

``` csharp
using Assets.Phunk.Core

...

Log.VerboseFormat("var1: {0}, var2: {1}", var1, var2);
// => [VERBOSE] var1: [var1], var2: [var2]
```

## Conditional Attributes

Above some of the functions in Dan's code you'll see the following [conditional attributes](https://msdn.microsoft.com/en-us/library/system.diagnostics.conditionalattribute%28v=vs.110%29.aspx):

``` csharp
    [System.Diagnostics.Conditional("DEBUG"), System.Diagnostics.Conditional("UNITY_EDITOR")]
```

These two settings tell the C# compiler to only compile the code, in this case the `Verbose` logging functions, when compiling during development, i.e. `DEBUG` or `UNITY_EDITOR`.  That means all of the `Verbose` logging statements in your code will not be compiled in the production builds of your code.

Cool, huh?  Good thinking, Dan.

## That's it!

It's always great when you think that a tool would be useful and someone else has already implemented it for you.  Go on over and give [Dan's blog](http://puzey.net/) a gander.
