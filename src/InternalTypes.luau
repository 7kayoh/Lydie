local Package = script.Parent
local Fusion = require(Package.Parent.Fusion)

export type Scope = Fusion.Scope<unknown>
export type OptionalState<T> = Fusion.Value<T, Scope> | T
export type DirectiveClass = {
    cleanUp: (self: DirectiveClass) -> ()
}
export type DirectiveClassConstructor = (scope: Scope, value: any, applyTo: Instance) -> DirectiveClass

return {}