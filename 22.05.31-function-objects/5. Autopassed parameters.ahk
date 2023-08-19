;Parameters that are passed to the function automatically
;You have to provide space for them, but don't need to actually pass them yourself for the most part

guiCtrl.OnEvent("DoubleClick", funcObj.Bind(yourParam))

funcObj(yourParam, guiCtrl, RowNumber) {
   
}