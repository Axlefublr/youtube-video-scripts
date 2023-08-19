Arrow() => (
   R_Array := [1, 2, 3],
   for index in R_Array ;For in is not an expression: it's a keyword
      MsgBox(index)
)

Arrow() ;If you run this, you'll get an error, because you can't return what's not an expression


/*
for
in
if
else
loop
while
etc: everything that can't be written on a single line
*/
