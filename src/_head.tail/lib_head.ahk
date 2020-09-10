class dict {

	; --- Static Variables ---
	__New(param_default:="") {
		
		this.data := []
		this.size := 0

		this.throwExceptions := true
		if (param_default != "") {
			this.data := param_default
		}
	}


	; --- Static Methods ---
