remove(param_key) {

	; prepare
	vHash := this._hash(param_key)

	; perform
	if (this.get(vHash)) {
		this.data.Delete(vHash)
		return true
	}
	return false
}


; tests
testDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
assert.true(testDict.remove(200))
assert.true(testDict.remove(404))
assert.false(testDict.remove(500))

; omit
