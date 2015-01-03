---
layout: post
title: "New Year, New Footer"
date: 2015-01-03 09:17:24 -0600
comments: true
categories:
-   tools
-   Octopress

---
It's 2015.  Time to update my footer.  I came across a link to a
website called, [updateyourfooter.com](http://updateyourfooter.com/).  It describes ways to
dynamically update footer info in a variety of languages.

I set out to intrepidly implement one of the JavaScript snippets from the website in the `source/_includes/custom/footer.html` file in my [Octopress](http://octopress.org/) install.  But, to my surprise, there was a bit of code in the footer that already dynamically generated the date timestamp for the footer.

The code looks like this:

{% raw %}
`{{ site.time | date: "%Y" }}`
{% endraw %}

Ready for this?  Octopress is a framework built on top of [Jekyll](https://github.com/jekyll/jekyll).  Jekyll uses [Shopify's Liquid Template Engine](http://docs.shopify.com/themes/liquid-documentation/basics).  All of that is a fancy way of saying that this code is compiled into useful stuff for my site.

All I had to do was preface that with the year my blog was established, and badabing, no-mess dynamic footer.  Now the relevant section of the footer looks like this:

{% raw %}
`Copyright &copy; 2014 &ndash; {{ site.time | date: "%Y" }}`
{% endraw %}

You can see the results at the bottom of this page.
