;Global variables that we...
a := 3
b := 4

Function(a, b) { ;3. To get the sum of those global variables
   return a+b
}

Arrow(a, b) => a+b


MsgBox Function(a, b) ;2. Pass as parameters into the functions
MsgBox Arrow(a, b)



a := 3
b := 4

funcObj := (a, b) => a+b ;When calling a function object, we don't have to name the function, *even* when it takes in parameters


MsgBox funcObj(a, b) ;When calling a function object, we pass parameters into it