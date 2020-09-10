_typeException() {
	if (this.throwExceptions == true) {
		throw Exception("Type Error", -2)
	}
}


; tests

; omit
testDict.clear()

testDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
assert.test(testDict.size, 3)
