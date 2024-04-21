-- 7kayoh
-- IconTextButton.lua
-- 17 March 2022
local TextService = game:GetService("TextService")

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
		New("Frame")({
			BackgroundTransparency = 1,

			Size = UDim2.fromScale(1, 1),

			[Children] = {
				New("UIListLayout")({
					Padding = UDim.new(0, 10),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
				}),

				New("ImageLabel")({
					BackgroundTransparency = 1,
					Image = props.Icon,
					ImageColor3 = props.ForegroundColor or props.BackgroundColor or Scheme.GetAnimated(
						Scheme.Color.Text.Primary
					),
					LayoutOrder = props.IconLayoutOrder or 0,

					Size = UDim2.fromScale(0.45, 0.45),

					[Children] = {
						New("UIAspectRatioConstraint")({
							AspectRatio = 1,
						}),
					},
				}),

				New("TextLabel")({
					BackgroundTransparency = 1,
					Font = Scheme.Typography.Button.Font,
					LayoutOrder = 1,
					Text = props.Text,
					TextColor3 = props.ForegroundColor or props.BackgroundColor or Scheme.GetAnimated(
						Scheme.Color.Text.Primary
					),
					TextSize = Scheme.Typography.Button.Size,

					Size = Fusion.Computed(function()
						local textSize = TextService:GetTextSize(
							props.Text:get(),
							Scheme.Typography.Button.Size:get(),
							Scheme.Typography.Button.Font:get(),
							Vector2.new(math.huge, math.huge)
						)

						return UDim2.fromOffset(textSize.X, textSize.Y)
					end),
				}),
			},
		}),
	}

	return BaseButton(props)
end
