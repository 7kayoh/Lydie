-- 7kayoh
-- Slider.lua
-- 2 Apr 2022

local UserInputService = game:GetService("UserInputService")

local Components = script.Parent.Parent
local Modules = Components.Parent.Modules
local Lydie = Components.Parent

local Fusion = require(Lydie.Parent.Fusion)
local Scheme = require(Modules.Scheme)
local Constants = require(Modules.Constants)
local BaseButton = require(Components.Controls.BaseButton)
local ToolTip = require(Components.Views.ToolTip)

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local Computed = Fusion.Computed
local Observer = Fusion.Observer
local Tween = Fusion.Tween

return function(props)
	local isListening = Value(false)
	props.Value = props.Value or Value(0)
	props.Stepper = props.Stepper or Value(5)
	local bar = BaseButton({
		Position = props.Position or UDim2.fromScale(0, 0),
		Size = UDim2.new(0, props.Width or 200, 0, 8),
		RoundedValue = 1,

		[Children] = {
			BaseButton({
				BackgroundColor = Scheme.GetAnimated(Scheme.Accent),
				BackgroundOpacity = 0,
				ZIndex = 3,

				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = Computed(function()
					return UDim2.fromScale(props.Value:get(), 0.5)
				end),
				Size = UDim2.new(3, 0, 3, 0),
				RoundedValue = 1,

				[Children] = {
					New("UIAspectRatioConstraint")({
						AspectRatio = 1,
					}),

					New("ImageLabel")({
						BackgroundTransparency = 1,
						ImageColor3 = Scheme.GetAnimated(Scheme.Elevation[4]),
						Image = Constants.Rounded.Id,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Constants.Rounded.Center,
						SliceScale = 1,

						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						Size = Tween(Computed(function()
                            if isListening:get() then
                                return UDim2.fromScale(0.6, 0.6)
                            else
                                return UDim2.fromScale(0.7, 0.7)
                            end
                        end), TweenInfo.new(0.3, Enum.EasingStyle.Back)),
					}),

					ToolTip({
						Text = props.Value,
						Visible = isListening,
					}),
				},

				OnClickDown = function()
					isListening:set(true)
				end,
				OnClick = function()
					isListening:set(false)
				end,
			}),
		},

		OnClickDown = function()
			isListening:set(true)
		end,
		OnClick = function()
			isListening:set(false)
		end,
	})

	local function getClosestStep(value)
		local step = props.Stepper:get()
		local closest = math.floor(value / step) * step
		return closest / 100
	end

	local function update(input)
		if isListening:get() then
			local percentage
			if
				table.find(
					{ Enum.UserInputType.MouseMovement, Enum.UserInputType.Touch, Enum.UserInputType.MouseButton1 },
					input.UserInputType
				)
			then
				local delta = input.Position.X - bar.AbsolutePosition.X
				percentage = delta / bar.AbsoluteSize.X
			end
			if percentage then
				percentage = getClosestStep(math.clamp(percentage, 0, 1) * 100)
				props.Value:set(percentage)
			end
		end
	end

	local connection = UserInputService.InputChanged:Connect(update)
	local connection2 = UserInputService.InputBegan:Connect(update)
	local disconnectObserver = Observer(props.Value):onChange(function()
		props.Value:set(getClosestStep(math.clamp(props.Value:get(), 0, 1) * 100))
	end)

	bar.Destroying:Connect(function()
		connection:Disconnect()
		connection2:Disconnect()
		disconnectObserver()
	end)

	return bar
end
