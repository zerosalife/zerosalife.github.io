---
layout: post
title: "Create a Dictionary with multiple keys in Unity C#"
date: 2015-01-31 11:03:42 -0600
comments: true
categories:
-   C#
-   Unity
-   Unity3d
-   Unity2d
---

I want to create a lookup table for comparing a player choice and an enemy choice.  Each pair of choices can lead to a variety of outcomes.  So, in order to map the relationship between choice pair and outcome, I've decided to use a Dictionary with choice pairs as keys and outcomes as values.

To me, the obvious way to do this is by using [tuples](http://en.wikipedia.org/wiki/Tuple) to encode the choice pairs.  I've already enumerated the choices so it's simple enough to pair them off in tuples for use as keys for the Dictionary.  This approach worked, however, I ran into a couple of problems along the way.

<!--more-->

## Unity's C# doesn't have Tuples

Unity's [Mono framework](http://en.wikipedia.org/wiki/Mono_%2528software%2529) includes a C# compiler, runtime, and lots of libraries.  The version of Mono included with version `4.6.1f1` of Unity is `2.6.5 (tarball)`.  Mono recreates some of the features of .NET, but apparently not a `Tuple` type.  The `Tuple` type got added to .NET in version `4.0`.  Looks like Mono version `2.8` may support it, but I'll have to wait for the folks at Unity to update Mono.

I checked the version of Mono using the following code:

``` csharp Check Unity's version of Mono
using System;
using System.Reflection;

Type type = Type.GetType("Mono.Runtime");
if (type != null) {
    MethodInfo displayName = type.GetMethod("GetDisplayName",
                                            BindingFlags.NonPublic | BindingFlags.Static);
    if (displayName != null)
      Debug.Log(displayName.Invoke(null, null));
 }
```

Since Mono `2.8` was released 5 years ago, it seems like Unity is in no rush to update their Mono version.  So it looks like I'll have to roll my own tuple class.

## Implementing a Pairs class

Since I'm only concerned with pairs of choices, I decided to implement the simplest possible solution.  I followed the implementation of a `Pair` class from [this Stack Overflow question regarding encoding multiple values in Dictionaries](http://stackoverflow.com/questions/569903/multi-value-dictionary).  The trick is that the tuple implemented here can be used to encode keys as well.

The critically important part of the `Pair` class is that it inherits from `IEquatable` and implements methods for determining equality and hashing.  The fundamental thing a Dictionary needs is to test whether keys are equal in order to store or retrieve the correct values and it typically does so by hashing the key.

I won't bother reproducing the code for the `Pair` class here.  You can [check it out for yourself](http://stackoverflow.com/a/569920).

## How I wish I could use it

Once I implemented the `Pair` class in its own file `Pair.cs`, I had to import it in the file where I wanted to create the Dictionary.  Also note that I'm [using literal syntax to construct the Dictionary when I define it](http://msdn.microsoft.com/en-us/library/bb531208.aspx).  And yes, unlike most uses of curly braces in C#, that `;` is necessary to end the line after the literal.

``` csharp
using Pair;

// Not shown: lots of enums...

Dictionary<Pair<Choice, Choice>, Outcome> lookup = new Dictionary<Pair<Choice, Choice>, Outcome> {
  {Pair(Choice.ChoiceOne, Choice.ChoiceOne), Outcome.Win},
  {Pair(Choice.ChoiceOne, Choice.ChoiceTwo), Outcome.Lose},
};

Outcome outcome = lookup[Pair(ChoiceOne, ChoiceOne)];

// Compiler throws an error
```

But alas, I run into this error: ``Using the generic type `Pair<TFirst,TSecond>' requires `2' type argument(s)``.  I can't seem to find any documentation detailing what I'm doing wrong.  Maybe it's just a problem with Unity's version of Mono .NET runtime.

## The workaround: A Dictionary of Dictionaries

I've found a workaround.  It is, in my humble opinion, way less elegant, but it gets the job done.

``` csharp
// Not shown: lots of enums...

Dictionary<Choice, Dictionary<Choice, Outcome>> lookup = new Dictionary<Choice, Outcome> {
  {Choice.ChoiceOne, new Dictionary<Choice, Outcome> {
      {Choice.ChoiceOne, Outcome.Win},
      {Choice.ChoiceTwo, Outcome.Lose}
    }},
  {Choice.ChoiceTwo, new Dictionary<Choice, Outcome> {
      {Choice.ChoiceOne, Outcome.Lose},
      {Choice.ChoiceTwo, Outcome.Win}
    }}};

Outcome outcome = lookup[Choice.ChoiceOne][Choice.ChoiceOne];

// Will return Outcome.Win
```

## Conclusion

I find the tuple key code way more readable than the Dictionary of Dictionaries code.  You can imagine how the legibility of the Dictionary of Dictionaries approach decreases with additional keys but the tuple key code legibility remains the same no matter how many keys you add.  This is probably a moot point for using two keys, as I have in this example, but I hope you can appreciate why I think the tuple approach is more elegant.

If you have any insight into how to solve the ``Using the generic type `Pair<TFirst,TSecond>' requires `2' type argument(s)`` error I encountered using the `Pair` class, please let me know in the comments below or on [twitter](http://twitter.com/zerosalife).
