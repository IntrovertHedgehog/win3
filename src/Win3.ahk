#e::Reload

g_ShellTrayID := WinGetID("ahk_class Shell_TrayWnd")

g_RootContainer := {
    Direction : "Horizontal",
    Children : [] 
}

StringJoin(sep, key, str*) {
    if str.Length = 0
        return ""
    res := ""
    if (key) {
        res := str[1][key]
        loop str.Length - 1
            res .= sep str[A_Index + 1][key]
    } else {
        res := str[1]
        loop str.Length - 1
            res .= sep str[A_Index + 1]
    }
    return res
}

InitiateWindowLayout() {
    HWNDs := WinGetList(,,"Program Manager")
    g_RootContainer.Children := []
    for HWND in HWNDs {
        if HWND = g_ShellTrayID
            continue
        title := WinGetTitle("ahk_id " HWND)
        pid := WinGetPID("ahk_id " HWND)
        g_RootContainer.Children.Push(Map("name", title, "hwnd", HWND, "pid", pid))
    }
    MsgBox "there are " g_RootContainer.Children.Length " windows"
    MsgBox "children name: [" StringJoin(",", "name", (g_RootContainer.Children)*) "]"
    MsgBox "children hwnd: [" StringJoin(",", "hwnd", (g_RootContainer.Children)*) "]"
}

#i::InitiateWindowLayout