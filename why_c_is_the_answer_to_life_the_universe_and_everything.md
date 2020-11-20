Maybe I'll write this properly some day, but I started on Fri Nov 20, 2020. 

# Why C is the Answer To Life, The Universe And Everything

I'm probably one of the most outstanding C programmers you'll ever meet.  Not because I'm particularly good.  Or that I think deeply about things, or that I'm well informed or even that smart.  But, that I believe if people understood C we would see its application and adoption more widely.  That "solutions" in new programming languages and paradigms would pale in comparison to the solutions that are found within the toolbox that we already have.  C was *far* from the first language I learned, and it may not be where I land, but, at least let me share this portion of my journey.

Let's start by what C isn't.  C isn't a DSL, Sure, R exists, Matlab, too.  You've got CSS and HTML.  And C isn't JavaScript (or that branch of the world) but man is JavaScript a lot like C in all the right ways.  It's not a language with `vec4` as a first rate citizen so maybe compiling your GPU programs in TinyCC or writing assembly shader code isn't the best all around way to write fragment shaders for your games.  C isn't some way of defining your problem that a computers resolves your issue algebraically, or some sort of semantically pure way of building on the shoulders of generations of giants. And God-forbid - C isn't a visual programming language.

But let's talk about what C is.  It is a spectacularly clear way of telling a computer what it should do to accomplish a task you would like done.

Don't get me wrong, there are some points where C is as sharp as a cat walking across you as you lay asleep in bed 45 minutes before your alarm goes off.  But, my argument here is many times, the solutions to reduce the pain have deeper taxes that are difficult to see and drastically change the cost-benefit analysis of solving problems.

In programming you have abstractions and paradigms.  In his [2020 talk](https://www.youtube.com/watch?v=P2yr-3F6PQo), Robert "Uncle Bob" Martin asks if we've seen every ~~programming langauge~~ paradigm and deeply explores. "Paradigms are about restrictions" Modular Paradigms are restrictions on complexity.  Functional Paradigms are discipline imposed on assigment.  "Structured paradigms" constrain program control flow. "Object Oriention" is basically prolymorphism, but discipline imposed indirect transfer of control (like function pointers). If you can perform assignments, your programming language isn't functional.  If you can perform a `goto` your language isn't structured. If you have pointers to functions your language isn't realy `object oriented`.  Hybrid lanugages keep the powers that paradigms try to restrain.  Isn't it interesting that the most useful languages are the ones which don't force the paradigms?

C is procedural.  Unabashedly.  Instead of trying to conceptualize how to describe your problem to the computer, you can give it a series of steps to perform to solve your problem.

Some paradigms, that once looked so fruitful, that so many of us (Me included!) bought hook line and sinker, have deeper more existential problems that turn to chains and hold anyone but the novice back. Brian Will, in his talk [Object-Oriented Programming Is Bad](https://www.youtube.com/watch?v=QM1iUe6IofM) proclaims itself to be **THE MOST IMPORTANT PROGRAMMING VIDEO YOU WILL EVER WATCH** is only true just because of the pervasiveness the lies Java and heavily-object-oriented C++ have fed us.  When it comes to elegance, simplicity, flexability, readability, maintainability and structure, with all but the simple "cat" "dog" abstract from "pet" hard object orientation devolves into squaring a circle. "Object orientation delivers illusions." To be clear - Brian at the time of writing this is still a C++ programmer, just an advocate for procedural languages.  When I watched Brian Will's video, I was a die-hard OOPer, and indeed, muchto my shock and existential horror, it became literally **THE MOST IMPORTANT PROGRAMMING VIDEO** I have **EVER WATCH**ed.


Uncle Bob, like so many others, sees the idiomatic C of the 1970s as where the language ended.  But, the language has not ceased to evolve.  The vowel sounds and consanants may have remained largely fixed (bar mixed declarations, VLAs, and designated initializers).  The language itself, has changed, grown, dialects have surged upward and decayed.  Styles and vocabularies have meyandered and evolved.  The C we have today is a far cry from the C you were left with in the 1970s, 1980s, 1990s, and even early 00's.

Need to open .png's? .jpg's?  Just `#include <stb_image.h>` Don't worry - it also includes all the source code so you don't need to worry about library linking.  Gzipped streams, music playback, opening windows and accepting input.  The pain from behemoths like `libz` `libogg` and `SDL` has been replaced by `puff.h` `stb_vorbis` and `CNFG.h`.

No longer is C unable to introspect, it has become homoiconic, able to manipulate itself, TinyCC has unlocked C's ability to modify itself and generate new code.  Though some say this way leads madness, those who believe code is the data and data is the code no longer need to be mailed off to some distant island.  Instead they can be integrated, to live in their own crazy world right down the street from us.

The benefits of a language that lives on a virtual machine fall on deaf ears when even enormous C projects can be ported to entirelly different architectures with little to no changes in code. Porting servers from x86 to xtensa microcontrollers, protocol interpreters, all of these, though extremely painful 10 years ago, have become almost trivial.  And the taxes and pain the virtual machine costs vaporizes.

* Maybe touch on garbage collection

There's an interesting question Uncle Bob asks at the beginning of his talk.  Why is his laptop, 6.4x10²² times more powerful than his PDP8 and what have we done with that power?  Why is everything still so slow? To which he prompty changes topic.

* Chesterton's Fence
* Simplicity: Java started simple, but became complex
* C is unique.  It is a language that started simple and elegant, and like so many others was burden down by itself over time. Devolving into a madness of underscores, macro over-use and `LRESULT CALLBACK MainWndProc( HWND hwnd, UINT msg...` no wonder Microsoft has abandoned C.  But, the rest of the world hasn't.  Though it's gone through a lot of this cycle.  The cycle so many other languages have gone through, somehow C has emerged on the other side.  Victorious.  C is... somehow... simple... again.

## FreeRTOS

* Wrong stack bad
But they forgot
* Coroutines
The tax.

## 

##



