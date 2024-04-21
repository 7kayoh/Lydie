-- 7kayoh
-- TopAppbar.lua
-- 03 February 2022

--[[

    TopAppBar {
        Icon: Value<string>|string,
        Title: Value<string>|string,
        Subtitle: Value<string>|string,
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
local Computed = Fusion.Computed
local New = Fusion.New

return function(props)
	props.Subtitle = props.Subtitle or Fusion.Value("")

	return New("Frame")({
		BackgroundTransparency = 1,
		ZIndex = props.ZIndex or 1,

		Size = UDim2.new(1, 0, 0, 50),

		[Children] = {
			Divider({
				ZIndex = 2,

				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.fromScale(0, 1),
			}),

			Content = New("ImageLabel")({
				BackgroundTransparency = 1,
				Image = Constants.TopRounded.Id,
				ImageColor3 = Scheme.GetAnimated(Scheme.Elevation[4]),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Constants.TopRounded.Center,
				SliceScale = Constants.RoundedValues[8],

				Size = UDim2.fromScale(1, 1),

				[Children] = {
					Left = New("Frame")({
						BackgroundTransparency = 1,

						Size = UDim2.fromScale(1, 1),

						[Children] = {
							New("UIListLayout")({
								FillDirection = Enum.FillDirection.Horizontal,
								SortOrder = Enum.SortOrder.LayoutOrder,
							}),

							Icon = New("Frame")({
								BackgroundTransparency = 1,

								Size = UDim2.fromScale(1, 1),

								[Children] = {
									New("UIAspectRatioConstraint")({
										AspectRatio = 1,
									}),

									New("ImageLabel")({
										BackgroundTransparency = 1,
										Image = props.Icon,
										ImageColor3 = Scheme.GetAnimated(Scheme.Color.Text.Primary),
										ScaleType = Enum.ScaleType.Fit,

										AnchorPoint = Vector2.new(0.5, 0.5),
										Position = UDim2.fromScale(0.5, 0.5),
										Size = UDim2.fromScale(0.4, 0.4),
									}),
								},
							}),

							Text = New("Frame")({
								BackgroundTransparency = 1,
								LayoutOrder = 2,

								Size = UDim2.fromScale(0, 1),

								[Children] = {
									New("UIListLayout")({
										FillDirection = Enum.FillDirection.Vertical,
										VerticalAlignment = Enum.VerticalAlignment.Center,
									}),

									Title = New("TextLabel")({
										BackgroundTransparency = 1,
										Font = Scheme.Typography.Header.Font,
										Text = props.Title,
										TextColor3 = Scheme.GetAnimated(Scheme.Color.Text.Primary),
										TextSize = Scheme.Typography.Header.Size,
										TextXAlignment = Enum.TextXAlignment.Left,

										Size = Computed(function()
											return UDim2.fromOffset(0, Scheme.Typography.Header.Size:get())
										end),
									}),

									Subtitle = New("TextLabel")({
										BackgroundTransparency = 1,
										Font = Scheme.Typography.Subheader.Font,
										LayoutOrder = 2,
										Text = props.Subtitle,
										TextColor3 = Scheme.GetAnimated(Scheme.Color.Text.Primary),
										TextSize = Scheme.Typography.Subheader.Size,
										TextXAlignment = Enum.TextXAlignment.Left,
										Visible = Computed(function()
											return props.Subtitle:get() ~= ""
										end),

										Size = Computed(function()
											return UDim2.fromOffset(0, Scheme.Typography.Subheader.Size:get())
										end),
									}),
								},
							}),
						},
					}),

					Right = New("Frame")({
						BackgroundTransparency = 1,

						Size = UDim2.fromScale(1, 1),

						[Children] = {
							New("UIListLayout")({
								FillDirection = Enum.FillDirection.Horizontal,
								HorizontalAlignment = Enum.HorizontalAlignment.Right,
								VerticalAlignment = Enum.VerticalAlignment.Center,
								SortOrder = Enum.SortOrder.LayoutOrder,
							}),

							props[Children],
						},
					}),
				},
			}),
		},
	})
end
