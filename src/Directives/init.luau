--!strict
--!nolint LocalUnused
--!nolint LocalShadow
local task = nil -- Disable usage of Roblox's task scheduler

local Package = script.Parent
local Fusion = require(Package.Parent.Fusion)

local Directives = require(script.DirectiveList)
local InternalTypes = require(Package.InternalTypes)

local function directiveKey(directiveName: string)
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

local metaDirectives; metaDirectives = setmetatable({}, {
	__index = function(_, key: string)
		return directiveKey(key)
	end,
	__newIndex = function()
		error("Can't write private properties")
	end,
	__metatable = "This metatable is locked",
}) :: InternalTypes.Directives & typeof(metaDirectives)

return metaDirectives