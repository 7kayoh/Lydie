local Package = script.Parent.Parent

local InternalTypes = require(Package.InternalTypes)

return {
    Tooltip = require(script.Parent.Tooltip)
} :: InternalTypes.Directives -- empty for now.