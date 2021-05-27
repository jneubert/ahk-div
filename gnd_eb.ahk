#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

OpenURL(u) {
	WinActivate, Program Manager
	Run %u%
	return
}

; with clicked link to GND entry, search EconBiz for the GND ID
