local Containment = script.Parent
local Components = Containment.Parent
local Package = Components.Parent

local Fusion = require(Package.Parent.Fusion)
local InternalTypes = require(Package.InternalTypes)

type TooltipProperties = {
    Position: Fusion.Value<UDim2, InternalTypes.Scope>,
    Color: InternalTypes.OptionalState<Color3>?,
    RichText: InternalTypes.OptionalState<boolean>?,
    Text: InternalTypes.OptionalState<string>?,
    Visible: InternalTypes.OptionalState<boolean>,
    TailDirection: InternalTypes.OptionalState<"Left" | "Right">,
}

local function Tooltip(scope: InternalTypes.Scope, props: TooltipProperties): Frame
    local compScope = scope:innerScope()
    local backgroundColor = compScope:Computed(function(use)
        if props.Color and use(props.Color) then
            return use(props.Color)
        else
            return Color3.fromRGB(12, 12, 12)
        end
    end)
    
    -- TODO: Implement themeing support, i.e. border radius, font and text style.
    return compScope:New "Frame" {
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = backgroundColor,
        Position = props.Position,
        Size = UDim2.fromOffset(0, 24),
        ZIndex = 1,
        Visible = props.Visible,
    
        [Fusion.Children] = {
            compScope:New "Frame" {
                AnchorPoint = Vector2.new(0, 1),
                BackgroundColor3 = backgroundColor,
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0, 1, 5),
                Rotation = 45,
                Size = UDim2.fromOffset(12, 12),
                ZIndex = 1,
                Visible = compScope:Computed(function(use)
                    return use(props.TailDirection) == "Left"
                end),
    
                [Fusion.Children] = {
                    compScope:New "UICorner" {
                        CornerRadius = UDim.new(0, 3),
                    },
                }
            },
    
            compScope:New "UICorner" {
                CornerRadius = UDim.new(0, 12),
            },
    
            compScope:New "Frame" {
                AnchorPoint = Vector2.new(1, 1),
                BackgroundColor3 = backgroundColor,
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                BorderSizePixel = 0,
                Position = UDim2.new(1, 0, 1, 5),
                Rotation = 45,
                Size = UDim2.fromOffset(12, 12),
                Visible = compScope:Computed(function(use)
                    return use(props.TailDirection) == "Right"
                end),
                ZIndex = 1,
    
                [Fusion.Children] = {
                    compScope:New "UICorner" {
                        CornerRadius = UDim.new(0, 3),
                    },
                }
            },
    
            compScope:New "Frame" {
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                ZIndex = 2,
    
                [Fusion.Children] = {
                    compScope:New "TextLabel" {
                        FontFace = Font.new(
                            "rbxassetid://11702779517",
                            Enum.FontWeight.SemiBold,
                            Enum.FontStyle.Normal
                        ),
                        RichText = props.RichText,
                        Text = props.Text,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 14,
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.XY,
                        BackgroundTransparency = 1,
                        ZIndex = 1,
    
                        [Fusion.Children] = {
                            compScope:New "UISizeConstraint" {
                                MaxSize = Vector2.new(150, math.huge),
                                MinSize = Vector2.new(12, 0),
                            },
                        }
                    },
    
                    compScope:New "UIListLayout" {
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                    },
    
                    compScope:New "UIPadding" {
                        PaddingBottom = UDim.new(0, 5),
                    },
                }
            },
    
            compScope:New "UIPadding" {
                PaddingLeft = UDim.new(0, 12),
                PaddingRight = UDim.new(0, 12),
                PaddingTop = UDim.new(0, 5),
            },
        }
    }
end

return Tooltip