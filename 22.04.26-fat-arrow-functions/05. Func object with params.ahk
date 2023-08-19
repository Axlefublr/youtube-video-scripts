a := 3
b := 4

Function(a, b) {
   return a+b
}

funcObj := Arrow(a, b) => a+b ;You can still pass parameters even if...


MsgBox Function(a, b)
MsgBox funcObj(a, b) ;you're calling the function object instead of the function itself