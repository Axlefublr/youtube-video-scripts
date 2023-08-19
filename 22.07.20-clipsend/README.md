"Send" is actually pretty slow.

The more text you want to send, the longer it will take to send it.

I'm sure you've had a situation where you sent a looot of text and then wished you didn't.

On the other hand, if you *paste* the text instead, the time it will take won't be affected by the *size* of the text.

Be it a single character or two paragraphs, on ahk's side it will be no different.

That's why I created a function that does exactly that: it sends text by pasting it.

All you have to do is specify what you want to paste as the first parameter.

And don't worry: it takes care of your previous clipboard, so you won't lose whatever you had copied beforehand.

Now, we're just pasting text, so if you want to send actual *keys*, you will need to use "Send" still, ClipSend is only for sending literal text

There's another limitation. You can't use multiple clipsends in a row.

I'll explain why this happens:

We set the clipboard to be some value, then we send the key of ctrl v to send the clipboard.

While the application we're sending text to processes the input, we have already started executing the second clipsend.

In which, we change the clipboard again.

So, all while the app is still getting the input, we change it multple times, and it ends up only receiving the last one, so it pastes it three times.

Now, you might think that putting a sleep would solve the issue, and you would be right - technically

Because of that sleep, using a *send* might actually be faster if the text is small enough, so that would defeat the speed that clipsend provides

Therefore, I recommend clipsending all the text at once

And, instead of sending enters in between to get newlines, use ahk's newline character or a continuation section.

Now, the code.

There are a few parameters that you should look at.

Besides the first one, where you specify what you actually want to send, you're also sending an ending character by default.

I often use clipsend to paste links, so having a space after a link is nice to have.

Maybe you want a newline after whatever you send, you can specify that

If you want to disable this behavior, just specify an empty string

By default, your previous clipboard is kept intact.

You can change this if you specify the *third* parameter as false, then you'll get whatever you just clipsent in your clipboard

And the last one is the amount of milliseconds until your clipboard is reverted to what it was before the clipsend

Let's go through the steps of the function.

We store the previous value of the clipboard in a variable so we can revert it later

Then empty the current clipboard so we can clipwait for it to be filled with the value that we want to send, plus the ending character, which by default is a space

Now to actually send ctrl v as a hotkey to send our clipboard.

The reason why we're not using the easier notation is because writing out the full down and up motions is more reliable

Now that we sent our clipboard, we can't immidiately switch our clipboard back to prevclip.

We need to wait for it to finish pasting itself, and only then make the revert

For that, we start a timer so the script can do other stuff in the meantime of waiting for the timeout

In other words, to not occupy the thread

We set the clipboard to the state that we backed up earlier

In the amount of milliseconds that we specified in the last parameter

To reiterate: clipsend itself doesn't take 50 milliseconds to execute

Reverting the clipboard does

And if you're using clipsend with hotkeys, without spamming, you won't notice this happening since 50 milliseconds is quite fast

There are a few limitations of this function, but for its purpose, it's incredibly useful

Because the speed of clipsend is blazingly fast compared to send

Now, I'm not advertising breaking Discord's TOS, but the difference is incredibly visible on discord

How do I know?

I overheard it in a bar, yeah

Alright, thank you for watching, I'm gonna leave a link to this function in the description

Have a good day :)
