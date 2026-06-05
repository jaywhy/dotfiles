#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Clipboard typer
# @raycast.mode silent
# @raycast.icon ??

# Documentation:
# @raycast.description Types the clipboard contents as keystrokes
# @raycast.author jayWHY
# @raycast.authorURL https://raycast.com/jayWHY

on run
    set clipText to the clipboard as text
    if clipText is "" then
        display notification "Clipboard is empty" with title "Type Clipboard"
        return
    end if


    tell application "System Events"
        repeat with c in characters of clipText
            keystroke c
            delay 0.005
        end repeat
    end tell
end run
