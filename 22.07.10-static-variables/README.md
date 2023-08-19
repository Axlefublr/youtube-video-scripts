Let's say you want to create a toggle.

A function that does one thing first, then the second, then the first again and so on.

How would you go about it?

The way to do it in v1 would be creating a global variable and passing it into the function.

In v2, you don't have to deal with global variables pretty much at all.

I personally don't use a single one.

So, how do you create a toggle? Using *static* variables! Let's write this.

First, we define the static variable with the "static" keyword, and optionally assign it to a value.

Then we assign the variable to the opposite of itself and create the branches it will go to depending on its *eventual* state.

Well, this is a fully working example, but I'm sure you actually want to learn *how* static works.

Variable definitions have *two* stages in them.

Declaration and assignment.

When you declare a variable, you're saying "this variable exists and it's *this* type".

The variable that you've now declared doesn't *have* a value yet, it's Unset.

In the next step, you assign the declared variable to a value.

In ahk, we don't usually see the first step of declaration, since the *scope* of the variable is usually implicit.

In other languages though, you might have to specify many other things, like if a variable is immutable, what type it is, its scope, so on.

Ahk abstracts all of that away, so we don't see the declaration part often, but it is still there.

When you declare a variable, you usually also assign a value to it.

But you actually don't have to: you can separate the two steps and assign the value later, leaving the variable unset.

The reason why this is important to know is to realize that "static" isn't just some random word. It's a part of the declaration of a variable.

Because of that, a static declaration can act differently from a normal declaration.

Now, *how* is it different?

You probably know that local variables are discarded when you return out of the function, so you have to actually return the values you want to use.

"Static" changes this behaviour: the values of static variables are remembered between calls.

So here we define what's going to be the first value of the variable.

This line is only going to run once.

All the following function calls it will be skipped, because now we have the value it ended up being at the end of the last function call.

So, it starts out with the value of true, we make it opposite, so now it's false.

The next time we run the function, it will see the variable as false, instead of defining it again as True.

And that's how every time we run the function, we get a different value.

We can extend this to *remember* any variable that we want to remember. Here's how we would make a counter, for example.

Here's a different example that I came across some time ago.

We want to get the coordinates the first time we run the function.

Then actually click those coordinates the second time we run the function.

Without static, the coordinates we got would get discarded, so we couldn't use them in the next step.

So we just define static variables to remember the coordinates and boom! We can safely use them.

By using static, you can avoid a big amount of global variables you would otherwise have to use, keeping your functions nice and clean.

But what if *multiple* functions need to use the same variable?

The short answer is classes, the long answer is going to be in a future video.

I'll leave a link to some examples of how I use static variables, in the description.

Thank you for your time and goodbye :)
