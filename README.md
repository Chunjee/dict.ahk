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

exampleDict := new dict()
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
msgbox, % exampleDict.get(200)
; => "OK"

exampleDict.has(404)
; => true
```

You may also review or copy the package from [./export.ahk on GitHub](https://raw.githubusercontent.com/chunjee/dict.ahk/master/export.ahk); #Include it however you would normally when manually downloading.


## API

Including the module provides a class `dict` with seven methods: `.set`, `.get`, `.has`, `.map`, `.remove`, `.clear`, `.clone`

# **Create methods**
## .clone
creates and returns a new clone of the dictionary.

#### Arguments
none


#### Returns
(array): A new clone of the dictionary.

#### Example
```autohotkey
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])

dictClone := exampleDict.clone()
dictClone.has(200)
; => true
```




## .map
Maps a key array and value array to the dictionary.

#### Arguments
keyArr (array): The array of keys to add to the dictionary

valueArr (array): The array of values to add to the dictionary


#### Returns
(number): The dictionaries new `.Count()` length


#### Example

```autohotkey
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
; => 3

exampleDict.get(200)
; => "OK"

exampleDict.map([500], ["Internal Server Error"])
; => 4

```



## .set
Creates a new entry in the dictionary.

#### Aliases
`.create`, `.update`

#### Arguments
key (string): The key to create the value at

value (*): The value to associate with the key


#### Returns
(number): The dictionaries new `.Count()` length


#### Example

```autohotkey
exampleDict.set(200, "OK")
; => 1

exampleDict.set(403, "Access forbidden")
; => 2

exampleDict.set(404, "File not found")
; => 3

```




# **Delete methods**
## .clear
Clears the dictionary of all keys and values.


#### Arguments
none


#### Returns
(boolean): returns true upon success


#### Example

```autohotkey
exampleDict.clear()
; => true

assert.test(exampleDict.size, 0)```



## .remove
Creates a new entry in the dictionary.

#### Aliases
`.delete`

#### Arguments
key (string): The key to remove from the dictionary


#### Returns
(boolean): `true` if the key was removed, else `false`


#### Example

```autohotkey
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])exampleDict.remove(200)
; => true

exampleDict.remove(403)
; => true

exampleDict.remove(404)
; => true

exampleDict.remove(500)
; => false

assert.test(exampleDict.size, 0)```




# **Read methods**
## .get
Reads the value associated with the key.

#### Arguments
key (string): The key to lookup in the dictionary


#### Returns
(*): The value associated with the key, else `false`


#### Example

```autohotkey
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])exampleDict.get(200)
; => "OK"

```



## .has
Reads if the key exists in the dictionary

#### Arguments
key (string): The key to lookup in the dictionary


#### Returns
(boolean): `true` if the key exists, else `false`


#### Example

```autohotkey
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])exampleDict.has(200)
; => true

```



## .size


#### Example

```autohotkey
exampleDict.clear()```



