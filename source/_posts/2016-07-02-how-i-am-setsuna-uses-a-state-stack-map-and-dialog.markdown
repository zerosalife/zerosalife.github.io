---
layout: post
title: "How I am Setsuna uses a State Stack: Map and Dialog"
date: 2016-07-02 09:48:42 -0500
comments: true
categories:
- design
- tools
---
I recently watched [some footage of *I Am Setsuna* from E3](https://www.youtube.com/watch?v%3DGUwmNnMXd4A).

Here's my analysis of the evolving <a href="https://en.wikipedia.org/wiki/Stack_(abstract_data_type)">state stack</a>, as you play this spritual successor to the classic RPG [*Chrono Trigger*](https://en.wikipedia.org/wiki/Chrono_Trigger).

<!--more-->

## Map and Dialog

There's likely a catch-all map state in which characters can run around, interacting with the world by opening chests, entering doors and new areas, and talking to NPCs.

The gameplay starts in a snowy forest.  So, there's a `Map` state pushed onto the state stack that has a reference to the map for this snowy forest.


    | Map |


As the player wanders around the forest, the player encounters talking NPCs.  These NPCs likely have triggers that push a `Dialog` state with a reference to the NPC's dialog onto the stack.

    | Dialog ←PUSH |
    | Map          |

As the player advances and completes the dialog, the player is returned to the previous state, the snowy forest `Map`.

    | Dialog →POP |

    | Map |

The gameplay is controlled by the current state at the top of the state stack.  This provides a more convenient way to track the appropriate controls and UI elements than to sprinkle a bunch of complicated conditionals throughout some monolithic game code.

Next time I'll talk about combat.
