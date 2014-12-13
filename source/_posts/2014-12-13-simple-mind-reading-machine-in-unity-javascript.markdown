---
layout: post
title: "Simple Mind-reading Machine in Unity JavaScript"
date: 2014-12-13 14:38:20 -0600
comments: true
categories:
-   AI
-   algorithm
-   mechanics
-   Unity
-   JavaScript
-   Unity3d

---

I ported a cool toy from [Alastair Aitchison's blog](http://alastaira.wordpress.com/2014/03/15/a-simple-mind-reading-machine/) to Unity JavaScript.  The toy implements a simple 'mind-reading' algorithm that attempts to guess whether the player will choose Left (by pressing the left arrow key) or Right (by pressing the right arrow key).

<!--more-->

## How does it work?

Aitchison's blog post describes how it works:

> How does it work? Not by mind-reading, obviously, but by exploiting
> the fact that humans do not behave as "randomly" as they think they
> do. The computer maintains a very simple memory that records the
> pattern of results of the last two rounds – whether the player won or
> lost, whether they switched strategy, and then whether they then won
> or last the following round. The computer then uses this to choose its
> own best strategy based on the way the player behaved last time the
> current pattern occurred. If the computer loses twice in a row using
> the current strategy, it picks a random response in the next round.

The original idea came from some AI work by [Claude Shannon](http://en.wikipedia.org/wiki/Claude_Shannon) and D. W. Hagelbarger. [They describe the internal memory of the toy mind-reader](http://cs.stanford.edu/people/eroberts/courses/soco/projects/1999-00/information-theory/ai.html) that we will model using a multidimensional array `v`:

> There are 8 possible situations and two things the player can do at each one:

> 1.  player wins, plays same, wins. Then same or differently.

> 2.  player wins, plays same, loses. Then same or differently.

> 3.  player wins, plays differently, wins. Then same or differently.

> 4.  player wins, plays differently, loses.Then same or differently.

> 5.  player loses, plays same, wins.Then same or differently.

> 6.  player loses, plays same, loses.Then same or differently.

> 7.  player loses, plays differently, wins.Then same or differently.

> 8.  player loses, plays differently, loses.Then same or differently.

## Why port it?

Why not just take a straightforward approach, running his code myself? First, I wanted to fully understand the algorithm the hard way, by coding it line for line myself. And second, I wanted to better familiarize myself with Unity JavaScript, including its differences from C#.

The port was relatively simple, except for two small hiccups.  First, as far as I know, Unity JavaScript doesn't allow for initializing a multidimensional array.  So I looped over the cells in the array, filling them that way.  I have a hunch that the cells are initialized to the `int` `0` by default, but I wanted to be explicit.  Please let me know in the comments or [via twitter](https://twitter.com/zerosalife) if I'm way off base.

    var v : int[2, 2, 2];
    for(var cell in v) {
        cell = 0;
    }

I also encountered some unfamiliar syntax: the sonorously named Elvis operator, [?:](http://en.wikipedia.org/wiki/Conditional_operator).  It's also called the [ternary operator](http://en.wikipedia.org/wiki/Ternary_operation), when it's used with 3 arguments, as I've used it here.  In C-like languages it allows for succinctly stating these kinds of conditional expressions. The example below illustrates how it's used.

    // Is the current player's choice the same as the previous player's
    // choice?
    //
    // if (playerChoice == lastChoice)
    //     sameChoice = True;
    // else
    //     sameChoice = False;
    //
    // Using ternary operator:
    v[lw2, lw1, 1] = (v[lw2, lw1, 0] == playerChoice ? 1 : 0);

## The code

The ported code for the mind-reader is reproduced below.

    #pragma strict
    import System.Collections.Generic;

    // Used to record play history
    var v: int[,,];
    var lw1: int;
    var lw2: int;
    var losingStreak: int;

    // The prediction of the player's next turn
    var prediction: int;

    // Keep track of scores
    var cpuScore: int;
    var playerScore: int;

    var outText: String;

    function Start () {
        // Initialize matrix to track state of play history

        v = new int[2, 2, 2];

        for(var cell in v) {
            cell = 0;
        }

        // No prior knowledge, so set inital prediction based on random chance.
        prediction = flip();

        // Set scores to 0
        cpuScore = 0;
        playerScore = 0;

        // Initialize previous play and play before last win-lost trackers
        lw1 = 0;
        lw2 = 0;

        // Output
        outText = "";
    }

    function TakeTurn(playerChoice: int) {
        // Display player and computer's choices
        var outTextString: String = "You pressed " + playerChoice + ", " + "I guessed " + prediction + "\n";

        // Computer guessed correctly
        if (playerChoice == prediction) {
            cpuScore++;
            losingStreak = 0;
            outTextString += " I WIN!\n";
        }
        else {
            playerScore++;
            losingStreak++;
            outTextString += " YOU WIN!\n";
        }

        outText = outTextString;

        // Is the current player's choice the same as the previous player's
        // choice?
        //
        // if (playerChoice == lastChoice)
        //     sameChoice = True;
        // else
        //     sameChoice = False;
        //
        // Using ternary operator:
        v[lw2, lw1, 1] = (v[lw2, lw1, 0] == playerChoice ? 1 : 0);
        v[lw2, lw1, 0] = playerChoice;
        lw2 = lw1;
        lw1 = playerChoice;

        // If lost more than twice in present state, choose random
        // strategy.  Otherwise keep the same strategy.
        prediction = v[lw2, lw1, 1] == 1 && losingStreak < 2 ? v[lw2, lw1, 0] : flip();
    }

    function flip() : int {
        // Simulate a coin flip to produce 50:50 chance of [0, 1]
        return Random.Range(0, 2);
    }


    function Update () {
        if (Input.GetKeyDown(KeyCode.LeftArrow)) {
            TakeTurn(0);
        }
        if (Input.GetKeyDown(KeyCode.RightArrow)) {
            TakeTurn(1);
        }
    }

    function OnGUI() {
        var style : GUIStyle = new GUIStyle();
        style.fontSize = 36;

        GUI.Label(new Rect(0, 0, Screen.width, 100), outText, style);
        GUI.Label(new Rect(0, 100, Screen.width, 200), "Player: " + playerScore + " CPU: " + cpuScore, style);
    }
