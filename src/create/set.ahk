set(param_key, param_value) {

	; prepare
	vHash := this._hash(param_key)

	; perform
	this.data[vHash] := param_value
	this.size := this.data.Count()
	return this.size
}


; tests
array := [1]
assert.test(testDict.set(200, "OK"), 1)
assert.test(testDict.set(403, "Access forbidden"), 2)
assert.test(testDict.set(404, "File not found"), 3)

; omit

assert.test(testDict.update(404, "File not found"), 3)
testDict.clear()
