---
layout: post
title: "Using  LINQ queries and lambda expressions in Unity C#"
date: 2015-10-17 11:26:32 -0500
comments: true
categories:
- C#
- tools
- algorithms
- Unity
---

Unity's C# environment includes access to .NET's powerful [LINQ querying expressions](https://en.wikipedia.org/wiki/Language_Integrated_Query).  In this post I'll show how to use LINQ expressions to call anonymous functions.

<!--more-->

## Use the lambda

In the following examples, I'll be using [lambda expressions](https://msdn.microsoft.com/en-us/library/bb397687.aspx) to specify anonymous functions that I will pass as arguments to the LINQ expressions.

C# uses the `=>` symbol as an operator to create lambda expressions.

For example,

```csharp
x => x + 1;
```

says, create an anonymous function taking a single argument `x` and return the value of `x + 1`.

## Increment an array

Say I want to use my anonymous function to increment an array of counters when a tick passes in my game.

```csharp
int[] counters = new int[] {0, 1, 2, 3};

int[] tick(int[] counters) {
    int[] ret = new int[counters.Length];
    for(int i = 0; i < counters.Length; i++) {
        ret[i] = counters[i] + 1;
    }
    return ret;
}

tick(counters);
```

I could iterate over the array, incrementing each of the counters one at a time.

Or I could use LINQ expressions to map a function that increments an element over the array.

```csharp
int[] tick(int[] counters) {
    return counters.Select(x => x + 1).ToArray();
}
```

This approach has the benefit of avoiding an intermediate temporary variable to hold the returned array.  It also avoids potential errors in writing the `for` statement.  It will never be off by one.

I find the use of higher order functional style, the LINQ expression, easier to read than the imperative style, the `for` statement.

One final thing to point out is that `Select()` returns an `IEnumerable`, so you have to call its `.ToArray` method to return the proper integer array for the `tick` function.

## Conclusion

Check out the [example code on github](https://gist.github.com/zerosalife/7abc16fb21dfb05dc771).

I've only shown a tiny subset of the [functionality that LINQ provides](http://www.dotnetperls.com/linq).  Feel free to let me know if you dig in and find more useful tips.
