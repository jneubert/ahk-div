#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

;; Create PM20 folder ID links on Wikidata
;; based on a query result list
;; https://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/pm20_mnm_search.rq

;; Overall process
;; - ^+h : select entry and search Wikipedias
;; - manually select matching WP page
;; - ^+l | ^+ö | ^+ä : open WD item (en|de|fr)
;; - ^+j | ^+k : add unqualified or related link
;; - ^+o : save and cleanup tabs

;; Reload AHK script
^#!r::
Reload
Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, The script could not be reloaded.
return

;; work on new entry of pm20_mnm_search.rq: numerical part of the folder id is selected manually
;; - copy id to clipboard
;; - search for folder name in Wikipedias
^+h::
Send, ^c
Send, {Tab}{Tab}{Tab}{Enter}
return

;; on an English Wikipedia page
;; - load Wikidata item
^+l::
Send, ^fWikidata item{Enter}{Esc}{Enter}
return

;; on a German Wikipedia page
;; - load Wikidata item
^+ö::
Send, ^fWikidata-Datenobjekt{Enter}{Esc}{Enter}
return

;; on a Wikidata page
;; - add statement with folder id (from clipboard)
^+j::
Send ^f
Send, add statement{Tab}
Send, {Esc}
Sleep, 500
Send, {Enter}
Sleep, 1000
Send, P4293
Sleep, 1000
Send, {Down}
Sleep, 200
Send, {Enter}
Sleep, 500
Send, co/^v
return

;; on a Wikidata page
;; - add statement with folder id (from clipboard)
;; - qualify as related match
^+k::
Send, ^+j ; include creation of PM20 folder id statement
Sleep, 500
Send, {Tab}{Enter}
Sleep, 500
Send, P4390
Sleep, 1000
Send, {Down}{Enter}
Sleep, 500
Send, Q39894604
Sleep, 1000
Send, {Down}{Enter}
Sleep, 500
return

;; on a Wikidata page
;; - save
;; - close current tab
;; - close PM20 tab
^+o::
Send, {Enter}
Sleep, 500
Send, ^w
SetTitleMatchMode, 1
IfWinActive, Startpage
{
  Send, ^w
}

