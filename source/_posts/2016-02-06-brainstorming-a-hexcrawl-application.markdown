---
layout: post
title: "Brainstorming a Hexcrawl application"
date: 2016-02-06 08:00:40 -0600
comments: true
categories:
-   design
-   tools
---
Here are some notes brainstorming an application to support hexcrawl
campaigns in the spirit of the [West Marches](http://arsludi.lamemage.com/index.php/78/grand-experiments-west-marches/).

This is a snapshot of a living document.  I will continue working on
it in a [gist](https://gist.github.com/zerosalife/22ac247a275a9835c2fa).

<!--more-->

## Views

### Map

[Example image](http://4.bp.blogspot.com/-5X3gz-42PrE/TsCPATXPONI/AAAAAAAACQA/s0XggyFIGXY/s1600/HCC06+-+Troll+Hills.png)

1.  Notification of Map Code and URL to share

2.  Collection of tiles

3.  Background image?

4.  Regions?

### Tile

1.  Revealed / Generated

    1.  Biome

    2.  Region

    3.  Data

    4.  Tile icon

    5.  Notes

2.  Hidden

### Hierarchy

1.  Map

    1.  Tile

## Actions

### Choose map from PIN

### Drill down to tile (map)

### Drill up to map (tile)

### Reveal tile

### Regenerate tile

### Regenerate data entry

### Save tile notes

## Persistence

### Monolithic

### Per User

### Per Map

### Bloom Filters to prevent code collisions

1.  Cache on startup

2.  Append on world create
