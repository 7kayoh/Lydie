local Package = script.Parent

local InternalTypes = require(Package.InternalTypes)

type Directives = {
    [string]: InternalTypes.DirectiveClassConstructor
}

return {} :: Directives -- empty for now.