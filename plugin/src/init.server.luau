--!strict

assert(plugin, "[VluxySF Plugin]: This code must run inside of a plugin")
if game:GetService("RunService"):IsRunning() then
	return
end

local ICONS = {
	ENABLED = "rbxassetid://115780670428316",
	DISABLED = "rbxassetid://104027421823400",
}

local HttpService = game:GetService("HttpService")

local FormatMessage = require(script.Utility.FormatMessage)
local Settings = require(script.Tools.Settings)
local SocketRequests = require(script.SocketRequests)
local Sound = require(script.Utility.Sound)
local SoundsLocation = require(script.Tools.SoundsLocation)
local Trove = require(script.Utility.Trove)

--

local function setSoundsLocation()
	local _, formatLocation = SoundsLocation.AutoFindFormatLocation()
	Settings.SetSoundsLocation(formatLocation)
end

task.spawn(function()
	setSoundsLocation()

	while true do
		task.wait(3)

		if not Settings.GetPluginEnabled() then
			continue
		end

		setSoundsLocation()
	end
end)

--

local onSocketError = Instance.new("BindableEvent")

local function getCurrentEnableIcon(): string
	return Settings.GetPluginEnabled() and ICONS.ENABLED or ICONS.DISABLED
end

--[[
	Topbar plugin Interface.
]]
local toolbar = plugin:CreateToolbar("Vluxy Sound Factory")

local pluginEnableText = "Vluxy Sound Factory"
local pluginEnabletoolTip = "Enables sounds to be baked into lookup types!"
local pluginEnableButton = toolbar:CreateButton(pluginEnableText, pluginEnabletoolTip, getCurrentEnableIcon())

local lastUserPluginEnablePress = 0
pluginEnableButton.Click:Connect(function()
	if os.time() - lastUserPluginEnablePress < 0.25 then
		return
	end
	lastUserPluginEnablePress = os.time()

	Settings.TogglePluginEnabled()
end)

--[[
	Web Socket
]]
local socketCleaner: Trove.Trove
local function cleanSocket()
	if socketCleaner then
		socketCleaner:Clean()
	end
end

local function setSocket(port: number)
	cleanSocket()
	socketCleaner = Trove.new()

	local webSocket = HttpService:CreateWebStreamClient(Enum.WebStreamClientType.WebSocket, {
		Url = "ws://127.0.0.1:" .. port,
		Method = "GET",
	})

	socketCleaner:Connect(webSocket.MessageReceived, function(message)
		print("_", message) --test

		if message == "GetFullBake" then
			local result = SocketRequests.FullBake()
			webSocket:Send(HttpService:JSONEncode({ data = result }))
		elseif message == "GetMinimalBake" then
			FormatMessage.Warn("GetMinimalBake is not implemented yet!")
		else
			FormatMessage.Warn(`Received unknown message: {message}`)
		end
	end)

	socketCleaner:Connect(webSocket.Error, function(err)
		onSocketError:Fire()

		FormatMessage.Warn("WebSocket connection error: " .. err)

		if err ~= 400 then
			return
		end

		FormatMessage.Warn("Make sure your ports match!")
	end)
end

--[[
	Initialize plugin state based on settings and set up listeners for changes.
]]
if Settings.GetPluginEnabled() then
	setSocket(Settings.GetPort())
end

onSocketError.Event:Connect(function()
	Settings.SetPluginEnabled(false)
end)

Settings.ListenPluginEnabled():Connect(function(enabled: boolean)
	pluginEnableButton.Icon = getCurrentEnableIcon()

	if Settings.GetSoundsLocation() == nil then
		cleanSocket()

		FormatMessage.Warn("Could not locate a Configuration named SOUNDS!")
		return
	end

	if enabled then
		setSocket(Settings.GetPort())

		Sound.PlayConnect()
	else
		cleanSocket()

		Sound.PlayDisconnect()
	end
end)

Settings.ListenPortChanged():Connect(function(port: number)
	if Settings.GetPluginEnabled() then
		setSocket(port)

		Sound.PlayConnect()
	end
end)
