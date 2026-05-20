--!strict

local FormatMessage = require(script.Parent.Utility.FormatMessage)
local Settings = require(script.Parent.Tools.Settings)
local SoundsLocation = require(script.Parent.Tools.SoundsLocation)

-- This module handles all the requested data from the port.
local SocketRequests = {}

--this finds all the sound names in the soundsFolder
function SocketRequests.FullBake(): { string }
	local soundNames = {}

	local formatedLocation = Settings.GetSoundsLocation()
	if not formatedLocation then
		FormatMessage.Error("Could not fetch sounds folder location for full bake!")
		return {}
	end

	local soundsFolder = SoundsLocation.GetSoundsFolderFromLocation(formatedLocation :: string)
	if not soundsFolder then
		FormatMessage.Error("Could not find sounds folder at the provided location for full bake!")
		return {}
	end

	local sounds = soundsFolder:QueryDescendants("Sound")
	if #sounds == 0 then
		FormatMessage.Warn("No sounds found in the specified sounds folder for full bake!")
		return {}
	end

	for _, sound in sounds do
		if table.find(soundNames, sound.Name) then
			continue
		end

		table.insert(soundNames, sound.Name)
	end

	--print(soundNames) --test

	return soundNames
end

return SocketRequests
