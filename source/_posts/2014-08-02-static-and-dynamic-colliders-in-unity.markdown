---
layout: post
title: "Static and Dynamic Colliders in Unity"
date: 2014-08-02 12:54:15 -0500
comments: true
categories:
-   Unity
-   mechanics
---

According to the [Ray Wenderlich Unity 2D tutorial](http://www.raywenderlich.com/70344/unity-2d-tutorial-physics-and-screen-sizes) by [Christopher LaPollo](http://www.raywenderlich.com/u/clapollo), Unity's physics engine builds a simulation based on the [Colliders](http://docs.unity3d.com/Manual/CollidersOverview.html) present in a scene.  If some those `Colliders` are declared to be `static`, then the entire simulation is rebuilt when those colliders move.  Of course, rebuilding a physics simulation when it's unnecessary is inefficient.  By declaring objects to have `dynamic` `Colliders`, the physics engine does not have to rebuild the simulation at runtime, that is to say when the game is running.

As with a lot of things in Unity, it is not immediately apparent how you should go about declaring a collider to be `static` or `dynamic`.  It would be great if there were just a checkbox in the `Collider` component.  But there isn't.  It appears that there are some complex things going on under the hood that preclude a simple declaration.

By default a `GameObject` with a `Collider` component attached is treated as `static` by Unity's physics engine.  This would work for a non-moving wall or impassable bit of scenery, but for moving objects like enemies we need to mark them as `dynamic`.  In order for a `GameObject`'s `Collider` to qualify as `dynamic` it requires a [`Rigidbody` component](http://docs.unity3d.com/Manual/class-Rigidbody.html).  If you don't want the normal features of the `Rigidbody`, i.e. conferring control of the `GameObject`'s position to the physics system, then you can check the `Is Kinematic` checkbox.  A kinematic object's position is under the control of the attached scripts, rather than the physics system.

One other trick from the [tutorial](http://www.raywenderlich.com/70344/unity-2d-tutorial-physics-and-screen-sizes) is to set the `Collider` component's `isTrigger` property to `true`.  This prevents the `Collider` from being treated as a solid object in the physics simulation, which could lead to unintended bumping and pushing among various `Colliders` in a scene.

**Update:** [@InvolvingSalmon](https://twitter.com/involvingsalmon) points out that the instructions here depend on the version of Unity that you are using.  This article was written for Unity version `4.5.2f1`.
