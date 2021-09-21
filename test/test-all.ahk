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

assert.label("clone()")
assert.label("clone - check that new clone has methods")
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
dictClone := exampleDict.clone()
assert.test(dictClone.has(200), true)

; omit
exampleDict.clear()


assert.label("map()")
assert.test(exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"]), 3)
assert.test(exampleDict.get(200), "OK")
assert.test(exampleDict.map([500], ["Internal Server Error"]), 4)

; omit
exampleDict.clear()


assert.label("set()")
assert.test(exampleDict.set(200, "OK"), 1)
assert.test(exampleDict.set(403, "Access forbidden"), 2)
assert.test(exampleDict.set(404, "File not found"), 3)
; omit

assert.test(exampleDict.update(404, "File not found"), 3)
assert.test(exampleDict.update(500, "Internal Server Error"), 4)
exampleDict.clear()


assert.label("clear()")
assert.test(exampleDict.clear(), true)
assert.test(exampleDict.size, 0)

; omit
exampleDict.clear()


assert.label("remove()")
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
assert.true(exampleDict.remove(200))
assert.true(exampleDict.remove(403))
assert.true(exampleDict.remove(404))
assert.false(exampleDict.remove(500))
assert.test(exampleDict.size, 0)

; omit
exampleDict.clear()


assert.label("internal()")

; omit
exampleDict.clear()

exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
assert.test(exampleDict.size, 3)


assert.label("size()")
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
assert.test(exampleDict.size, 3)

; omit
exampleDict.clear()


assert.label("_hash()")
assert.test(exampleDict._hash(200), 200)
assert.test(exampleDict._hash(2000), 2000)
assert.test(exampleDict._hash(2000.1), 4656511348273210982)

; omit


assert.label("get()")
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
assert.test(exampleDict.get(200), "OK")
assert.test(exampleDict[200], "OK")

; omit
exampleDict.clear()


assert.label("has()")
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
assert.true(exampleDict.has(200))

; omit
exampleDict.clear()

;; Display test results in GUI
speed := QPC(0)
assert.fullreport()
msgbox, %speed%
ExitApp

QPC(R := 0)
{
	static P := 0, F := 0, Q := DllCall("QueryPerformanceFrequency", "Int64P", F)
	return ! DllCall("QueryPerformanceCounter", "Int64P", Q) + (R ? (P := Q) / F : (Q - P) / F) 
}
