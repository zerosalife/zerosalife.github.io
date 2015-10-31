---
layout: post
title: "Mocking GameObjects in Unity Unit Tests"
date: 2015-10-31 09:03:57 -0500
comments: true
categories:
-   tools
-   algorithm
-   Unity
-   C#
---

A while back, I wrote a post about [unit testing in Unity](http://zerosalife.github.io/blog/2015/10/03/unit-testing-in-unity/).  In this post, I'll go through a useful pattern to [mock](https://en.wikipedia.org/wiki/Mock_object) `GameObject`s in unit tests.

<!--more-->

## Make a GameObject

We can create a `GameObject` inside a test just like we would normally inside a Unity script.

``` csharp
GameObject testGo = new GameObject("test");
```

Passing a string to [the `GameObject` constructor](http://docs.unity3d.com/ScriptReference/GameObject-ctor.html) gives the `GameObject` that name.

## We can even Instantiate prefabs

Since our test is not inheriting `MonoBehaviour`, we'll have to call the Instantiate function directly, using the fully qualified namespace.

Remember that prefabs are just stored `GameObject`s, so we can use the `testGo` created above as our prefab.

``` csharp
GameObject go = UnityEngine.Object.Instantiate(testGo,
                                               Vector3.zero,
                                               Quaternion.identity) as GameObject;
```

## Clean up

We can create `GameObject`s, but repeatedly running the test leaves our project cluttered up with old objects.  We want our tests to clean up all mocked objects after running.  We'll do that using by using the fully qualified [`DestroyImmediate` function](http://docs.unity3d.com/ScriptReference/Object.DestroyImmediate.html).

We need to call `DestroyImmediate` instead of `Destroy` because the unit tests are running in the editor and delayed destruction won't be invoked.

``` csharp
UnityEngine.Object.DestroyImmediate(go);
UnityEngine.Object.DestroyImmediate(testGo);
```

## Mocking is easy

Following this pattern will give you the ability to mock objects to your hearts' delight as you unit test your Unity code.  As, always let me know if you have questions, comments, or concerns below or on twitter.
