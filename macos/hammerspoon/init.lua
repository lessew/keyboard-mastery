--hs.loadSpoon("AppLauncher")


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.alert.show("Hello World!")
end)




function launchOrFocus(key,applicationName)
  modifiers = {'ctrl','alt'} 
  hs.alert.show(applicationName)

  hs.hotkey.bind(modifiers, key, function()
    hs.alert.show(applicationName)
    hs.application.launchOrFocus(applicationName)
   -- hs.window.focusedWindow():toggleFullScreen()
  end)
end

launchOrFocus("j","Obsidian")
launchOrFocus("m","Visual Studio Code")
launchOrFocus("i","Todoist")
launchOrFocus("d","Vivaldi")
launchOrFocus("c","Google Chrome")
launchOrFocus("b","Terminal")
launchOrFocus("p", "Slack")
launchOrFocus("k", "Calendar")
launchOrFocus("f","Firefox")

