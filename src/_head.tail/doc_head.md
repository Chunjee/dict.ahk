## dict.ahk
A modern dictionary package for AutoHotkey


### Installation

In a terminal or command line navigated to your project folder:

```bash
npm install dict.ahk
```

In your code:

```autohotkey
#Include %A_ScriptDir%\node_modules
#Include dict.ahk\export.ahk

testDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
msgbox, % testDict.get(200)
; => "OK"

testDict.has(404)
; => true
```

You may also review or copy the package from [./export.ahk on GitHub](https://raw.githubusercontent.com/chunjee/dict.ahk/master/export.ahk); #Include it however you would normally when manually downloading.


## API

Including the module provides a class `dict` with seven methods: `.set`, `.get`, `.has`, `.map`, `.remove`, `.clear`, `.clone`

