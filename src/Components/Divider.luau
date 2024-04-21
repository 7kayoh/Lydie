-- 7kayoh
-- Divider.lua
-- 03 February 2022

--[[

    Divider {
        AnchorPoint: Vector2?,
        Size: UDim2?,
        Position: UDim2?,
        ZIndex: number?
    } -> Frame

--]]
local Components = script.Parent
local Modules = Components.Parent.Modules
local Lydie = Components.Parent

local Fusion = require(Lydie.Parent.Fusion)
local Scheme = require(Modules.Scheme)

local New = Fusion.New

return function(props)
	return New("Frame")({
		Name = "Divider",

		BackgroundColor3 = Scheme.GetAnimated(Scheme.Color.Divider),
		ZIndex = props.ZIndex or 1,

		Size = props.Size or UDim2.new(1, 0, 0, 1),
		Position = props.Position or UDim2.new(0, 0, 0, 0),
		AnchorPoint = props.AnchorPoint or Vector2.new(0, 0),
	})
end
