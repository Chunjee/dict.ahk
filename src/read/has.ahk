has(param_key) {

	; prepare
	vHash := this._hash(param_key)

	; perform
	if (this.data[vHash]) {
		return true
	}
	return false
}


; tests
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
assert.true(exampleDict.has(200))

; omit
exampleDict.clear()
