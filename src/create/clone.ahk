clone() {
	return new dict(this.data.Clone())
}


; tests
assert.label("clone - check that new clone has methods")
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
dictClone := exampleDict.clone()
assert.test(dictClone.has(200), true)

; omit
exampleDict.clear()
