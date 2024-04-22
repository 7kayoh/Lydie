-- 7kayoh
-- AppTabBarButton.lua
-- 21 February 2022

local Components = script.Parent.Parent
local Modules = Components.Parent.Modules
local Lydie = Components.Parent

local Fusion = require(Lydie.Parent.Fusion)
local Constants = require(Modules.Constants)
local Icons = require(Modules.Icons)
local Scheme = require(Modules.Scheme)
local IconButton = require(Components.Controls.IconButton)

return function(props)
	props.State = props.State or Fusion.Value(false)
	return IconButton({
		_iconSize = UDim2.fromScale(0.5, 0.5),
		BackgroundOpacity = 1,
		Icon = props.Icon or Icons["loader-2"],
		LayoutOrder = props.LayoutOrder,
		ForegroundColor = Scheme.GetAnimated(Fusion.Computed(function()
			return props.State:get() and Scheme.Accent:get() or Scheme.Color.Text.Secondary:get()
		end)),

		Size = UDim2.fromScale(0.8, 0.8),

		OnClick = function()
			if props.OnClick then
				props.OnClick(props.State)
			end
		end,

		[Fusion.Children] = {
			Fusion.New("ImageLabel")({
				BackgroundTransparency = 1,
				Image = Constants.Rounded.Id,
				ImageColor3 = Scheme.GetAnimated(Scheme.Accent),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Constants.Rounded.Center,
				SliceScale = Constants.RoundedValues[8],
				Visible = props.State,

				Position = UDim2.new(0, 0, 1.2, -6),
				Size = UDim2.new(1, 0, 0, 8),
			}),
		},
	})
end
