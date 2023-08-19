;Function that lets you select a file that will run on PC boot
StartupRun() {
   FileSelectFile, selectedFile, S
   SplitPath, selectedFile, fileName
   FileCreateShortcut, %selectedFile%, %A_AppData%\Microsoft\Windows\Start Menu\Programs\Startup\%fileName%.lnk
}
+!f::StartupRun() ;Hotkey example

;This code makes the current script run on startup
SplitPath, %A_ScriptFullPath%, fileName
FileCreateShortcut, %A_ScriptFullPath%, %A_AppData%\Microsoft\Windows\Start Menu\Programs\Startup\%fileName%.lnk
