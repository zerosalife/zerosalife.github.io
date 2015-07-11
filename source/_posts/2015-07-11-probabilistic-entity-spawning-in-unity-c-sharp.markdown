---
layout: post
title: "Probabilistic entity spawning in Unity C#"
date: 2015-07-11 17:03:55 -0500
comments: true
categories:
-   C#
-   Unity
-   Unity3d
-   tools
-   algorithms
---
[Last week](http://zerosalife.github.io/blog/2015/07/04/probabilistic-entity-spawning-in-unity-javascript/) I showed how to do probabilistic entity spawning in Unity JS.  This week I'll port that code over to C#.  You can find examples of both the C# and JavaScript versions of the code in a [repository on github](https://github.com/zerosalife/ProbEntitySpawnExample).  Since I've already explained the Algorithm I will focus mainly on the differences in the code.

There isn't syntactic sugar for Dictionary assignment in C# :( This required moving the assignment for the `areas` Dictionary into the `Start` function.  It's a move that enforces best practices, strictly speaking, but risks confusion about the content of the `areas` Dictionary at runtime.  If you'd like to read up on Dictionaries in C#, I found [this resource](https://msdn.microsoft.com/en-us/library/fkbw11z0.aspx) helpful.

The `foreach` command requires a type. This is a case where a stricter language will save confusion in the long run.

Lists can be created from specific arrays of the List's type, but not from some arbitrary array, as in JavaScript.  Again, this is a feature of a stricter language that causes some extra work up-front, but will make things more clear in the long run.

For an in-depth tour of the algorithm for spawning entities, check out [last week's post](http://zerosalife.github.io/blog/2015/07/04/probabilistic-entity-spawning-in-unity-javascript/) and the [example repository on github](https://github.com/zerosalife/ProbEntitySpawnExample).
