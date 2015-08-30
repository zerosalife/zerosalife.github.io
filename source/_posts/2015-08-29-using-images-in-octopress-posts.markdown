---
layout: post
title: "Using images in Octopress posts"
date: 2015-08-29 17:20:05 -0500
comments: true
categories:
-   Octopress
-   tools
---
## Storing the images
I store images in `./images/assets/` in my Octopress install directory.  They get bundled up with all the other parts of my blog when I deploy.

## The Octopress image tag

I use the [Octopress image tag](http://octopress.org/docs/plugins/image-tag/)

The syntax is:
    {[%] img [class names] /path/to/image [width] [height] [title text [alt text]] [%]}
