---
layout: post
title: "Syntax highlighting for Octopress"
date: 2015-01-17 11:12:37 -0600
comments: true
categories:
-   tools
-   Octopress
-   algorithm

---
It's relatively simple, but I always forget how it's done.  In the
interest of documenting useful information for myself, here is how to
use [syntax highlighting with code blocks in Octopress](http://octopress.org/docs/blogging/code/).

<!--more-->

Here are some examples of languages I typically use:

``` csharp
private IEnumerator GUIMoveToPosition(Vector3 newPosition, float duration, RectTransform rect) {
  float elapsedTime = 0;
  Vector3 startingPos = rect.position;
  while(elapsedTime < duration) {
    rect.position = Vector3.Lerp(startingPos,
                                 newPosition,
                                 elapsedTime / duration);
    elapsedTime += Time.deltaTime;
    yield return null;
  }
}

```

``` python
def update(self, time_elapsed):
    self.tick += 1
    self.total_time += time_elapsed

    if self.mode:
        self.mode.update(time_elapsed)

```

``` clojure
(defn valid-string? [s]
  "Valid strings are non-empty strings that do not contain
  [ (commonly used to denote parts of the song and which rappers are
  rapping) and : (commonly used in the album info and transcriber
  info)."
  (and (not (contains-char? s \[))
       (not (contains-char? s \:))
       (not (contains-char? s \"))
       (not (contains-char? s \())
       (seq s)))
;;; http://clojuredocs.org/clojure_core/clojure.core/empty_q
;;; Please use the idiom (seq x) rather than (not (empty? x))
```

## Bonus: Help me refactor this code

I think there's some way to refactor these two similar functions so
they don't share code, but I don't see it.  If you have a clever way
to offload the common functionality, let me know in the comments
([gists](http://gist.github.com) preferred).

``` csharp
// NOTE: there are some differences between the two functions
// because I'm still adding funcitonality.  I think there should be
// a way to pull out some of the common functionality so I don't
// have two functions that share code.  Maybe by separating the
// boundary checks from the actual "counting" steps?

void Countdown () {
  int iTargetHp = iHp + 1;

  // If the rolling hp reaches the hit point above iHp then we can
  // stop the rolling because each RollEvent effectively moves past
  // the current iRolHp.
  if(iRolHp == iTargetHp) {
    // Start Coroutine to return reels to original positions
    StartCoroutine(WaitAndResetReels(RollDir.Down));

    CancelInvoke("Countdown");
  }
  if(iRolHp <= 0) {
    StartCoroutine(WaitAndResetReels(RollDir.Down));

    // TRUE DEATH!
    CancelInvoke("Countdown");
  }
  // If the rolling HP is larger than the target HP and positive,
  // then roll down.
  if(iRolHp > iTargetHp || iRolHp > 0) {
    RollEvent(RollDir.Down);
  }

  iRolHp = iRolHp + (int)RollDir.Down;

}

void Countup() {
  int iTargetHp = iHp - 1;

  // If the rolling hp reaches the hit point below iHp then we can
  // stop rolling because each RollEvent effectively moves past the
  // current iRolHp.
  //
  // Also take care of some nasty edge cases resulting in two calls
  // to WaitAndResetReels.
  if(iRolHp == iTargetHp & iRolHp < iMaxHp & iRolHp != iMaxHp) {
    StartCoroutine(WaitAndResetReels(RollDir.Up));

    CancelInvoke("Countup");
  } else if(iRolHp >= iMaxHp) {
    iHp = iMaxHp;
    StartCoroutine(WaitAndResetReels(RollDir.Up));

    // Maxed out HP.
    CancelInvoke("Countup");
  }

  // If the rolling HP is smaller than the target HP and less than
  // Max HP, then roll up.
  if(iRolHp < iTargetHp || iRolHp < iMaxHp) {
    RollEvent(RollDir.Up);
  }

  iRolHp = iRolHp + (int)RollDir.Up;

}
```
