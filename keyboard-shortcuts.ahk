#Requires AutoHotkey v2.0

; Generic function to create keyboard shortcuts
CreateShortcut(winTitle, programPath) {
    SetTitleMatchMode "2"
    
    if WinExist(winTitle) {
        WinActivate(winTitle)
    } else {
        try {
            Run programPath
        } catch {
            MsgBox "Could not start " . winTitle . ". Please check the path."
        }
    }
}

; Application shortcuts
#f:: CreateShortcut("Firefox", "C:\Program Files\Mozilla Firefox\firefox.exe")
#a:: CreateShortcut("Cursor", "C:\Program Files\Google\Chrome\Application\chrome.exe")
#c:: CreateShortcut("Chrome", "C:\Program Files\Google\Chrome\Application\chrome.exe")
#t:: CreateShortcut("Telegram", "C:\Users\mail\AppData\Roaming\Telegram Desktop\Telegram.exe")
#b:: CreateShortcut("wessel@winnie", "C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.22.11141.0_x64__8wekyb3d8bbwe\WindowsTerminal.exe")
#o:: CreateShortcut("Obsidian", "C:\Users\Wessel.Heringa\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Obsidian.lnk")

; Notepad shortcut (special case as it doesn't need a specific path)
#h:: {
    WinTitle := "Keyboard Mastery.md - Notepad"
    if WinExist(WinTitle) {
        WinActivate(WinTitle)
    } else {
        Run "notepad"
    }
}
