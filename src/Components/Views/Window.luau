-- 7kayoh
-- Window.lua
-- 03 February 2022

--[[

    Window {
        Size: Value<UDim2>|UDim2?,
        Position: Value<UDim2>|UDim2?,
        ZIndex: Value<number>|number?,
		Visible: Value<boolean>|boolean?,

        [Fusion.Children]: {Instances}
    } -> Frame

--]]

local Components = script.Parent.Parent
local Modules = Components.Parent.Modules
local Lydie = Components.Parent

local Fusion = require(Lydie.Parent.Fusion)
local Constants = require(Modules.Constants)
local Scheme = require(Modules.Scheme)
local Shadow = require(Components.Shadow)

local Children = Fusion.Children
local New = Fusion.New
local Value = Fusion.Value

return function(props)
	return New("Frame")({
		Name = "Window",

		BackgroundTransparency = 1,
		ZIndex = props.ZIndex or 1,
		Visible = props.Visible or true,

		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = props.Position or UDim2.fromScale(0.5, 0.5),
		Size = props.Size or UDim2.fromOffset(700, 700),

		[Children] = {
			Fusion.Computed(function()
				if props.AspectRatio and props.AspectRatio:get() > 0 then
					return New("UIAspectRatioConstraint")({
						AspectRatio = props.AspectRatio:get() or 1.5,
						AspectType = Enum.AspectType.ScaleWithParentSize,
						DominantAxis = Enum.DominantAxis.Width,
					})
				else
					return nil
				end
			end),

			New("ImageLabel")({
				BackgroundTransparency = 1,
				Image = Constants.Rounded.Id,
				ImageColor3 = Scheme.GetAnimated(Scheme.Elevation[2]),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Constants.Rounded.Center,
				SliceScale = Constants.RoundedValues[8],

				Size = UDim2.fromScale(1, 1),

				[Children] = props[Children],
			}),

			Shadow({
				Elevation = Value(Constants.Elevation[4]),
				ZIndex = 0,
			}),
		},
	})
end
