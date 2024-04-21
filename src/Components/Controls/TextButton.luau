-- 7kayoh
-- TextButton.lua
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
	props[Children] = {
		New("TextLabel")({
			BackgroundTransparency = 1,
			Font = Scheme.Typography.Button.Font,
			Text = props.Text,
			TextColor3 = props.ForegroundColor or props.BackgroundColor or Scheme.GetAnimated(
				Scheme.Color.Text.Primary
			),
			TextSize = Scheme.Typography.Button.Size,

			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(0, 1),
		}),
	}

	return BaseButton(props)
end
