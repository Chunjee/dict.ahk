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
testDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
assert.true(testDict.has(200))

; omit
testDict.clear()
