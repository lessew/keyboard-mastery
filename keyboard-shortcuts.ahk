#Requires AutoHotkey v2.0

; Get computer name
computerName := A_ComputerName
MsgBox "Current computer name: " . computerName

; Define paths based on computer
if (computerName = "WINNIE") {
    ; Paths for Wessel's computer
    FirefoxPath := "C:\Program Files\Mozilla Firefox\firefox.exe"
    CursorPath := "C:\Program Files\Google\Chrome\Application\chrome.exe"
    ChromePath := "C:\Program Files\Google\Chrome\Application\chrome.exe"
    TelegramPath := "C:\Users\mail\AppData\Roaming\Telegram Desktop\Telegram.exe"
    TerminalPath := "C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.22.11141.0_x64__8wekyb3d8bbwe\WindowsTerminal.exe"
    ObsidianPath := "C:\Users\Wessel.Heringa\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Obsidian.lnk"
} else {
    ; Paths for dnz's computer
    FirefoxPath := "C:\Program Files\Mozilla Firefox\firefox.exe"  ; Verify path
    CursorPath := "C:\Program Files\Google\Chrome\Application\chrome.exe"  ; Verify path
    ChromePath := "C:\Program Files\Google\Chrome\Application\chrome.exe"  ; Verify path
    TelegramPath := "C:\Users\dnz\AppData\Roaming\Telegram Desktop\Telegram.exe"  ; Update username
    TerminalPath := "C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_*\WindowsTerminal.exe"  ; Update version
    ObsidianPath := "C:\Users\dnz\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Obsidian.lnk"  ; Update username
}

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
#f:: CreateShortcut("Firefox", FirefoxPath)
#a:: CreateShortcut("Cursor", CursorPath)
#c:: CreateShortcut("Chrome", ChromePath)
#t:: CreateShortcut("Telegram", TelegramPath)
#b:: CreateShortcut("wessel@winnie", TerminalPath)
#o:: CreateShortcut("Obsidian", ObsidianPath)

; Notepad shortcut (special case as it doesn't need a specific path)
#h:: {
    WinTitle := "Keyboard Mastery.md - Notepad"
    if WinExist(WinTitle) {
        WinActivate(WinTitle)
    } else {
        Run "notepad"
    }
}
