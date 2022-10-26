local ctrl_alt = {"alt", "ctrl"}

-- Left Half (ctrl + alt + left)
hs.hotkey.bind(ctrl_alt, "Left", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h
	win:setFrame(f)
end)

-- Right Half (ctrl + alt + right)
hs.hotkey.bind(ctrl_alt, "Right", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w / 2)
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h
	win:setFrame(f)
end)

-- Top Half (ctrl + alt + up)
hs.hotkey.bind(ctrl_alt, "Up", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y
	f.w = max.w
	f.h = max.h / 2
	win:setFrame(f)
end)

-- Bottom Half (ctrl + alt + up)
hs.hotkey.bind(ctrl_alt, "Down", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y + (max.h / 2)
	f.w = max.w
	f.h = max.h / 2
	win:setFrame(f)
end)

-- Upper Left (ctrl + alt + -)
hs.hotkey.bind(ctrl_alt, "-", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h / 2
	win:setFrame(f)
end)

-- Lower Left (ctrl + alt + [(left bracket))
hs.hotkey.bind(ctrl_alt, "[", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y + (max.h / 2)
	f.w = max.w / 2
	f.h = max.h / 2
	win:setFrame(f)
end)

-- Upper Right (ctrl + alt + =)
hs.hotkey.bind({"alt", "ctrl"}, "=", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w / 2)
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h / 2
	win:setFrame(f)
end)

-- Lower Right (ctrl + alt + ](right bracket))
hs.hotkey.bind({"alt", "ctrl"}, "]", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w / 2)
	f.y = max.y + (max.h / 2)
	f.w = max.w / 2
	f.h = max.h / 2
	win:setFrame(f)
end)

-- Fullscreen (ctrl + alt + cmd + F)
hs.hotkey.bind(hyper, "F", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y
	f.w = max.w
	f.h = max.h
	win:setFrame(f)
end)

-- Next Display (ctrl + alt + cmd + right)
hs.hotkey.bind(hyper, "Right", function()
	local win = hs.window.focusedWindow()
	local nextScreen = hs.screen.mainScreen():next()
	win:moveToScreen(nextScreen)
end)

-- Previous Display (ctrl + alt + cmd + left)
hs.hotkey.bind(hyper, "Left", function()
	local win = hs.window.focusedWindow()
	local prevScreen = hs.screen.mainScreen():previous()
	win:moveToScreen(prevScreen)
end)
