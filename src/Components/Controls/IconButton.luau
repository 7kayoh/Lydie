-- 7kayoh
-- IconButton.lua
-- 17 March 2022

local Components = script.Parent.Parent
local Modules = Components.Parent.Modules
local Lydie = Components.Parent

local Fusion = require(Lydie.Parent.Fusion)
local Scheme = require(Modules.Scheme)

local BaseButton = require(Components.Controls.BaseButton)

local New = Fusion.New
local Children = Fusion.Children

return function(props)
	props[Children] = props[Children] or {}

	table.insert(
		props[Children],
		New("UIAspectRatioConstraint")({
			AspectRatio = 1,
		})
	)

	table.insert(
		props[Children],
		New("ImageLabel")({
			BackgroundTransparency = 1,
			Image = props.Icon,
			ImageColor3 = props.ForegroundColor or props.BackgroundColor or Scheme.GetAnimated(
				Scheme.Color.Text.Primary
			),

			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = props._iconSize or UDim2.fromScale(0.45, 0.45),
		})
	)

	return BaseButton(props)
end
