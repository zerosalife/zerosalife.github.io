---
layout: post
title: "Upgrading to Mavericks"
date: 2014-03-15 09:03:27 -0400
comments: true
categories:
-   tools
-   OS X
---

This week I upgraded to [Mac OS X 10.9 Mavericks](https://www.apple.com/osx/).  To keep [octopress](http://octopress.org/) working, I had to uninstall and reinstall [Ruby](https://www.ruby-lang.org/).

Upon trying a `rake generate` task, I saw errors in the Ruby gems for processing [YAML](http://www.yaml.org/).  I assume this is due to the fact that I built them on the older OS X install.

Interestingly, [RVM](https://rvm.io/) survived the upgrade and seems to be working just fine.

I followed the instructions [here](https://gist.github.com/imathis/1104557) to uninstall and reinstall Ruby, the bundler, and all bundled gems for my octopress install.  The instructions mention a specific problem for OS X Lion, but these steps solved the problem for me.
