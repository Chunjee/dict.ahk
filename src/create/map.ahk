map(param_keyArr, param_valueArr) {
	if !(IsObject(param_array) || IsObject(param_valueArr)) {
		this._typeException()
	}

	; perform
	for _, value in param_keyArr {
		vHash := this._hash(value)
		this.data[vHash] := param_valueArr[A_Index]
	}
	this.size := this.data.Count()
	return this.size
}


; tests
assert.test(exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"]), 3)
assert.test(exampleDict.get(200), "OK")
assert.test(exampleDict.map([500], ["Internal Server Error"]), 4)

; omit
exampleDict.clear()
