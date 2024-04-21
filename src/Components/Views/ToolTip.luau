-- 7kayoh
-- ToolTip.lua
-- 4 April 2022

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
local Computed = Fusion.Computed
local OnChange = Fusion.OnChange

return function(props)
	local textSize = Value(Vector2.new(0, 0))
	local component = New("Frame")({
		BackgroundTransparency = 1,
		Visible = props.Visible or true,

		AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 1),
		Position = props.Position or UDim2.new(0.5, 0, 0, -6),
		Size = Computed(function()
			return UDim2.fromOffset(textSize:get().X + 14, textSize:get().Y + 8)
		end),

		[Children] = {
			New("ImageLabel")({
				BackgroundTransparency = 1,
				Image = Constants.Rounded.Id,
				ImageColor3 = Scheme.GetAnimated(Scheme.Color.Divider),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Constants.Rounded.Center,
				SliceScale = Constants.RoundedValues[8],

				Size = UDim2.fromScale(1, 1),

				[Children] = {
					New("ImageLabel")({
						BackgroundTransparency = 1,
						Image = Constants.Rounded.Id,
						ImageColor3 = Scheme.GetAnimated(Scheme.Elevation[4]),
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Constants.Rounded.Center,
						SliceScale = Constants.RoundedValues[7],
		
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						Size = UDim2.new(1, -2, 1, -2),
					}),

					New("TextLabel")({
						BackgroundTransparency = 1,
						Font = Scheme.Typography.Secondary.Font,
						Text = props.Text,
						TextColor3 = Scheme.GetAnimated(Scheme.Color.Text.Primary),
						TextSize = Scheme.Typography.Secondary.Size,
						TextWrapped = false,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center,
						ZIndex = 2,

						Size = UDim2.fromScale(1, 1),

						[OnChange("TextBounds")] = function(newValue)
							textSize:set(Vector2.new(newValue.X, newValue.Y))
						end,
					}),
				},
			}),

			Shadow({
				Elevation = Value(Constants.Elevation[2]),
				ZIndex = 0,
			}),
		},
	})

	textSize:set(component.ImageLabel.TextLabel.TextBounds)
	return component
end
