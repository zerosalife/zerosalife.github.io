---
layout: post
title: "Text encoding: further improvements to using git for Unity projects"
date: 2014-09-27 09:51:41 -0500
comments: true
categories:
-   Unity
-   Unity3D
-   tools
-   git
-   version control
---
Brief note here.  Following a Summer of travel and visitors, posts should be returning to a more regular schedule soon.  It's great when I can post here regularly, but I'm not going to get bent out of shape when I have other commitments.  So, if there are unannounced, prolonged absences, you can assume that it has something to do with spending my weekends traveling or socializing, which is undoubtedly a good thing.

I recently came across [this stackoverflow answer](http://stackoverflow.com/questions/18225126/how-to-use-git-for-unity3d-source-control) introducing git for version control in Unity projects.  Note, the question specifically refers to Unity3D, but this will work for Unity2D as well.

I've [already written](http://zerosalife.github.io/blog/2014/05/17/dot-gitignore-for-unity-projects/) about setting up a `.gitignore` file.  Here are some steps you can take to optimize the way Unity stores information, so git can track it.

Git was built to work by `diffing` large files containing text, specifically code.  Git works just fine with binary files, but it defaults to a less efficient method to `diff` those files, which can result in bloated git repositories.  Nobody wants a bloated git repository.

Here I'll summarize two of the steps from the answer that I found helpful, using Unity v4.5+.  It's worth noting that these steps will increase the size of your project--although I'm unsure whether they affect the size of any deployed binaries.

So if the size of the project on your development machine is a critical issue, you may want to think about keeping the default settings.  The project I tried the steps on went from 86.7 MB on disk (including its bloated git repository) to 86.9 MB, so it's probably not going to create an appreciable change in most projects.

## Switch to Visible Meta Files

Switch to `Visible Meta Files` in the Edit → Project Settings → Editor → Version Control Mode Menu.

If the `Visible Meta Files` option is turned on, the `.meta` files associated with parts of your project will have textual information rather than binary.

## Switch to Force Text

Switch to `Force Text` in the Edit → Project Settings → Editor → Version Control Menu.

If you choose `Force Text` this will cause Unity to use text to serialize assets that it would normally store as binary files.

## Save

Save the Scene and project for these changes to take effect.
