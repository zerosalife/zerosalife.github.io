---
layout: post
title: "Clojure Rhizome Labeled Edge Tutorial"
date: 2014-04-26 09:47:18 -0500
comments: true
categories: 
- algorithm
- tutorial
- design
- tools
- Clojure
---

I'm using the [Rhizome package](https://github.com/ztellman/rhizome) for Clojure to rapidly prototype the dependency graph for a crafting system.  It's nice to be able to add and remove components while generating visualizations on-the-fly.  Clojure's simple, composable syntax, aided by [paredit](https://www.youtube.com/watch?v=D6h5dFyyUX0), makes shuffling around key-value pairs, and even whole dictionaries, quick and easy.

The existing Rhizome documentation shows simple examples for labeling the nodes of a directed graph.  In order to show the relationship between nodes on the graph, I'd like to also label the edges, or the arrows connecting the nodes.

Rhizome provides a keyword argument `:edge->descriptor` to most of its functions.  Consulting the source code and the tests for the Rhizome package, I learned that the functions expect `:edge->descriptor` to be a function accepting two arguments for each edge: `src`, the source node, and `dst`, the destination node.  In order to label the edges, the anonymous function I'm binding to `:edge->descriptor` will return a dictionary containing the key `:label` and the value for the edge's label.

Here's an example using the simple graph from the Rhizome documentation:

{% codeblock lang:clj %}
(use 'rhizome.viz)

(def g
    {:a [:b :c]
     :b [:c]
     :c [:a]})

(view-graph (keys g) g
            :node->descriptor (fn [n] {:label n}))
{% endcodeblock %}

{% img /images/assets/graph-unlabeled-edges.png %}

Now, I'll use a dictionary of dictionaries to associate the source and destination nodes with a label for each edge.

{% codeblock lang:clj %}
(def g-edges
  {:a {:b :makes
       :c :takes}
   :b {:c :takes}
   :c {:a :makes}})

(view-graph (keys g) g
            :node->descriptor (fn [n] {:label n})
            :edge->descriptor (fn [src dst] {:label (dst (src g-edges))}))
{% endcodeblock %}

{% img /images/assets/graph-labeled-edges.png %}

I've submitted a [pull request](https://github.com/ztellman/rhizome/pull/8) to Rhizome to add this example to the documentation.
