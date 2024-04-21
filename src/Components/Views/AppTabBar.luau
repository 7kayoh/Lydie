-- 7kayoh
-- BottomAppTabBar.lua
-- 21 February 2022

local Components = script.Parent.Parent
local Lydie = Components.Parent

local Fusion = require(Lydie.Parent.Fusion)

local Children = Fusion.Children
local New = Fusion.New

return function(props)
	return New("Frame")({
		BackgroundTransparency = 1,
		ZIndex = props.ZIndex or 1,

		Size = UDim2.fromScale(1, 1),
		ClipsDescendants = true,

		[Children] = {
			New("UIListLayout")({
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
			}),

			props[Children],
		},
	})
end
