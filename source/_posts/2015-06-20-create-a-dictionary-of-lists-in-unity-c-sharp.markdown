---
layout: post
title: "Create a Dictionary of Lists in Unity C#"
date: 2015-06-20 11:16:28 -0500
comments: true
categories:
-   Unity
-   Unity3d
-   C#
-   tools
-   algorithms
---
[Last week](http://zerosalife.github.io/blog/2015/06/13/creating-a-dictionary-of-lists-in-unity-javascript/), I published an article about creating a Dictionary of Lists in Unity using Unity's JavaScript.  Some of the syntax is changed in C#, but the overall algorithm is exactly the same.  I've already mentioned the underlying motive, so I'll dive right in.

<!--more-->

Here's how to create a Dictionary of Lists in C# for Unity.

```csharp
Dictionary<string, List<int>> table = new Dictionary<string, List<int>>();

void Start() {
    // Fill our table with Lists containing ints using Arrays to intialize
    // the Lists.
    table["a"] = new List<int>(){1};
    table["b"] = new List<int>(){2};
    table["c"] = new List<int>(){3};

    foreach(string str in table.Keys) {
        // Get the value for our Key.
        List<int> value = table[str];

        // If the Key is the desired Key, append to its list.
        if(str == "c") {
            value.Add(4);
        }

        // print the first item in each of the Lists.
        Debug.Log(value[0]);
    }

    // Print the appended item to see that it worked.
    Debug.Log(table["c"][1]);
}
```

These are the main differences between the Unity JavaScript and C# code.  Take a look at the full file in a [gist on github](https://gist.github.com/zerosalife/e3882aa5ffd5dd614c9a).
