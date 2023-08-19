Function() {
   MsgBox "1"
   MsgBox "2"
   MsgBox "3"
}

Arrow() => (MsgBox("1"), MsgBox("2"), MsgBox("3")) ;A return can only evaluate and return a single expression. To use multiple expressions, use () to make them into a single expression, that still gets evaluated from left to right


; Function()
Arrow()

; []{}() everything that is inside of brackets is treated as if it's being written on a single line, even if it technically isn't