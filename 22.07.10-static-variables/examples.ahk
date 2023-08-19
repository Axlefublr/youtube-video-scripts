;If you have a bone to pick with the quality of my code, assume it's already been rewritten or deleted. I'm not updating this file, so you could be seeing code that's actually 2 years old

spotify_Discovery() {
	/*
		Usually you'd use the wintitle of ahk_id g_added.Hwnd, but just having a variable is 
		far easier to work with
		Using isStarted, I can Show and Destroy the gui with the same hotkey
	*/
	static isStarted := False
	static var := 0 ;This is just a counter, since it's static it remembers its last value

	if isStarted { ;If the gui already exists, we just destroy it and do all the other things we need to do
		Destruction()
		return
	}

	onRightClick(*) {
		ControlClick_Here("ahk_exe Spotify.exe", "R")
		var++
		g_added_text.Text := var
		if var >= 15 {
			Destruction()
			var := 0
		}
	}

	Destruction(*) {
		HotIfWinActive("ahk_exe Spotify.exe")
		Hotkey("RButton", "Off")
		Hotkey("Escape", "Off")
		g_added.Destroy()
		var := 0
		isStarted := False
	}

	static g_added ;We're making the gui object static so we can destroy it the next time we run the function
	g_added := Gui("AlwaysOnTop -caption")
	g_added.backColor := "171717"
	g_added.SetFont("s50 cC5C5C5", "Consolas")
	g_added_text := g_added.Add("Text", "W200 X0 Y60 Center", "0")
	g_added.Show("W200 H200 X0 Y0 NA")

	HotIfWinActive("ahk_exe Spotify.exe")
	Hotkey("RButton", _Discovery_RightClick.Bind(), "On")
	Hotkey("Escape", _Discovery_Destruction.Bind(), "On")
	g_added.OnEvent("Close", _Discovery_Destruction.Bind())
	g_added_text.OnEvent("Click", (*) => var := g_added_text.Text := g_added_text.Text - 1)
	g_added_text.OnEvent("DoubleClick", _Discovery_Destruction.Bind())

	isStarted := True ;We could technically update this variable above too, but it *feels* better in this place
}

AnimeDownload() {
	static NextEpisode := 0 

	r_AllFiles := []
	Loop Files Paths.OnePiece "\*.mp4" {
		r_AllFiles.Push(A_LoopFileName)
	}
	LastEpisode := StrReplace(r_AllFiles[-1], ".mp4", "")

	NextEpisode := LastEpisode + 1 ;We get the episode number that goes after the last downloaded episode

	RunLink("https://gogoanime.sk/one-piece-episode-" . NextEpisode) ;The last part of the link is just the episode number, so we can use this to run the link with the proper number

	PasteAndIncr := (*) => (
		ClipSend(NextEpisode), ;Clipsend is a better Send, essentially. It pastes the text instead of sending it, which is almost guaranteed to be faster. To check out the function, go to my Global library in Personal/Lib https://github.com/Axlefublr (if I just left a link to the lib, it could get outdated)
		NextEpisode++, ;This is the entire reason NextEpisode is static. Every time I download a new episode, I want the hotkey I define later to paste the *next* episode.
		/*
			So let's say the last downloaded episode is 402. I run the function and it opens the page of the 403 episode. I go on to download it and press capslock, that pastes 403. Then I download the following episode, which pastes 404. It goes on and on until one piece is finished
		*/
		Send("{Enter}")
	)

	Destruction := (*) => (
		HotIfWinActive("Save As ahk_exe chrome.exe"),
		Hotkey("CapsLock", "Off"),
		HotIfWinActive("Google Chrome ahk_exe chrome.exe"),
		Hotkey("CapsLock", "Off"),
		HotIfWinActive(),
		Hotkey("Escape", "Off"),
		NextEpisode := 0,
		ToolPeek("One piece disabled")
	)
		

	HotIfWinActive("Save As ahk_exe chrome.exe")
	Hotkey("CapsLock", PasteAndIncr, "On")
	HotIfWinActive("Google Chrome ahk_exe chrome.exe")
	Hotkey("CapsLock", (*) => CloseTab(), "On")
	HotIfWinActive()
	HotIf()
	Hotkey("Escape", Destruction, "On")
	
}

tool_RelativeCoordGetter() {
	static var := 0
	static initX
	static initY
	if !var {
		MouseGetPos(&locX, &locY)
		ToolTip("Initial position")
		initX := locX ;Example mentioned in the tutorial. We *remember* the X and Y with static, so the next time we run the function, we can use those X and Y
		initY := locY
		var := !var
		return
	}
	ToolTip()
	MouseGetPos(&loc1X, &loc1Y)

	relPosX := loc1X - initX
	relPosY := loc1Y - initY

	initX := 0
	initY := 0
	var := !var

	g_relative := Gui("AlwaysOnTop")
	g_relative.BackColor := "171717"
	g_relative.SetFont("s40 cC5C5C5", "Consolas")

	g_relative_textX := g_relative.Add("Text",, "Relative X: " relPosX)
	g_relative_textY := g_relative.Add("Text",, "Relative Y: " relPosY)

	topRightCorner := A_ScreenWidth / 8 * 5

	g_relative.Show("AutoSize NA y0 x" topRightCorner)

	Destruction := (*) => (
		Hotkey("Escape", "Off"),
		Hotkey("F1", "Off"),
		Hotkey("F2", "Off"),
		g_relative.Destroy()
	)

	toClip(text, *) {
		static var := 0 ;I will most likely only need to copy the value twice. One for X, second for Y. So if I copied two values, I'm most likely done. Now when I press *a* hotkey I implemented twice, the gui and all that is deleted
		var++
		A_Clipboard := text
		ToolPeek("copied " text)
		if var >= 2
			Destruction()
	}

	g_relative_textX.OnEvent("Click", toClip.Bind(relPosX))
	g_relative_textY.OnEvent("Click", toClip.Bind(relPosY)) 

	Hotkey("F1", toClip.Bind(relPosX), "On")
	Hotkey("F2", toClip.Bind(relPosY), "On")

	g_relative.OnEvent("Close", Destruction)
	Hotkey("Escape", Destruction, "On")

}