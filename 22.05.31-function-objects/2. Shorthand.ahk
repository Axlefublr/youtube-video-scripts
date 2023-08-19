;Arrow function
SetTimer(() => (MsgBox("hi"), MsgBox("2"), MsgBox("3")), -1000)

;Bind method
SetTimer(MsgBox.Bind("hi"), -1000)

;Both situations
Settimer(BoundFunky.Bind("hi"), -1000)

BoundFunky(text) {
   MsgBox(text)
}