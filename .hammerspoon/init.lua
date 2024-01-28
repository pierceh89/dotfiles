-- General variables
hyper       = {"cmd", "alt", "ctrl"}
shift_hyper = {"cmd", "alt", "ctrl", "shift"}
ctrl_cmd    = {"cmd", "ctrl"}

col = hs.drawing.color.x11

-- Spoons
hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.repos.zzspoons = {
	url = "https://github.com/zzamboni/zzSpoons",
	desc = "zzamboni's spoon repository",
}
spoon.SpoonInstall.use_syncinstall = true
Install = spoon.SpoonInstall

-- Hammer
Install:andUse("Hammer",
	{
		repo = 'zzspoons',
		config = { auto_reload_config = false },
		hotkeys = {
		config_reload = {hyper, "r"},
		toggle_console = {hyper, "y"}
		},
		start = true
	}
)

-- Caffeine
-- Install:andUse("Caffeine", {
-- 	start = true,
-- 	hotkeys = {
-- 	  toggle = { hyper, "c" }
-- 	}
-- })

-- KSheet (Displaying keyboard shortcuts)
Install:andUse("KSheet", {
	hotkeys = {
	toggle = { hyper, "/" }
}})

-- Pop-up translation
-- local wm=hs.webview.windowMasks
-- Install:andUse("PopupTranslateSelection", {
-- 	config = {
-- 		popup_style = wm.utility|wm.HUD|wm.titled|wm.closable|wm.resizable,
-- 	},
-- 	hotkeys = {
-- 		translate_to_en = { hyper, "e" },
-- 		translate_to_ko = { hyper, "k" }
-- 	}
-- })

-- inputsource_aurora
require('modules.inputsource_aurora')
-- Spectacle replacement
-- require('modules.spectacle')

-- ctrl + ']'를 누르면 입력 소스를 영문으로 변경 후 esc 입력한다.
local english = "com.apple.keylayout.ABC"

function changeInput()
	local current = hs.keycodes.currentSourceID()
	if not (current == english) then
		hs.keycodes.currentSourceID(english)
	end
	hs.eventtap.keyStroke({}, "escape")
end

hs.hotkey.bind({"ctrl"}, 33, changeInput)

