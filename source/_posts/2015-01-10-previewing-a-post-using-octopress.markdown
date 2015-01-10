---
layout: post
title: "Previewing a post using Octopress"
date: 2015-01-10 10:01:44 -0600
comments: true
categories:
-   tools
-   Octopress
---
It's nice to preview some of my more complicated posts before I ship them out to the Internets.  Here's how I do it.

## make preview

I [previously posted](http://zerosalife.github.io/blog/2014/09/06/automating-blog-deployment-with-octopress/) a `makefile` I use to automate deployment of my blog.  Here are the germane lines for previewing:

``` make
preview:
	bundle exec rake generate && bundle exec rake preview
```

So typing `make preview` at the command prompt will run start up [rake](https://github.com/ruby/rake)'s webserver at `http://localhost:4000`.  Then all I have to do is launch a browser, connect to that port, and voila: a preview of the blog that regenerates to match the changes I make live, as I make them.
