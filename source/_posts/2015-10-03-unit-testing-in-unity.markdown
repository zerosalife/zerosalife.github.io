---
layout: post
title: "Unit Testing in Unity"
date: 2015-10-03 09:44:58 -0500
comments: true
categories:
-   tools
-   Unity
-   C#
---
How to use UnityTestTools to create unit tests for Unity CSharp

<!--more-->

## Setting it up

Download the [UnityTestTools package](https://www.assetstore.unity3d.com/en/#!/content/13802) from the Unity Asset Store.

## Import the package

We are going to need the `Common`, `Assertion`, and `UnitTesting` directories.

## Create a Tests directory

We need a place for the tests to live.

One important thing to remember is that the scripts in the `Tests` directory need to be accessible by the `UnityTestTools` in the Editor so we'll put them in `./Tests/Editor/`.

## Make a namespace

`UnityTestTools` will organize our tests by top-level `namespace` declarations defined in each of the tests' files.  Then we follow it up with a `Category` attribute that names the category of tests that live inside the `internal class` we define in the namespace.

{% codeblock lang:csharp ./Tests/Editor/ExampleTests.cs %}
namespace ExampleTests {
    [Category("Example Tests")]
    internal class ExampleTests {
        // tests go here
    }
}
{% endcodeblock %}


## Test attributes

Use the `[TestFixture]` and `[Test]` attributes to let the Unity Test Tools Unit Test Runner know where your tests are.

You can also use the `[Category]` attribute to add semantic labels to your tests.

## Making assertions

The Testing Framework uses the out of date NUnit version `2.2.10`

For reference see: <http://www.nunit.org/index.php?p=assertions&r=2.2.10>

## An example test

{% codeblock lang:csharp ./Tests/Editor/ExampleTests.cs %}
namespace ExampleTests {
    [Category("Example Tests")]
    internal class ExampleTests {
        [Test]
        void Example() {
            Assert.AreEqual(1 + 1, 2);
        }
    }
}

{% endcodeblock %}

## Actually run the tests

Open the Unit Test window from the editor:

- Click on the `Unity Test Tools` menu
- Select `Unit Test Runner`

You can also open the Unit Test Runner window with the keyboard shortcut `Alt-Cmd-Shift-U` on a Mac.

Simply, click on the `Run All` button to run the tests.

## Going further

[Unity Test Tools](https://www.assetstore.unity3d.com/en/#!/content/13802) has support for Integration tests and assertions in addition to the vanilla unit test I described above.

There are plenty of features that I haven't covered here, so dig in to the examples that come with the Unity Test Tools package and let me know what you've learned in the comments below or on twitter [@zerosalife](http://twitter.com/zerosalife).
