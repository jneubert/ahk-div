#SingleInstance force
;#NoEnv 
#Warn

; Search for first GND ID

OpenURL(u) {
	WinActivate, Program Manager
	Run %u%
	return
}

^F1::
	;WinGetText, document
	Send, ^a
	Send, ^c
	Send, ^v
	FoundPos := RegExMatch(Clipboard, "ms)^3000 .*?ID: gnd/(.*?)\$", gndId)
	MsgBox % gndId1
	Return

^+h::
	Send, ^c
	url =https://tools.wmflabs.org/wikidata-todo/resolver.php?project=reasonator&lang=de&prop=P227&value=%Clipboard%
	OpenURL(url)
	Return

; Not-Aus
^Esc::ExitApp

	