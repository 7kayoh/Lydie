-- 7kayoh
-- ColorPicker.lua
-- 24 Apr 2024

local Components = script.Parent.Parent
local Modules = Components.Parent.Modules
local Lydie = Components.Parent

local Fusion = require(Lydie.Parent.Fusion)
local Slider = require(Components.Controls.Slider)
local Constants = require(Modules.Constants)
local Scheme = require(Modules.Scheme)

local Children = Fusion.Children
local Computed = Fusion.Computed
local Hydrate = Fusion.Hydrate
local New = Fusion.New
local Value = Fusion.Value

return function(props)
    local hueValue = props.HueValue or Value(0)
    local satValue = props.SatValue or Value(0)
    local briValue = props.BriValue or Value(0)
    local colorValue = Computed(function()
        return Color3.fromHSV(hueValue:get(), satValue:get(), briValue:get())
    end)

    local function pickerSlider(text, color, value, layoutOrder)
        local sliderComp = Slider {
            GradientColor = color,
            Value = value,
            Stepper = Value(1),
        }
            
        return New "Frame" {
            BackgroundTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.fromScale(1, 0),
            LayoutOrder = layoutOrder,

            [Children] = {
                New "UIListLayout" {
                    Padding = UDim.new(0, 20),
                    FillDirection = Enum.FillDirection.Horizontal,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                },

                New "UIPadding" {
                    PaddingRight = UDim.new(0, 5),
                },
    
                New "TextLabel" {
                    BackgroundTransparency = 1,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    Font = Scheme.Typography.Secondary.Font,
                    Text = text,
                    TextColor3 = Scheme.GetAnimated(Scheme.Color.Text.Secondary),
                    TextXAlignment = Enum.TextXAlignment.Right,
                    TextSize = Scheme.Typography.Secondary.Size,
                    LayoutOrder = 1,
                },

                Hydrate(sliderComp) {
                    ImageColor3 = Color3.new(1, 1, 1),
                    ImageTransparency = 0,
                    Size = UDim2.new(1, -45, 0, 8),
                    LayoutOrder = 2
                }
            }
        }
    end

    return New "Frame" {
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,

        [Children] = {
            New "UIListLayout" {
                Padding = UDim.new(0, 15),
                SortOrder = Enum.SortOrder.LayoutOrder,
            },

            New "ImageLabel" {
                BackgroundTransparency = 1,
                Image = Constants.Rounded.Id,
                ImageColor3 = colorValue,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Constants.Rounded.Center,
                SliceScale = Constants.RoundedValues[8],
    
                Size = UDim2.new(1, 0, 0, 80),
                LayoutOrder = 1,
            },

            pickerSlider("H", Computed(function()
                return ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromHSV(0, satValue:get(), briValue:get())),
                    ColorSequenceKeypoint.new(0.166, Color3.fromHSV(0.166, satValue:get(), briValue:get())),
                    ColorSequenceKeypoint.new(0.333, Color3.fromHSV(0.333, satValue:get(), briValue:get())),
                    ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, satValue:get(), briValue:get())),
                    ColorSequenceKeypoint.new(0.666, Color3.fromHSV(0.666, satValue:get(), briValue:get())),
                    ColorSequenceKeypoint.new(0.833, Color3.fromHSV(0.833, satValue:get(), briValue:get())),
                    ColorSequenceKeypoint.new(1, Color3.fromHSV(1, satValue:get(), briValue:get()))
                })
            end), hueValue, 2),

            pickerSlider("S", Computed(function()
                return ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 0, briValue:get())),
                    ColorSequenceKeypoint.new(1, Color3.fromHSV(hueValue:get(), 1, briValue:get())),
                })
            end), satValue, 3),

            pickerSlider("V", Computed(function()
                return ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 0, 0)),
                    ColorSequenceKeypoint.new(1, Color3.fromHSV(hueValue:get(), satValue:get(), 1)),
                })
            end), briValue, 4),
        }
    }
end