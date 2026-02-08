--hs.loadSpoon("AppLauncher")

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "W", function()
	hs.alert.show("Hello World!")
end)

local function showCheatsheet()
	local message = [[
    Hammerspoon Cheatsheet
    ----------------------
    Obsidian - Navigate back/forward: apple <- / apple ->
    Obsidian - Next tab: ctr-tab  
    ]]
	hs.alert.show(message, 2)
end

-- Bind to a specific key
hs.hotkey.bind({ "ctrl", "alt" }, "m", showCheatsheet)

hs.hotkey.bind({ "ctrl", "alt" }, "n", function()
	moveScreen()
end)

hs.hotkey.bind({ "ctrl", "alt" }, "w", function()
	hs.window.focusedWindow():maximize()
end)

hs.hotkey.bind({ "ctrl", "alt" }, "1", function()
	moveToLeftHalfOfScreen()
end)

hs.hotkey.bind({ "ctrl", "alt" }, "2", function()
	moveToRightHalfOfScreen()
end)

hs.hotkey.bind({ "ctrl", "alt" }, "3", function()
	moveToLeftThirdOfScreen()
end)

hs.hotkey.bind({ "ctrl", "alt" }, "4", function()
	moveToMiddleThirdOfScreen()
end)

hs.hotkey.bind({ "ctrl", "alt" }, "5", function()
	moveToRightThirdOfScreen()
end)

hs.hotkey.bind({ "ctrl", "alt" }, "6", function()
	hs.alert.show("maximize")
	hs.window.focusedWindow():maximize()
end)

function launchOrFocus(key, applicationName)
	modifiers = { "ctrl", "alt" }
	hs.alert.show(applicationName)

	hs.hotkey.bind(modifiers, key, function()
		hs.alert.show(applicationName)
		hs.application.launchOrFocus(applicationName)
		-- hs.window.focusedWindow():toggleFullScreen()
	end)
end

launchOrFocus("j", "Obsidian")

--launchOrFocus("m", "Visual Studio Code")
launchOrFocus("i", "Todoist")
launchOrFocus("d", "Vivaldi")
launchOrFocus("c", "Google Chrome")
launchOrFocus("b", "Terminal")
launchOrFocus("p", "Slack")

launchOrFocus("k", "Calendar")
launchOrFocus("f", "Firefox")

function moveScreen()
	hs.alert.show("move to next screen")

	local win = hs.window.focusedWindow()
	local target = win:screen():next()
	local frame = target:fullFrame()

	win:move(frame, target, false, 0)
	hs.timer.doAfter(0.3, function()
		win:setFrame(frame)
	end)
end

function moveScreen2()
	hs.alert.show("move to next screen")

	local win = hs.window.focusedWindow()
	local currentScreen = win:screen()

	local nextScreen = currentScreen:next()

	--print("Moving window '" .. win:title() .. "' to screen: " .. nextScreen:name())  local nextScreen = currentScreen:next();
	win = win:moveToScreen(nextScreen, true, false, 0)

	hs.timer.doAfter(0.3, function()
		local frame = nextScreen:fullFrame()
		win:setFrame(frame)
	end)
end

function moveToLeftHalfOfScreen()
	hs.alert.show("move to left half of screen")
	local win = hs.window.focusedWindow()

	local screen = win:screen()
	local frame = screen:frame()

	win:setFrame({
		x = frame.x,
		y = frame.y,
		w = frame.w / 2,
		h = frame.h,
	})
end

function moveToRightHalfOfScreen()
	hs.alert.show("move to right half of screen")
	local win = hs.window.focusedWindow()

	local screen = win:screen()
	local frame = screen:frame()

	win:setFrame({
		x = frame.x + frame.w / 2,
		y = frame.y,
		w = frame.w / 2,
		h = frame.h,
	})
end

function moveToLeftThirdOfScreen()
	hs.alert.show("move to left third of screen")
	local win = hs.window.focusedWindow()

	local screen = win:screen()
	local frame = screen:frame()

	win:setFrame({
		x = frame.x,
		y = frame.y,
		w = frame.w / 3,
		h = frame.h,
	})
end

function moveToMiddleThirdOfScreen()
	hs.alert.show("move to middle third of screen")
	local win = hs.window.focusedWindow()

	local screen = win:screen()
	local frame = screen:frame()

	win:setFrame({
		x = frame.x + frame.w / 3,
		y = frame.y,
		w = frame.w / 3,
		h = frame.h,
	})
end

function moveToRightThirdOfScreen()
	hs.alert.show("move to right third of screen")
	local win = hs.window.focusedWindow()

	local screen = win:screen()
	local frame = screen:frame()

	win:setFrame({
		x = frame.x + frame.w / 3 * 2,
		y = frame.y,
		w = frame.w / 3,
		h = frame.h,
	})
end
