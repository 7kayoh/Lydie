-- bubba_biga
-- Scheme.lua
-- 03 February 2022

--[[
    Scheme.Schemes: EnumList
	Scheme.Current: string
    
    Scheme.Switch(enumScheme: string) --> void
]]

-- :( why wally
local Scheme = {} :: {
	Switch: (string) -> (),
	SetAccent: (Color3|Fusion.Value<Color3>) -> (),
	_updateScheme: ({ any }, { any }) -> (),
	_initializeStates: ({ any }, { any }) -> (),
	GetAnimated: (Fusion.Value<any>) -> (Tween<Fusion.Value<any>>),
	_initialize: () -> (),
	[any]: any,
}

local Modules = script.Parent
local Lydie = Modules.Parent

local Fusion = require(Lydie.Parent.Fusion)
local EnumList = require(Modules.EnumList)

local Value = Fusion.Value
local Computed = Fusion.Computed

local schemes = script.Schemes:GetChildren()

function Scheme.Switch(enumTheme)
	for _, theme in ipairs(schemes) do
		if theme.Name ~= enumTheme then
			continue
		end

		Scheme.Current = enumTheme
		Scheme._updateStates(require(theme), Scheme)
	end
end

function Scheme.SetAccent(value)
	Scheme.Accent = typeof(value) == "Color3" and Value(value) or value
end

function Scheme._updateStates(newScheme, tabl)
	for key, data in pairs(newScheme) do
		if typeof(data) == "table" then
			Scheme._updateStates(data, tabl[key])
		else
			tabl[key]:set(data)
		end
	end
end

function Scheme._initializeStates(scheme, tabl)
	for key, data in pairs(scheme) do
		if typeof(data) == "table" then
			tabl[key] = {}
			Scheme._initializeStates(data, tabl[key])
		else
			tabl[key] = Value(data)
		end
	end
end

function Scheme.GetAnimated(state)
	return Fusion.Tween(state, TweenInfo.new(0.15, Enum.EasingStyle.Linear))
end

function Scheme._initialize()
	local schemeEnumItems = {}

	for _, scheme in ipairs(schemes) do
		schemeEnumItems[scheme.Name] = scheme.Name
	end

	Scheme.Schemes = EnumList.new("Scheme", schemeEnumItems)
	Scheme._initializeStates(require(schemes[1]), Scheme)

	-- Switch to light theme as that is the default theme, we still want
	-- our states to represent some theme!
	Scheme.Switch(Scheme.Schemes.Light)
	Scheme.AccentName = Value("Pink")
	Scheme.Accent = Computed(function()
		return Scheme.Color[Scheme.AccentName:get()]:get()
	end)
end

Scheme._initialize()

return Scheme
