---
layout: post
title: "C# code blocks in Octopress"
date: 2015-08-15 08:59:19 -0500
comments: true
categories:
-   Octopress
-   tools
-   C#
---

[Octopress](http://octopress.org/) supports [backtick code blocks](http://octopress.org/docs/plugins/backtick-codeblock/) with [Pygment lexers](http://pygments.org/docs/lexers/) handling syntax highlighting.  I always forget the syntax for using with bactick codeblocks with C#, leading to irritating failures when I build my Octopress blog.  Here's how you use them.

    ``` csharp
    [csharp code here]
    ```
