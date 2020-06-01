local english = "com.apple.keylayout.ABC"

function changeInput()
	local current = hs.keycodes.currentSourceID()
	if not (current == english) then
		hs.keycodes.currentSourceID(english)
	end
	hs.eventtap.keyStroke({}, 'escape')
end

hs.hotkey.bind({'control'}, 33, changeInput)
