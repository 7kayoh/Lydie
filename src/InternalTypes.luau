local Package = script.Parent
local Fusion = require(Package.Parent.Fusion)

export type Scope = Fusion.Scope<unknown>
export type OptionalState<T> = Fusion.Value<T, Scope> | T
export type DirectiveClass = {
    cleanUp: () -> ()
}
export type DirectiveClassConstructor<T, F> = (scope: Scope, value: T, applyTo: F) -> DirectiveClass
export type Directives = {
    Tooltip: DirectiveClassConstructor<OptionalState<string>, GuiObject>
}

return {}