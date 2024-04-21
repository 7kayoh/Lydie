-- 7kayoh
-- BottomAppBar.lua
-- 07 February 2022

--[[

    BottomAppBar {
        ZIndex: number?,

        [Fusion.Children]: {Instances}
    } -> Frame

--]]

local Components = script.Parent.Parent
local Modules = Components.Parent.Modules
local Lydie = Components.Parent

local Fusion = require(Lydie.Parent.Fusion)

local Constants = require(Modules.Constants)
local Scheme = require(Modules.Scheme)
local Divider = require(Components.Divider)

local Children = Fusion.Children
local New = Fusion.New

return function(props)
	return New("Frame")({
		BackgroundTransparency = 1,
		ZIndex = props.ZIndex or 1,

		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1),
		Size = UDim2.new(1, 0, 0, 50),

		[Children] = {
			Divider({
				ZIndex = 2,
			}),

			Content = New("ImageLabel")({
				BackgroundTransparency = 1,
				Image = Constants.BottomRounded.Id,
				ImageColor3 = Scheme.GetAnimated(Scheme.Elevation[4]),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Constants.BottomRounded.Center,
				SliceScale = Constants.RoundedValues[8],

				Size = UDim2.fromScale(1, 1),

				[Children] = props[Children],
			}),
		},
	})
end
