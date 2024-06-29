--!strict
--!nolint LocalUnused
--!nolint LocalShadow
local task = nil -- Disable usage of Roblox's task scheduler



local Package = script.Parent.Parent
local Fusion = require(Package.Parent.Fusion)

local Directives = require(script.Parent)
local InternalTypes = require(Package.InternalTypes)

return function(directiveName: string)
	return {
		type = "SpecialKey",
		kind = "Directive",
		stage = "observer",
		apply = function(
			self: Fusion.SpecialKey,
			scope: Fusion.Scope<unknown>,
			value: any,
			applyTo: Instance
		)
			local directive = Directives[directiveName]
			if directive then
				local class = directive(scope, value, applyTo) :: InternalTypes.DirectiveClass
				table.insert(scope, function()
                    value = nil
                    class.cleanUp()
                end)
			else
				error(`[Lydie] This directive {directiveName} is not implemented yet.`)
			end
		end,
	} :: Fusion.SpecialKey
end
