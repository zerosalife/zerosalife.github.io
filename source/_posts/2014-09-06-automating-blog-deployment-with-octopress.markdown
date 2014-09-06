---
layout: post
title: "Automating blog deployment with Octopress"
date: 2014-09-06 11:27:35 -0500
comments: true
categories:
- tools
- Octopress
- Make
- Makefile

---

Based on Kevin van Zonneveld's ([@kvz](https://twitter.com/kvz)) [article](http://kvz.io/blog/2012/09/25/blog-with-octopress/) on setting up Octopress,
I've adapted a `Makefile` to make building my blog easier&#x2026; with
[make](http://www.gnu.org/software/make/).  The following `Makefile` allows me to build and deploy my blog
by typing `make blog` at the command prompt.

<!--more-->

    all: blog

    preview:
            bundle exec rake generate && bundle exec rake preview

    blog:
            git pull && \
            bundle install && \
            bundle exec rake integrate && \
            bundle exec rake generate && \
            bundle exec rake deploy && \
            git add .; \
            git commit -am "blog update $$(date +%Y-%m-%d)"; \
            git push origin source

    .PHONY: blog%                   # Force blog to run regardless of the changes to the files.

## Additional Notes

### rake build didn't work for me

I think this is because I haven't written any tasks that use `rake
build`.

### Remote for the source of my blog

I push the source code of my blog to a branch named `source` rather
than `master`.
