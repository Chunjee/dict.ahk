; /--\--/--\--/--\--/--\--/--\
; Internal functions
; \--/--\--/--\--/--\--/--\--/

_hash(param_key) {

	; perform
	if (IsObject(param_key)) {
		hash := &param_key
	} else {
		if param_key is integer
		{
			hash := param_key
		}
		else if param_key is float
		{
			truncatedKey := param_key & -1
			if (Key == truncatedKey) {
				hash := truncatedKey
			} else {
				VarSetCapacity(hash, 8)
				NumPut(param_key, hash,, "Double")
				hash := NumGet(hash,, "Int64")
			}
		} else {
			hash := 0
			for _, char in StrSplit(param_key) {
				hash := 31 * hash + Ord(Char)
			}
		}
	}
	return hash
}


; tests
assert.test(exampleDict._hash(200), 200)
assert.test(exampleDict._hash(2000), 2000)
assert.test(exampleDict._hash(2000.1), 4656511348273210982)

; omit
