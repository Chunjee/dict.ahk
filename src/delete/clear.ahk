clear() {

	; perform
	this.data := []
	return true
}


; tests
assert.test(testDict.clear(), true)
assert.test(testDict.data.Count(), 0)

; omit
testDict.clear()
