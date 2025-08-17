- escape sequence with `
- identify windows with ahk_id, or window id as the doc said it
- assign :=
- JSON-like obj cons
- `Map()` for map cons
- built-in var with A_ prefix
- deref %ref%
- = for equal, == for case sensitive equal (not type casting)
- hwnd is window id returned by WinWait, WinActive, etc. and is equiv to ahk_id field in spy

pass by ref:
```autohotkey
a := 1, b := 2
Swap(&a, &b)
MsgBox a ',' b

Swap(&Left, &Right)
{
    temp := Left
    Left := Right
    Right := temp
}
```

variadic function
```autohotkey
Join(sep, params*) {
    for index,param in params
        str .= param . sep
    return SubStr(str, 1, -StrLen(sep))
}
MsgBox Join("`n", "one", "two", "three")
MsgBox Join("`n", array*)
```

- Functions are assume-local by default. Variables accessed or created inside an assume-local function are local by default, with the following exceptions:
    - Global variables which are only read by the function, not assigned or used with the reference operator (&). **readonly** var in function is automatically global
    - Nested functions may refer to local and static variables created by an enclosing function.
- put local before the var to override behav

- mod a global var req prefixing with `global` or switching to assume-global mode
- static var are local but val is rmb btw call

- use `KeyWait` to only execute the func when released:
```autohotkey
^!s:: ; otherwise ^!{Del} will be detected by windows and pull sec menu up
{
    KeyWait "Control"
    KeyWait "Alt"
    Send "{Delete}"
}
```