---
layout: post
title: "How I am Setsuna uses a State Stack: Combat"
date: 2016-07-16 10:14:59 -0500
comments: true
categories:
-   design
-   tools
---
The previous post looked at how *I am Setsuna* uses a state stack to allow players to move around on a map and interact with NPCs via dialog.  This time around, I'll show you how combat can be handled by adding another state to the stack.

<!--more-->

This approach decreases the need to pass information between the various parts of your code handling the various states of your game.  So it's preferable compared to costly serialization and deserialization to pass information to wholly separate code every time the game state changes.  Instead you simply change the way that the game's code runs.

## Combat

After the player converses with an NPC, combat with a gnarly looking bear begins.  Here's what likely happens.

    | Combat ←push |
    | Map          |

The player fights the enemy.  Then the combat state pops off the stack, returning the player to the snowy forest map.

    | Combat →pop |

    | Map |

Note that the combat state may have substates that handle in-combat messages, player turns, and experience and item rewards at the end of combat.  Designing these substates depends on the specific requirements of your combat system.  That makes it hard to tell what the developers are using from [this brief clip of *I am Setsuna*](https://www.youtube.com/watch?v%3DGUwmNnMXd4A).

That's all there is to it.  The modularity of this state stack approach allows developers to customize the flow of gameplay as desired.
