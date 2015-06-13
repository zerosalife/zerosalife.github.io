---
layout: post
title: "Creating a Dictionary of Lists in Unity JavaScript"
date: 2015-06-13 11:14:25 -0500
comments: true
categories:
-   JavaScript
-   Unity
-   Unity3d
-   tools
-   algorithms
---
I ran into a few problems trying to create a [Dictionary](http://wiki.unity3d.com/index.php?title%3DWhich_Kind_Of_Array_Or_Collection_Should_I_Use%253F#Generic_Dictionary) of [Lists](http://wiki.unity3d.com/index.php?title%3DWhich_Kind_Of_Array_Or_Collection_Should_I_Use%253F#Generic_List) in Unity JavaScript.  So I thought I'd share some of the tips I learned here.

<!--more-->

I'm interested in creating a Dictionary to hold [Markov Chain information](http://en.wikipedia.org/wiki/Markov_chain#Markov_text_generators) in order to generate text.  So I'd like to be able to create a Dictionary holding a variable length of items for each of its Keys.  I'd also like to be able to update the mapping at runtime.

It would look something like this:

-   **Key1:** Item1, Item2, Item3
-   **Key2:** Item4

At runtime, I'd like to be able to say: "Append `Item5` to `Key2`."

Here's what I came up with in Unity JavaScript.  I started out by initializing a `table` in my script prior to the `Start` function. The var `table` holds our mapping of Keys of type `String` to Values of type `List.<int>`, or Lists of integers.

```javascript
import System.Collections.Generic;
// White space matters.
var table:Dictionary.<String,List.<int> > = new Dictionary.<String,List.<int> >();
```

The first hiccup I ran into is that [white space matters](http://forum.unity3d.com/threads/80227-Creating-a-Dictionary-of-Lists-in-Javascript?p%3D513471&viewfull%3D1#post513471) when creating Generics in Unity JavaScript.  The compiler will throw an error if it sees two `>>` in a row.

Then I fill the table with our test mappings.

```javascript
// Fill our table with Lists containing ints using Arrays to intialize
// the Lists.
table["a"] = new List.<int>([1]);
table["b"] = new List.<int>([2]);
table["c"] = new List.<int>([3]);
```

As you can see, you can [construct a List from an Array](http://answers.unity3d.com/questions/221476/javascript-array-to-generic-list.html).  Cool.

In the `Start` function, I iterate over the Keys in the Dictionary, Add the item `4` to the Value of Key `c`, and print out the first item of each of the `values`.  Finally, we check to see whether `4` was appended to the desired entry.

```javascript
function Start () {
    // Iterate over the Keys in our Dictionary.
    for(var str:String in table.Keys) {
        // Get the value for our Key.
        var value:List.<int> = table[str];

        // If the Key is our desired Key, append to its list.
        if (str == "c") {
            value.Add(4);
        }

        // Print the first item in each of the Lists.
        print(value[0]);
    }

    // Print the appended item to see that it worked.
    print(table["c"][1]);

}
```

Then I attach this script to the Main Camera of a fresh Scene for testing purposes.  Bada bing, bada boom.

Attaching the script to any old object in the scene would work.  I just chose the Main Camera because the camera object is there by default.

This was all relatively straightforward, after I understood some of the quirks of Unity's JavaScript syntax.  You can find an example script using this code [here](https://gist.github.com/zerosalife/f13eb62bf7bd57799db6).
