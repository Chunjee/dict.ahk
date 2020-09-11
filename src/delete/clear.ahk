clear() {

	; perform
	this.data := []
	this.size := this.data.Count()
	return true
}


; tests
assert.test(exampleDict.clear(), true)
assert.test(exampleDict.size, 0)

; omit
exampleDict.clear()
