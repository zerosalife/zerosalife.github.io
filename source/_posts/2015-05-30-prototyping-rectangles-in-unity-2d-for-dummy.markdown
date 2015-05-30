---
layout: post
title: "Prototyping Rectangles in Unity 2D for Dummy"
date: 2015-05-30 09:57:58 -0500
comments: true
categories:
-   Unity
-   design
-   prototype
- Unity2d
- Unity3d
-   UnityJS
---

Who's "Dummy"? I'm the dummy.  Prototyping with 2d boxes in Unity JavaScript has proven surprisingly hard.  I think the difficulty I'm having is that I'm not exactly sure what I'm trying to do.  What follows is an example of **one** way (notice that I didn't say THE **RIGHT** WAY) to prototype with 2d rectangles in Unity.  I'm still too much of a noob to have strong opinions on the right way to go about doing this.  Expect more posts on this topic as I develop my expertise.

[Discoverability](http://en.wikipedia.org/wiki/Discoverability) is something I prize in programming languages and environments, especially when I'm learning them.  While Unity's documentation is thorough, the lack of congruence between the GUI environment and coding leads to poor discoverability.  There's not a one-to-one correspondence between the labels for `Components` in the GUI inspector and their names and attributes in code.

<!--more-->

Most of the time, Google is my method for discovering new functionality in Unity.  The problem with this method, and even the documentation, is that I'm never quite sure if the solution I've found is the best solution, the only way to do something, or the wrong way to do something.

I'm trying to get simple rectangular boxes to work in Unity 2d for prototyping movement, hitboxes for attacks, etc.  The information I can find either deals with real-deal-Holyfield sprites or `GUIBoxes`.

It will be nice to work with `Sprites` eventually, but I just want to get a box that can walk around and jump, at this point.  `GUIBoxes` seem like the wrong type of boxes, if I want to prototype something that will eventually be a `Sprite`.

As near as I can tell, the `Sprite` is a (relatively) new way of making a flat 2D `Plane` in Unity.  I couldn't seem to find anything dealing with `Sprites` without creating them in the Unity GUI interface.

So, I started out following a Unity Answers question [here](http://answers.unity3d.com/questions/139808/creating-a-plane-mesh-directly-from-code.html).

## Getting the Mesh to gel

First, I created a brand-spankin new Unity 2D project.  I had to create an empty `GameObject` to host my `PlaneTest.js` script `Component`.  I included a variable `size` to control the size of the box, so you can play around with that in the Editor interface.

Next, I had to create a `Mesh` that would be the actual geometry of the plane.  Now, the `Mesh` I'm making differs from the stock Unity `Plane` `GameObject`.  [This blog post](http://www.third-helix.com/2012/02/making-2d-games-with-unity/) shows that Unity's `Plane` defaults to a 10 x 10 quad mesh with a couple hundred triangles.  A quad is just a square made of two triangle faces, [this blog post](http://blog.nobel-joergensen.com/2010/12/25/procedural-generated-mesh-in-unity/) goes into more detail.

Here we [do it live](http://i.eho.st/pgtxqdii.gif) by defining a `name` `String`, an `array` of `Vector3` `vertices`, an `array` of `uv` texture coordinates, and an `array` of `triangles` faces.

``` js
var m: Mesh = new Mesh();
m.name = "Scripted_Plane_New_Mesh";
m.vertices = [Vector3(-size, -size, 0.01),
              Vector3(size, -size, 0.01),
              Vector3(size, size, 0.01),
              Vector3(-size, size, 0.01)];
m.uv = [Vector2(0, 0),
        Vector2(0, 1),
        Vector2(1, 1),
        Vector2(1, 0)];
m.triangles = [0, 1, 2,
               0, 2, 3];
```

## Who you calling normal?

At one point I thought I had to `RecalculateNormals`, according to the Unity Answers example above.  But it doesn't seem to make a difference.  Here's a great example of the Unity discoverability problem.  Since it doesn't *seem* to make a difference, I don't know whether to trust the Unity Answers that received 5 upvotes or to go with parsimony.

A little more digging [reveals](http://forum.unity3d.com/threads/210399-4-3-Sprites-and-Lighting) that normal maps are particularly important for lighting.  Since the `Sprite Shader` I intend to use doesn't use normal maps, we can leave it out.

## OBJECTION!!

Time to create the `GameObject` that will hold a `MeshRenderer`, `MeshFilter`, and `MeshCollider`.  According to the [docs](http://docs.unity3d.com/Documentation/Components/class-MeshFilter.html), a `MeshFilter` takes a mesh, like the one we created above, and passes it to the `MeshRenderer` for rendering to the screen.  Not sure what it's *filtering* or why there's an intermediate `Component`, but there you go.

The [docs](http://docs.unity3d.com/Documentation/Components/class-MeshRenderer.html) say the `MeshRenderer` then takes the geometry from the `MeshFilter` and renders it on the screen at the position defined by the `GameObject`'s `Transform`.

``` js
var obj: GameObject = new GameObject("New_Plane_From_Script",
                                     MeshRenderer,
                                     MeshFilter,
                                     MeshCollider);
obj.GetComponent(MeshFilter).mesh = m;
```

## Time for texture

Next we create a `Texture2D` to hold the color information, to really give the box some panache.  The `Texture2D` goes into the `MeshRenderer`'s `mainTexture` slot.

``` js
var texture: Texture2D;
texture = new Texture2D(size, size, TextureFormat.ARGB4444, false);
obj.renderer.material.mainTexture = texture;
```

I don't know too much about how `Texture2D` works right now, but there's plenty to read in the [docs](http://docs.unity3d.com/Documentation/ScriptReference/Texture2D.html).

## A splash of color

Here we generate some random RGB values, normalize them for Unity's `0.0-1.0` colorspace and make a `Color` to put into the `MeshRenderer`'s color slot.

``` js
var red: float = Random.Range(63, 255) / 255f;
var green: float = Random.Range(63, 255) / 255f;
var blue: float = Random.Range(63, 255) / 255f;
var color = Color(red, green, blue);
obj.renderer.material.color = color;
```

## The crucial shader

At this point, I tested my code and got no errors. However, to my surprise I didn't see anything rendered on the screen.

I learned that I needed to use a `Sprite Shader` to get the colored mesh to render properly.  Here's how I did it:

``` js
var spriteShader: Shader = Shader.Find("Sprites/Default");
obj.renderer.material.shader = spriteShader;
```

## Boxes for dummy

I don't feel so dumb anymore because this was a complex process.  And it wasn't until the very last crucial step that I saw anything remotely box-like.

I've posted the code to a gist [here](https://gist.github.com/zerosalife/743cf797112d62978bec) so you can clone the script for yourself, to give it a whirl.  I found that setting `size` to 2 is a nice place to start.
