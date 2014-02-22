---
layout: post
title: "Setting up Emacs-like key bindings in MonoDevelop"
date: 2014-02-22 08:14:40 -0600
comments: true
categories:
- tools
---

I'm playing around with [Unity](http://unity3d.com/) to try to learn how it works.  Shout out to [Infinite Ammo](http://infiniteammo.ca/) for the excellent [video tutorials](http://www.youtube.com/playlist?list=PLEEAEA1E6B11B4DAE).

Since I don't know much about Unity, I'm reluctantly using their included [MonoDevelop IDE](http://monodevelop.com/).  While I'd heard that Emacs-like key bindings were included, in the build I installed they weren't present.

MonoDevelop does not make it easy to import new key binding schemes (the [blog post linked here](http://mjhutchinson.com/journal/2011/02/06/key_bindings) suggests submitting a bug report to propose new key bindings&#x2026;).  So, I did a little digging around on github and found the [default emacs key binding scheme](https://github.com/mono/monodevelop/blob/master/main/src/core/MonoDevelop.Ide/options/KeyBindingSchemeEmacs.xml) that I imagine should have been included in the MonoDevelop build I installed.

There was no way to add this key binding scheme to my available key bindings in MonoDevelop, so I hacked my Custom key binding file located at `~/Library/MonoDevelop-Unity-4.0/KeyBindings/Custom.mac-kb.xml`.

I started with some simple copypasta.  But then I found some useful
navigation features were lacking.  So, I added key binds that
immediately came to mind, like `Alt-f` for moving forward one word and
`Alt-b` for backward word.  Yes, I know these are `M-f` in Emacs, but
I'm using MonoDevelop's syntax here.

My key bindings are available in the gist below.  I'll update this
gist when I add key bindings, to keep a current working version
available.

<script src="https://gist.github.com/zerosalife/9096788.js"></script>
