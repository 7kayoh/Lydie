local Containment = script.Parent
local Components = Containment.Parent
local Package = Components.Parent

local Fusion = require(Package.Parent.Fusion)
local InternalTypes = require(Package.InternalTypes)

type ButtonVariant = "Default" | "Outlined" | "Tonal" | "Text"

type ButtonProperties = {
    AutomaticSize: InternalTypes.OptionalState<boolean>?,
    Size: InternalTypes.OptionalState<UDim2>,
    Position: InternalTypes.OptionalState<UDim2>,
    Color: InternalTypes.OptionalState<Color3>,
    Variant: InternalTypes.OptionalState<ButtonVariant>?,
    RichText: InternalTypes.OptionalState<boolean>?,
    Text: InternalTypes.OptionalState<string>?,
    Icon: InternalTypes.OptionalState<string>?,
    PrependIcon: InternalTypes.OptionalState<string>?,
    AppendIcon: InternalTypes.OptionalState<string>?,
}

local function Button(scope: InternalTypes.Scope, props: ButtonProperties): TextButton
    local compScope = scope:innerScope()
    
    return compScope:New "TextButton" {
        BackgroundColor3 = compScope:Computed(function(use)
            --local variant = use(props.Variant)
            local color = use(props.Color)

            return color
        end),
        BorderSizePixel = 0,
        BackgroundTransparency = compScope:Computed(function(use)
            local variant = if props.Variant then use(props.Variant) else "Default"
            if variant == "Default" then
                return 0
            elseif variant == "Tonal" then
                return 0.5
            elseif (variant == "Outlined") or (variant == "Text") then
                return 1
            end
        end),

        [Fusion.Children] = {
            compScope:Computed(function(use)
                local text = if props.Text then use(props.Text) else nil
                if text then
                    return compScope:New "TextLabel" {
                        BackgroundTransparency = 1,
                        TextLabel = text,
                    }
                end
            end),
        }
    }
end

return Button