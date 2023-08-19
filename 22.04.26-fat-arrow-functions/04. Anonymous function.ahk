Function() {
   return 1+2
}

funcObj := () => 1+2 ;If you're getting the function object, you don't even have to name the function
;The brackets are still needed since they are a symbol to ahk that "this is a function"


MsgBox Function()
MsgBox funcObj()