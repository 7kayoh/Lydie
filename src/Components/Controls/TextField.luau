local TextService = game:GetService("TextService")
local Components = script.Parent.Parent
local Modules = Components.Parent.Modules
local Lydie = Components.Parent

local Fusion = require(Lydie.Parent.Fusion)
local Constants = require(Modules.Constants)
local Scheme = require(Modules.Scheme)

local Children = Fusion.Children
local Computed = Fusion.Computed
local New = Fusion.New
local OnEvent = Fusion.OnEvent
local OnChange = Fusion.OnChange
local Value = Fusion.Value

return function(props)
	local buttonState = Value(0)
	local canvasPosition = Value(Vector2.new(0, 0))
	props.ObservedText = props.ObservedText or Value(props.Text or "")

	local padding = Computed(function()
		if buttonState:get() == 2 then
			return UDim.new(0, 2)
		else
			return UDim.new(0, 1)
		end
	end)

	local textBox = Value(New("TextBox")({
		BackgroundTransparency = 1,
		ClearTextOnFocus = false,
		Font = Scheme.Typography.Body.Font,
		PlaceholderText = props.Placeholder or "Click to type",
		Text = props.Text or "",
		TextColor3 = Scheme.GetAnimated(Scheme.Color.Text.Primary),
		TextSize = Scheme.Typography.Body.Size,
		TextXAlignment = Enum.TextXAlignment.Left,
		PlaceholderColor3 = Scheme.GetAnimated(Scheme.Color.Text.Tertiary),

		Size = UDim2.new(1, 0, 1, 0),

		[OnChange("Text")] = function(text)
			props.ObservedText:set(text)
			if props.OnTextChanged then
				props.OnTextChanged(text)
			end
		end,

		[OnChange("CursorPosition")] = function(value)
			canvasPosition:set(
				TextService:GetTextSize(
					string.sub(props.ObservedText:get(), 1, value),
					Scheme.Typography.Body.Size:get(),
					Scheme.Typography.Body.Font:get(),
					Vector2.new(math.huge, math.huge)
				)
			)
		end,

		[OnEvent("FocusLost")] = function()
			buttonState:set(0)
		end,

		[OnEvent("Focused")] = function()
			buttonState:set(2)
		end,
	}))

	return New("ImageButton")({
		BackgroundTransparency = 1,
		Image = Constants.Rounded.Id,
		ImageColor3 = Scheme.GetAnimated(Computed(function()
			if buttonState:get() == 1 then
				return Scheme.Color.Text.Secondary:get()
			elseif buttonState:get() == 2 then
				return props.ForegroundColor and props.ForegroundColor:get() or Scheme.Accent:get()
            else
                return Scheme.Color.Text.Tertiary:get()
            end
		end)),
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Constants.Rounded.Center,
		SliceScale = Constants.RoundedValues[8],
		ZIndex = props.ZIndex or 1,
		LayoutOrder = props.LayoutOrder or 1,

		Size = props.Size or UDim2.fromOffset(200, 42),
		Position = props.Position or UDim2.fromScale(0, 0),

		[Children] = {
			New("UIPadding")({
				PaddingTop = padding,
				PaddingLeft = padding,
				PaddingRight = padding,
				PaddingBottom = padding,
			}),

			New("ImageLabel")({
				BackgroundTransparency = 1,
				Image = Constants.Rounded.Id,
				ImageColor3 = Scheme.GetAnimated(Scheme.Elevation[2]),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Constants.Rounded.Center,
				SliceScale = Computed(function()
					if buttonState:get() == 2 then
						return Constants.RoundedValues[6]
					else
						return Constants.RoundedValues[7]
					end
				end),
				ClipsDescendants = true,

				Size = UDim2.new(1, 0, 1, 0),

				[Children] = {
					New("ScrollingFrame")({
						BackgroundTransparency = 1,
						ScrollBarThickness = 0,
						ScrollingDirection = Enum.ScrollingDirection.X,
						ClipsDescendants = false,

						CanvasPosition = Fusion.Tween(canvasPosition, TweenInfo.new(0.1, Enum.EasingStyle.Quint)),
						CanvasSize = Fusion.Tween(
							Computed(function()
								return UDim2.fromOffset(canvasPosition:get().X, canvasPosition:get().Y)
							end),
							TweenInfo.new(0.1, Enum.EasingStyle.Quint)
						),
						Position = Computed(function()
							return UDim2.fromOffset(Scheme.Typography.Body.Size:get(), 0)
						end),
						Size = Computed(function()
							return UDim2.new(1, -Scheme.Typography.Body.Size:get() * 2, 1, 0)
						end),

						[Children] = textBox,
					}),
				},
			}),
		},

		[OnEvent("MouseEnter")] = function()
			if not textBox:get():IsFocused() then
				buttonState:set(1)
			end
		end,

		[OnEvent("MouseLeave")] = function()
			if not textBox:get():IsFocused() then
				buttonState:set(0)
			end
		end,

		[OnEvent("MouseButton1Up")] = function()
			if not textBox:get():IsFocused() then
				textBox:get():CaptureFocus()
			else
				buttonState:set(0)
			end
			if props.OnClick then
				props.OnClick()
			end
		end,
	})
end
