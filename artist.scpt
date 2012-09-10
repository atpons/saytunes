tell application "iTunes"
	pause
        try
	set trackName to name of current track
	set trackArtist to artist of current track
	set says to trackArtist
        return says
        on error
        return "Not received."
        end try
end tell
