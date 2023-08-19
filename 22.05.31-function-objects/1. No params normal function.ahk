SetTimer(funcObj, -1000)

funcObj() {
   MsgBox("hi")
}

;Deleting the timer
SetTimer(funcObj, 0)