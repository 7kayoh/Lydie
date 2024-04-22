-- 7kayoh
-- Checkbox.lua
-- 24 March 2022

local Components = script.Parent.Parent
local Modules = Components.Parent.Modules
local Lydie = Components.Parent

local Fusion = require(Lydie.Parent.Fusion)
local Icons = require(Modules.Icons)
local Scheme = require(Modules.Scheme)
local BaseButton = require(Components.Controls.BaseButton)

local Children = Fusion.Children
local New = Fusion.New
local Value = Fusion.Value
local Computed = Fusion.Computed

return function(props)
	props.Toggled = Value(false)

	local component = BaseButton({
		BackgroundColor = Scheme.GetAnimated(Computed(function()
			if props.Toggled:get() then
				return Scheme.Accent:get()
			else
				return Scheme.Color.Text.Primary:get()
			end
		end)),
		BackgroundOpacity = Scheme.GetAnimated(Computed(function()
			if props.Toggled:get() then
				return 0
			else
				return 0.6
			end
		end)),
		ZIndex = props.ZIndex or 1,

		Size = UDim2.fromOffset(24, 24),
		Position = props.Position or UDim2.fromOffset(0, 0),

		[Children] = {
			New("ImageLabel")({
				BackgroundTransparency = 1,
				Image = Icons.check,
				ImageColor3 = Scheme.GetAnimated(Scheme.Elevation[2]),
				ImageTransparency = Scheme.GetAnimated(Fusion.Computed(function()
					return props.Toggled:get() and 0 or 1
				end)),

				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromScale(0.7, 0.7),
			}),
		},

		OnClick = function()
			if props.OnClick then
				props.OnClick(props.Toggled)
			else
				props.Toggled:set(not props.Toggled:get())
			end
		end,
	})

	return component
end
