---
layout: post
title: "Persistent Data in Unity"
date: 2014-08-09 11:09:15 -0500
comments: true
categories:
-   Unity
-   design
-   C#
---
I'm interested in having some data remain available, even though I'm switching Scenes in Unity.  In other words, I want this data to remain persistent.  As you'll see below I was tempted to use `PlayerPrefs` to store the data, but, according to [this Unity Live Training on Data Persistence](https://www.youtube.com/watch?v%3DJ6FfcJpbPXE), `PlayerPrefs` is not the best way to make data persist over multiple Scenes.  `PlayerPrefs` is an okay place to store non-critical data, like the audio volume, window size, full-screen state&#x2013;you know preferences.  I'll go ahead and show what I believe to be the correct way to store persistent data before talking about `PlayerPrefs` later.

<!--more-->

## Persistent data

To safely and reliably store persistent data, the Unity tutorials suggest that you need to assign a "kinda" Singleton design patterny script to an empty `GameObject` that will persist across Scenes.

    using UnityEngine;
    using System.Collections;

    public class GameControl: MonoBehaviour {
      public static GameControl control;

      public float health;
      public float experience;

      void Awake() {
        if(control == null){
          DontDestroyOnLoad(gameObject);
          control = this;
        } else if(control != this) {
          // There can be only one!
          Destroy(gameObject);
        }
      }
    }

The `static` reference means that we can just access the values in the `GameControl` script.

## How to access data in the GameController.

    GameController.control.health = 100;

## Writing persistent data to a binary file

The persistent data that's under the control of the `GameController` is perfectly happy hanging out when your application is running.  It will persist between Scenes when other data is wiped out by Unity's garbage collection.  But what if you want to maintain persistent data when the application is closed.

Ah hah!  Finally, an answer to my nagging question about writing persistent data to plain text files, like `PlayerPrefs` or simply a file in a local directory.  Wouldn't a player be able to modify the data?

Enter the binary format:

    // Add two more libraries
    using System;
    using System.Runtime.Serialzation.Formatters.Binary;

Where do we save it?  The persistent data path: `Application.persistentDataPath`.  We'll need one more library to do some input and output to files:

    // Requires one more library and we're ready to get cooking with some
    // methods
    using System.IO;

    public void Save() {
      BinaryFormatter bf = new BinaryFormatter();
      FileStream file = File.Open(Application.persistentDataPath + "/gameInfo.dat",
                                  FileMode.Open);

      PlayerData data = new PlayerData();
      data.experiencePoints = experiencePoints;
      data.playerLevel = playerLevel;

      bf.Serialize(file, data);
      file.Close();
    }

    public void Load() {
      if(File.Exists(Application.persistentDataPath + "/gameInfo.dat")) {
        BinaryFormatter bf = new BinaryFormatter();
        FileStream file = File.Open(Application.persistentDataPath + "/gameInfo.dat",
                                    FileMode.Open);
        PlayerData data = (PlayerData)bf.Deserialize(file);
        file.Close();

        experiencePoints = data.experiencePoints;
        playerLevel = data.playerLevel;
      }
    }

Now we need to make the `PlayerData` class that we will tag with `[Serializable]` so Unity will know that we want to write this to a binary file at some point in the future.  This affects how Unity stores the data internally, but it doesn't really change how we interact with it.

    [Serializable]
    class PlayerData {
      // TODO: see about making gets and sets.
      // TODO: automate the generation of this data structure.  See:
      // http://forums.devx.com/showthread.php?170650-How-to-dynamically-add-property-to

      // Add new variables for loading and saving here.
      public int experiencePoints;
      public int playerLevel;
    }

After writing up this article, I came across an older, possibly better article on Unity Gems.  Please check out that write-up and all of the great content on the site.  <http://unitygems.com/saving-data-1-remember-me/>

My full `GameController` data persistence Singleton script is available in [this gist](https://gist.github.com/zerosalife/6f6e811b27761d287ea5).

So, that's the best solution I've found to date for having persistent data across scenes and play sessions.  I've included my rough first stabs at the problem below.  Keep in mind that anything following this point is just included just to make my notes available, and it's not meant to be a guide.

## Old notes: PlayerPrefs

In order to have persistent data between Scenes, I was previously going to make use of Unity's `PlayerPrefs`, a class that implements persistent data storage for `ints`, `floats`, and `strings`.  Notably absent are useful data types like `Vector3` to maintain, for example, `transform` data between Scenes.  Some of the solutions I found may still be helpful for more storing complex data types in `PlayerPrefs`.

One potential solution is to simply set a `GameObject`'s `transform.position` to some constant `Vector3` value in the freshly loaded Scene.  While this is possible in some applications, I'm going to assume that eventually you'll want to transfer some dynamic position information between Scenes.

Here are two potentially helpful sources to achieve this:

<http://www.theappguruz.com/tutorial/store-vector3-data-easily-using-json-parsing-possible-using-playerprefs/>, based on work by Mehta Dakshil.  While JSON parsing looks interesting, it requires an external `.dll`, `JsonFx.Json.dll`.  And I'm not interested in external dependencies here.  It may work great for you.

[<http://wiki.unity3d.com/index.php?title=ArrayPrefs>](http://wiki.unity3d.com/index.php?title%3DArrayPrefs), based on work by Mario Madureiera Fontes and Daniel P. Rossi.  (Note: since `GetVector3` depends on `GetFloatArray`, there could be some error due to `GetFloatArray` casting strings to floats.  But the error introduce in the resulting `Vector3` is unlikely to be noticeable.)

Actually, see a more updated version here: <http://wiki.unity3d.com/index.php/ArrayPrefs2>, which is based on work by Eric Haines.

According to the text, the script should be placed in the `Standard Assets` directory, so that it can be accessed from both `C#` and `Boo` scripts.

To see a faster implementation for mobile devices, where the data to be saved in PlayerPrefs is cached in memory, see: <http://www.previewlabs.com/writing-playerprefs-fast/>.
