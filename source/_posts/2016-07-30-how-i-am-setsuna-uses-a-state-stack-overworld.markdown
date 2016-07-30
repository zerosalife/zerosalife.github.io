---
layout: post
title: "How I am Setsuna uses a State Stack: Overworld"
date: 2016-07-30 09:47:19 -0500
comments: true
categories:
- design
- tools
---

The `Overworld` state ties together all of the states I previously discussed based on watching [this playthrough](https://youtu.be/GUwmNnMXd4A) of *I am Setsuna*.

<!--more-->

## Overworld

I think that the `Overworld` can serve as the base `Map` state I used in my previous examples.  This allows the `Overworld` to serve two purposes.  First, the `Overworld` state holds all of the map and area entrance data to allow characters to move about the overworld.  And second, the `Overworld` state can store information about the state of the game for use in the other states.

## Area information

    | Overworld |

The `Overworld` contains all of the data necessary to render the overworld map, including the assets for rendering the map and the location and the target map data on triggers for entering towns, caves, and other `Maps`.

## Gameplay information

    | Menu ←    |
    | Overworld |

The `Overworld` also contains the sorts of information you see in the main menu, such as the character's state, inventory, money.  Serializing a snapshot of this information and the characters' position saves the game's state and can be used to reload the game later.

The states added to the stack on top of the `Overworld` state can access this data for consumption and updating.

    | Shop menu  |
    | Map (Shop) |
    | Map (Town) |
    | Overworld  |

For instance, a shop in town may access the inventory and money to allow the player to purchase items.

    | Combat   |
    | Overwold |

Similarly, the combat state may access the characters' stats, equipment and inventory to track health, damage output, and item use in battle.

## Summary

I hope that [the](http://zerosalife.github.io/blog/2016/07/02/how-i-am-setsuna-uses-a-state-stack-map-and-dialog/) [last](//zerosalife.github.io/blog/2016/07/16/how-i-am-setsuna-uses-a-state-stack-combat/) [few posts](http://zerosalife.github.io/blog/2016/07/23/how-i-am-setsuna-uses-a-state-stack-interiors/) have given you an overview of how the state stack could work for supporting an RPG like *I am Setsuna*.
