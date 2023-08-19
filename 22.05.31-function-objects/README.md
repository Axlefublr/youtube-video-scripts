You're gonna see the term "function object" quite in a few places in the docs.

At first, it sounds complicated and poorly explained. 

So, I'm gonna explain how function objects work. 

After this tutorial you're gonna be able to easily use them.

Let's start out with an easy example. 

Remember labels from v1? Well, function objects are an improved version of labels.

Let's say you want a function to run in a second. How do you get the function object you need? 

It's actually really simple. 

Let's write an example function that doesn't take any parameters. 

All you have to do now is remove the brackets and that's it. 

When you want to delete that timer, you mention that same function object and specify the new time, which is 0 for deletion

Now, do you really need to create a function to call one other function? 

The issue is only the fact that it has parameters that have to be passed. 

There are two ways to make this less clanky. 

First, using an arrow function. I describe them in detail in my tutorial on arrow functions. Link in the description. 

Since it returns a function object, we can rewrite what we just did inside of the first parameter

There's the second option, which you might like more: the bind method

We bind the parameter onto the function and this whole expression returns the function object we need

Wait, what did we do just now? Let's go step by step. 

Let's say we have a function that takes parameters

To call it, we pass those parameters.

Let's say you use the same parameter for the same function a lot. 

It would be nice to have a way to *preset* that parameter and just call *that* instead

*Bind* is exactly that

Now, instead of setting the parameter every time, we refer to the object that already has those parameters set

This type of object is called a Bound function, and almost always you can use it as a function object

You can use bind with both built in functions, and your own.

Matter of fact, if a function doesn't require parameters, so doesn't bind.

And you can bind it without *parameters*, just like you would when *calling* the function

Coming back to these two examples, what's the difference? 

With the arrow, we're creating a new function that evaluates expressions to the right. 

That's going to be the way to go when there's more than one function call that you want to have

On the other hand, if you're just going to call one function, you should use bind instead

And don't forget the solution that works for both situations. 

Its only negative is that your settimer is not written nicely on one line anymore, but sometimes you'll need to do it this way.

There's one more thing that's pretty confusing at first.

In some places, especially onEvent, some parameters will be passed automatically.

You might think that you have to pass them yourself, but that's actually not the case — you'll get an error

All you have to do is provide them space so they can get passed, regardless of whether you're going to use them or not

If you want to pass your own parameters, you have to put them *before* the autopassed parameters

And not forget to bind it to your function object

That's all the info you're going to need to freely use function objects in your scripts. 

Have a good day :)
