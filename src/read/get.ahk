get(param_key) {
	if (this.data[param_key]) {
		return this.data[param_key]
	}
	return false
}


; tests
testDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
assert.test(testDict.get(200), "OK")

; omit
testDict.clear()
