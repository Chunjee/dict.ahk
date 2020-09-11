_typeException() {
	if (this.throwExceptions == true) {
		throw Exception("Type Error", -2)
	}
}


; tests

; omit
exampleDict.clear()

exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
assert.test(exampleDict.size, 3)
