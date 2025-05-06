#Requires AutoHotkey v2.0


#f:: {
    WinTitle := "Firefox"
    SetTitleMatchMode "2"

    if WinExist(WinTitle) {
        WinActivate(WinTitle)
    } else {
        try {
          Run "C:\Program Files\Mozilla Firefox\firefox.exe"
        } catch {
            MsgBox "Firefox kon niet worden gestart. Controleer het pad."
        }
    }
}


#c:: {
    WinTitle := "Chrome"
    SetTitleMatchMode "2"

    if WinExist(WinTitle) {
        WinActivate(WinTitle)
    } else {
        try {
          Run "C:\Program Files\Google\Chrome\Application\chrome.exe"
        } catch {
            MsgBox "Chrome kon niet worden gestart. Controleer het pad."
        }
    }
}

#t:: {
    WinTitle := "Telegram"
    SetTitleMatchMode "2"

    if WinExist(WinTitle) {
        WinActivate(WinTitle)
    } else {
        try {
          Run "C:\Users\mail\AppData\Roaming\Telegram Desktop\Telegram.exe"
        } catch {
            MsgBox "Telegram kon niet worden gestart. Controleer het pad."
        }
    }
}
#b:: {
    WinTitle := "wessel@winnie"
    SetTitleMatchMode "2"

    if WinExist(WinTitle) {
        WinActivate(WinTitle)
    } else {
        try {
          Run "C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.22.11141.0_x64__8wekyb3d8bbwe\WindowsTerminal.exe"
        } catch {
            MsgBox "Terminal niet worden gestart. Controleer het pad."
        }
    }
}
#o:: {
    WinTitle := "Obsidian"
    SetTitleMatchMode "2"

    if WinExist(WinTitle) {
        WinActivate(WinTitle)
    } else {
        try {
          Run "C:\Users\Wessel.Heringa\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Obsidian.lnk"
        } catch {
            MsgBox "Obsidian kon niet worden gestart. Controleer het pad."
        }
    }
}

#h::
{
  WinTitle := "Keyboard Mastery.md - Notepad"
  if WinExist(WinTitle) {
    WinActivate(WinTitle)
  }
  else{
    Run "notepad"
  }
}
