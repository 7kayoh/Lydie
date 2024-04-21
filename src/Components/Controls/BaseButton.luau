-- 7kayoh
-- TextButton.lua
-- 10 February 2022

local Components = script.Parent.Parent
local Modules = Components.Parent.Modules
local Lydie = Components.Parent

local Fusion = require(Lydie.Parent.Fusion)
local Constants = require(Modules.Constants)
local Scheme = require(Modules.Scheme)

local Children = Fusion.Children
local New = Fusion.New
local OnEvent = Fusion.OnEvent

return function(props)
	local layerOpacity = Fusion.Value(1)

	return New("ImageButton")({
		BackgroundTransparency = 1,
		Image = Constants.Rounded.Id,
		ImageColor3 = props.BackgroundColor or Scheme.GetAnimated(Scheme.Color.Text.Primary),
		ImageTransparency = props.BackgroundOpacity or 0.85,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Constants.Rounded.Center,
		SliceScale = props.RoundedValue or Constants.RoundedValues[8],
		LayoutOrder = props.LayoutOrder or 0,
		ZIndex = props.ZIndex,

		AnchorPoint = props.AnchorPoint or Vector2.new(0, 0),
		Position = props.Position or UDim2.fromScale(0, 0),
		Size = props.Size or UDim2.fromOffset(200, 50),

		[Children] = {
			New("ImageLabel")({
				BackgroundTransparency = 1,
				Image = Constants.Rounded.Id,
				ImageColor3 = Color3.new(),
				ImageTransparency = Fusion.Tween(layerOpacity, TweenInfo.new(0.15)),
				LayoutOrder = props.LayoutOrder or 1,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Constants.Rounded.Center,
				SliceScale = props.RoundedValue or Constants.RoundedValues[8],
				Visible = true,
				ZIndex = 2,

				Size = UDim2.fromScale(1, 1),
			}),

			props[Children],
		},

		[OnEvent("MouseEnter")] = function()
			layerOpacity:set(0.85)
		end,

		[OnEvent("MouseLeave")] = function()
			layerOpacity:set(1)
		end,

		[OnEvent("MouseButton1Down")] = function()
			layerOpacity:set(0.7)
			if props.OnClickDown then
				props.OnClickDown()
			end
		end,

		[OnEvent("InputEnded")] = function(input)
			if table.find({Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch}, input.UserInputType) then
				layerOpacity:set(1)
				if props.OnClick then
					props.OnClick()
				end
			end
		end,
	})
end
