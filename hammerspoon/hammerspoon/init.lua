hs.application.enableSpotlightForNameSearches(true)
openMode = hs.hotkey.modal.new({}, nil)

function openMode:entered()
    hs.alert.show("Open Mode")
end

function openMode:exited()
    hs.alert.closeAll()
end

function openChromeApp(name)
    return function()
        -- Be sure to get the real name of the app (Use ls -a to check).
        hs.application.launchOrFocus(os.getenv('HOME') .. '/Applications/Chrome Apps.localized/' .. name .. '.app')
    end
end

openMode:bind({}, 't', function()
    hs.application.launchOrFocus("iTerm")
    openMode:exit()
end)
openMode:bind({}, 'c', function()
    hs.application.launchOrFocus("Finder")
    -- hs.application.launchOrFocusByBundleID("com.google.Chrome")
    openMode:exit()
end)
openMode:bind({}, 'f', function()
    hs.application.launchOrFocus("Finder")
    openMode:exit()
end)
openMode:bind({}, 'q', function()
    openMode:exit()
end)

hs.hotkey.bind({ 'ctrl', 'alt', 'cmd', 'shift' }, 'O', function()
    openMode:enter()
end)
