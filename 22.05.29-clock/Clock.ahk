tool_Clock() {

	static clock_hwnd

	if IsSet(clock_hwnd) && WinExist(clock_hwnd) {
		; win_MinMax(clock_hwnd) ;Same thing as the code below, but drier and more reliable. Dependency on Win.ahk (https://github.com/Axlefublr/Main/blob/main/Lib/Win.ahk)
		if WinActive(clock_hwnd)
			WinMinimize(clock_hwnd)
		else
			WinActivate(clock_hwnd)
		return
	}
	
	;Get the time variables
	clock_Time   := FormatTime(, " HH:mm:ss")
	, clock_Week := FormatTime(, "dddd")
	, clock_Date := FormatTime(, "d MMMM")

	;Create the gui
	g_Clock := Gui(, "Clock")
	g_Clock.BackColor := "171717"

	clock_hwnd := g_Clock.hwnd

	;Add text
	g_Clock.SetFont("S40 cC5C5C5", "Consolas")
	g_Clock_Time := g_Clock.Add("Text", "w237 y-20", clock_Time) 

	g_Clock.SetFont("S30")
	g_Clock_Week := g_Clock.Add("Text", "w237 y+35 Center", clock_Week)

	g_Clock.SetFont("S26")
	g_Clock_Date := g_Clock.Add("Text", "w237 Center", clock_Date)
	
	;The func obj is separate because we'll need to disable the timer outside of it
	timeCheck := () => (
		g_Clock_Time.Text := FormatTime(, " HH:mm:ss"),
		g_Clock_Week.Text := FormatTime(, "dddd"),
		g_Clock_Date.Text := FormatTime(, "d MMMM")
	)

	;Change the time text every half a second for better accuracy
	SetTimer(timeCheck, 500)

	;Takes care of all the trash
	Destruction := (*) => ( ;the * takes care of the required parameters for hotkey and onevent
		SetTimer(timeCheck, 0), ;Since it references a function object, it can be outside of the settimer's thread
		HotIfWinActive("ahk_id " clock_hwnd),
		Hotkey("Escape", "Off"),
		g_Clock.Destroy()
	)

	HotIfWinActive("ahk_id " clock_hwnd)
	Hotkey("Escape", Destruction, "On")
	g_Clock.OnEvent("Close", Destruction)

	g_Clock.Show("W350 H320 y0 x" A_ScreenWidth / 20 * 15.3)

}
