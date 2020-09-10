#Include %A_ScriptDir%\..\export.ahk
#Include %A_ScriptDir%\..\node_modules
#Include unit-testing.ahk\export.ahk

#NoTrayIcon
#SingleInstance, force
SetBatchLines, -1

testDict := new dict()
assert := new unittesting()

; Start speed function
QPC(1)

assert.label("clone()")
assert.label("clone - check that new clone has methods")
testDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
dictClone := testDict.clone()
assert.test(dictClone.has(200), true)

; omit
testDict.clear()


assert.label("map()")
assert.test(testDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"]), 3)
assert.test(testDict.get(200), "OK")
assert.test(testDict.map(["test"], ["hey"]), 4)

; omit
testDict.clear()


assert.label("set()")
array := [1]
assert.test(testDict.set(200, "OK"), 1)
assert.test(testDict.set(403, "Access forbidden"), 2)
assert.test(testDict.set(404, "File not found"), 3)

; omit

assert.test(testDict.update(404, "File not found"), 3)
testDict.clear()


assert.label("clear()")
assert.test(testDict.clear(), true)
assert.test(testDict.data.Count(), 0)

; omit
testDict.clear()


assert.label("remove()")
testDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
assert.true(testDict.remove(200))
assert.true(testDict.remove(404))
assert.false(testDict.remove(500))

; omit


assert.label("internal()")

; omit
testDict.clear()

testDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
assert.test(testDict.size, 3)


assert.label("_hash()")
assert.test(testDict._hash(200), 200)
assert.test(testDict._hash(2000), 2000)
assert.test(testDict._hash(2000.1), 4656511348273210982)

; omit


assert.label("get()")
testDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
assert.test(testDict.get(200), "OK")

; omit
testDict.clear()


assert.label("has()")
testDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
assert.true(testDict.has(200))

; omit
testDict.clear()


assert.label("size()")
testDict.clear()


; omit
testDict.clear()

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
