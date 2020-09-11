remove(param_key) {

	; prepare
	vHash := this._hash(param_key)

	; perform
	if (this.get(vHash)) {
		this.data.Delete(vHash)
		this.size := this.data.Count()
		return true
	}
	return false
}


; tests
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
assert.true(exampleDict.remove(200))
assert.true(exampleDict.remove(403))
assert.true(exampleDict.remove(404))
assert.false(exampleDict.remove(500))
assert.test(exampleDict.size, 0)

; omit
exampleDict.clear()
