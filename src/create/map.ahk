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
assert.test(testDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"]), 3)
assert.test(testDict.get(200), "OK")
assert.test(testDict.map(["test"], ["hey"]), 4)

; omit
testDict.clear()
