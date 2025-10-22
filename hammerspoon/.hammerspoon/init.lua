local hyper = { "ctrl", "alt", "cmd", "shift" }
local hyper_minus_shift = { "ctrl", "alt", "cmd" }

hs.hotkey.bind(hyper_minus_shift, "v", function()
	local text = hs.pasteboard.getContents()
	if text then
		hs.eventtap.keyStrokes(text)
	end
end)
