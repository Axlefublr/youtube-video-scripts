Have a look at my clock! The time one

It shows the time and date, since it's a screenshot you can't see, but it actually updates the time every half a second

You could have it opened permanently and you'll still get the correct time

But there's a clock already? Thing is, I don't like moving my mouse to see the time; I would much rather just press a hotkey. And so can you now!

How can you use it? First, copy my code linked in the description and paste it into your script

Make a hotkey to call Clock and that's it! Right now I'm gonna explain how the code works

We get the time that's going to appear first when you call the function

These variables we get are only used once, so the separation is purely for readability

Time, weekDay and Date all have different fontsizes, as you might have noticed

Setfont works almost like a directive. Every gui control created under it will have that font. 

When we use setfont again, *that* will become the new rule 

When we create the texts, why are we going to use these variables only once? 

Thing is, if you want to update a gui text, you can't just update a variable it started with. 

These variables are only the *starting* values

For us to change the text later, we get the text gui objects and change their *text* property

Using the function object of these three lines, we run them every half a second.

Right now, we have three things to take care of. 

We have to make sure the gui is destroyed when it's closed, make it easier to close it using escape and remember to delete the timer we set. 

If we forget to delete it, once the gui is destroyed, we're gonna get an error

So, when we press escape or close the gui, we run destruction

That does three things: delete the timer, disable the hotkey we made and destroy the gui

That's it for today, goodbye
