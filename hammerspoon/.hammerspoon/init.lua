openMode = hs.hotkey.modal.new({}, nil)

function openMode:entered()
    hs.alert.show("Open Mode")
end

function openMode:exited()
    hs.alert.closeAll()
end

openMode:bind({}, 't', function()
    hs.application.launchOrFocus("iTerm")
    openMode:exit()
end)
openMode:bind({}, 'c', function()
    hs.application.launchOrFocus("Chrome")
    openMode:exit()
end)
openMode:bind({}, 'f', function()
    hs.application.launchOrFocus("Finder")
    openMode:exit()
end)

hs.hotkey.bind({ 'ctrl', 'alt', 'cmd', 'shift' }, 'O', function()
    openMode:enter()
end)
