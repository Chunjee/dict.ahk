#Include %A_ScriptDir%\..\export.ahk
#Include %A_ScriptDir%\..\node_modules
#Include unit-testing.ahk\export.ahk

#NoTrayIcon
#SingleInstance, force
SetBatchLines, -1

exampleDict := new dict()
assert := new unittesting()

; Start speed function
QPC(1)
