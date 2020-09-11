set(param_key, param_value) {

	; prepare
	vHash := this._hash(param_key)

	; perform
	this.data[vHash] := param_value
	this.size := this.data.Count()
	return this.size
}


; tests
assert.test(exampleDict.set(200, "OK"), 1)
assert.test(exampleDict.set(403, "Access forbidden"), 2)
assert.test(exampleDict.set(404, "File not found"), 3)

; omit

assert.test(exampleDict.update(404, "File not found"), 3)
assert.test(exampleDict.update(500, "Internal Server Error"), 4)
exampleDict.clear()
