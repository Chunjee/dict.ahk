get(param_key) {
	if (this.data[param_key]) {
		return this.data[param_key]
	}
	return false
}


; tests
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
assert.test(exampleDict.get(200), "OK")
assert.test(exampleDict[200], "OK")

; omit
exampleDict.clear()
