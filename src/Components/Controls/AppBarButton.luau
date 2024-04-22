-- 7kayoh
-- AppBarButton.lua
-- 20 February 2022

local Components = script.Parent.Parent
local Modules = Components.Parent.Modules

local Icons = require(Modules.Icons)
local Scheme = require(Modules.Scheme)
local IconButton = require(Components.Controls.IconButton)

return function(props)
	return IconButton({
		_iconSize = UDim2.fromScale(0.5, 0.5),
		BackgroundOpacity = 1,
		Icon = props.Icon or Icons["loader-2"],
		LayoutOrder = props.LayoutOrder,
		ForegroundColor = Scheme.GetAnimated(Scheme.Color.Text.Secondary),

		Size = UDim2.fromScale(0.8, 0.8),

		OnClick = props.OnClick,
	})
end
