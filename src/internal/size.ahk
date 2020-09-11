
; tests
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
assert.test(exampleDict.size, 3)

; omit
exampleDict.clear()
