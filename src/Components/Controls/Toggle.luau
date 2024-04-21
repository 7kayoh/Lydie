-- 7kayoh
-- Toggle.lua
-- 18 February 2022

local Components = script.Parent.Parent
local Modules = Components.Parent.Modules
local Lydie = Components.Parent

local Fusion = require(Lydie.Parent.Fusion)
local Constants = require(Modules.Constants)
local Scheme = require(Modules.Scheme)
local BaseButton = require(Components.Controls.BaseButton)

local Children = Fusion.Children
local New = Fusion.New
local Value = Fusion.Value
local Computed = Fusion.Computed
local Tween = Fusion.Tween

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
		RoundedValue = 1,
		ZIndex = props.ZIndex or 1,

		Size = UDim2.fromOffset(41, 24),
		Position = props.Position or UDim2.fromOffset(0, 0),

		[Children] = {
			New("Frame")({
				BackgroundTransparency = 1,

				Size = UDim2.fromScale(1, 1),

				[Children] = {
					New("ImageLabel")({
						BackgroundTransparency = 1,
						Image = Constants.Rounded.Id,
						ImageColor3 = Scheme.GetAnimated(Scheme.Elevation[2]),

						Size = UDim2.new(1, -6, 1, -6),
						Position = Tween(
							Computed(function()
								if props.Toggled:get() then
									return UDim2.new(0.5, 0, 0, 3)
								else
									return UDim2.new(0, 3, 0, 3)
								end
							end),
							TweenInfo.new(0.15, Enum.EasingStyle.Quint)
						),

						[Children] = {
							New("UIAspectRatioConstraint")({
								AspectRatio = 1,
							}),
						},
					}),
				},
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
