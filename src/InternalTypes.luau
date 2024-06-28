local Package = script.Parent
local Fusion = require(Package.Parent.Fusion)

export type Scope = Fusion.Scope<typeof(Fusion)>
export type OptionalState<T> = Fusion.Value<T> | T

return {}