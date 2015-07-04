---
layout: post
title: "Probabilistic Entity Spawning in Unity JavaScript"
date: 2015-07-04 09:56:33 -0500
comments: true
categories:
-   JavaScript
-   Unity
-   Unity3d
-   tools
-   algorithms
---

The Unity documentation has an example showing how to generate random indexes satisfying a distribution of probabilities (see: [Choosing Items with Different Probabilities](http://docs.unity3d.com/Manual/RandomNumbers.html)).  In this post I'll show how to use a similar approach to generate random items with specific probabilities dictated by the environment.

<!--more-->

I want to be able to generate an item code, say `Red`, `Green`, or `Black`, given a list of floating point probabilities dictated by the current environmental area in my game, say for example `desert` or `grassland`.

Varying the probability of encountering items will give each area a unique flavor.  If the player needs a `Red` item, the player will need to seek out areas in which the probability for encountering `Red` items is high.  I hope this will drive player exploration and investigation.

I'll start by defining an array of possible item types.  (According to [this introduction to Unity JavaScript](http://wiki.unity3d.com/index.php/Head_First_into_Unity_with_UnityScript#Use_enum), I should prefer `enum`.)

``` javascript
var ents : String[] = ["Red", "Green", "Black", "Orange"];
```

Since this is a small example, I'll forego the efficiency and security that `enum`s provide for the convenience of using a simple `String` array.  I'll note that this is a good spot to do some refactoring in a real project where a variety of systems may have to interact with the item types.

I then define a Dictionary `areas` of Lists of floating point probabilities.  These areas correspond to terrains that contain unique distributions of items. The `areas` Dictionary accepts `String`s specifying the desired terrain.

It's important to note that the order of the probabilities correspond to the order of the item types in `ent`s.

``` javascript
var areas = new Dictionary.<String, List.<float> >();
areas["desert"] = new List.<float>([0.1, 0.05, 0.425, 0.425]);
areas["grassland"] = new List.<float>([0.3, 0.35, 0.1, 0.25]);
```

So, in the `grassland` area, there will be a 30% chance of choosing a `Red` item.

Now that I've defined the data, I need a function to choose the appropriate index given a List of probabilities.  This function is lifted with minor modifications from the [Unity Documentation](http://docs.unity3d.com/Documentation/Manual/RandomNumbers.html).  Take a look at that documentation for a better visualization of the algorithm than I could do with words.  Really, do it!

``` javascript
function Choose(probs : List.<float>) : int {
    // Returns the index of a probabilistically determined random
    // entity, given by the probability distributions in probs.
    // e.g.:
    // probs : List.<float>([0.5, 0.2, 0.1, 0.2]);
    // entity = entities[Choose(probs)];
    //
    // See http://docs.unity3d.com/Documentation/Manual/RandomNumbers.html

    // Watch out!  If you fail to specify total's type as float, it
    // will add the probs using integer addition.  This will floor
    // each of the probs to 0.
    var total : float = 0;

    for (x in probs) {
        total += x;
    }

    var randomPoint = Random.value * total;

    for(var i = 0; i < probs.Count; i++) {
        if (randomPoint < probs[i])
            return i;
        else
            // Shift the strip down, adjusting the random point's
            // value to see whether it falls within the next prob.
            randomPoint -= probs[i];
    }
    // Take care of possibility that randomPoint is 1.0 or 100% by
    // returning the last element of probs.  Avoids allowing Choose to
    // return a 0 probability event (which would be possible using the
    // <= test).
    return probs.Count - 1;

}
```

Now to choose an item:

``` javascript
var item = ents[Choose(areas["grassland"])];
Debug.Log(item);
```

That's all there is to it. I've put an [example Unity project with this code on github](https://github.com/zerosalife/ProbEntitySpawnExample).
