---
layout: post
title: "Cheeky Tinted Blobs: a procedurally generated Unity 2D background"
date: 2015-09-12 09:47:50 -0500
comments: true
categories:
-   Unity
-   Unity2d
-   algorithm
---
I'm following along with [@pentadact](https://twitter.com/pentadact)'s tutorial video [here](https://youtu.be/I5qxIhdEx28?t%3D1m33s) (You can see the finished result around 6 minutes into the video).

Insert screenshot here.  Make sure to add a screenshot to the
README.org as well.

{% img center images/assets/tinted-blobs-screenshot.png 1434 1434 %}

<!--more-->

## The goal

What we want to do here is to generate a splotchy blurred out nebular (-lous?)  background.  Without going into to too much detail, I'm interested in something that would go well underneath a procedurally generated space station map.

## The algorithm

The algorithm [@pentadact](https://twitter.com/pentadact) describes works like this:

1.  Draw a faint white **blob**
2.  Tint the **blob** one of two randomly generated **colors**
3.  Randomly place the tinted **blobs**

## How it works

The blobs are white, which is represented in RGB color as 100% in all three values (black is 0%).  This corresponds to 255 in 8-bit colorspace and `1.0` in Unity's colorspace.  Since the blobs are faint, the actual RGB values will approach, but not reach 100%.

When we apply a tint to the blobs' sprites we are essentially multiplying each of the RGB values by our desired color's value.  The resulting value will approach the full *intensity* of the color as our raw blob approaches 100% white, if that makes sense.  So the result is a faint blob of any desired color we want.

The colored blobs overlap each other, generating interesting patterns of lighter and darker mixtures of the two colors.

## Blobonia

I fired up my favorite image editing program and made a 256 x 256 `png` blob sprite.  Using the airbrush tool, I plopped a blob in the middle of the canvas.

The settings I used were:

-   128 pixel diameter
    -   To avoid any artifacts around the edges of the canvas
-   Very soft hardness
    -   To avoid sharp edges
-   20% opacity
    -   To help with blending later on

## Setting the scene, blob prefab

Back in Unity, create a fresh 2D project and imported the blob sprite.  We drag the sprite into the scene to create a `GameObject` with the blob sprite.

We then add a `Sorting Layer` named `Blobs` and set the sprite's sorting layer to `Blobs`.  While we're at it, we also create a sorting layer named `BG` behind the `Blobs` layer for the background.

We name the `GameObject` `Blob` and drag it to the `Prefabs` directory, creating a prefab from it.

Blob prefab in hand, we still needed a couple more pieces to prepare the scene.

## Backdrop

We create a black `Background` UI object and set the `X scale` and `Y scale` to `1000`, to be sure Background covered the whole screen.  We then set the sorting layer of the sprite to `BG`.  Remember how we set that layer up earlier?  How prescient!

## One GameObject To Hold Them All

We're planning to create a whole metric ton of blobs, so we create a `Blobs` `GameObject` to hold all of the blobs.  By setting the instantiated blob's `transform.parent` to the `Blobs.transform` all of the instantiated blobs fall under the parent `Blobs` `GameObject` and it keeps the Hierarchy in our Scene nice and tidy.

## BlobGen

We have a background, a Blob prefab and even a `GameObject` that will hold all of the blobs we plan to create. Now we just need to make a `BlobGenerator` script to randomly place the blobs.

The `BlobGenerator` takes a reference to the Blob `Prefab`, a reference to the parent Blobs `GameObject`, an integer number of blobs to create, and maximum and minimum coordinates to control the spread of the created blobs.

The `BlobGenerator` generates two random colors using a function called `RandomColor`,

```csharp
Color RandomColor() {
    return new Color(Random.value, Random.value, Random.value);
}
```

Which it then zips up into an array called `colors`.  `Random.value` returns a random `float` between `0.0` and `1.0`, which we use to generate a new `Color`.

Then the `BlobGenerator` gets into the main routine, `PlaceBlobs`.

Briefly, `PlaceBlobs` instantiates clones of the blob prefab at random positions within the maximum and minimum boundaries we specify, makes the cloned blob a child of the parent Blobs `GameObject`, and sets the color tint of the cloned blob to one of the two colors generated above.

```csharp
void PlaceBlobs() {
    for (int i = 0; i < numberOfBlobs; i++) {
        GameObject blockClone = Instantiate(blobPrefab,
                                            new Vector3(Random.Range(xMin, xMax),
                                                        Random.Range(yMin, yMax),
                                                        0f),
                                            Quaternion.identity) as GameObject;
        SpriteRenderer sprite = blockClone.GetComponent<SpriteRenderer>();
        blockClone.transform.parent = blobs.transform;
        sprite.color = colors[Random.Range(0, colors.Length)];
    }
}
```
That's all there is to it.  You can check out the full example project on [github](https://github.com/zerosalife/tint-background).

## Moving forward

It would be nice to have more fine-grained control over the local density of the blobs in certain regions, so the map would become a little less uniform, creating pockets of character in an otherwise featureless space.  But I think the effect here works nice as a background.
