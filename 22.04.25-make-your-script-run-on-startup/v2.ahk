;Function that lets you select a file to run on startup
StartupRun() {
   selectedFile := FileSelect("S", A_WorkingDir)
   SplitPath(selectedFile, &fileName)
   FileCreateShortcut(selectedFile, A_AppData . "\Microsoft\Windows\Start Menu\Programs\Startup\" . fileName . ".lnk")
}
+!f::StartupRun() ;Hotkey example

;This code makes the current script run on startup
SplitPath(A_ScriptFullPath, &fileName)
FileCreateShortcut(A_ScriptFullPath, A_AppData . "\Microsoft\Windows\Start Menu\Programs\Startup\" . fileName . ".lnk")
