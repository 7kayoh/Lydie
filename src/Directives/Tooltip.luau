local Directives = script.Parent
local Package = Directives.Parent
local Components = require(Package.Components)

return function(scope, value, applyTo)
	local compScope = scope:innerScope()
	local isVisible = compScope:Value(false)
	local compPosition = compScope:Value(UDim2.fromOffset(0, 0))
	local tailDirection = compScope:Value("Left")
	local tooltip = Components.Containment.Tooltip(compScope, {
		TailDirection = tailDirection,
		Position = compPosition,
		Text = value,
		RichText = true,
		Visible = isVisible,
	})

	table.insert(
		compScope,
		applyTo.MouseEnter:Connect(function()
			isVisible:set(true)
		end)
	)

	table.insert(
		compScope,
		applyTo.MouseMoved:Connect(function(x, y)
			if isVisible:get() then
				local offset
				if tooltip.AbsoluteSize.Y <= 28 then
					offset = ((tooltip.AbsoluteSize.Y * 2) - 5)
				else
					offset = 50
				end

				if x - tooltip.AbsoluteSize.X >= 0 then
					tailDirection:set("Right")
					compPosition:set(
						UDim2.new(0, x - tooltip.AbsoluteSize.X + 15, 0, y - (tooltip.AbsoluteSize.Y / 2) - offset)
					)
				else
					tailDirection:set("Left")
					compPosition:set(UDim2.new(0, x - 15, 0, y - (tooltip.AbsoluteSize.Y / 2) - offset))
				end
			end
		end)
	)

	table.insert(
		compScope,
		applyTo.MouseLeave:Connect(function()
			isVisible:set(false)
		end)
	)

	return {
		cleanUp = function()
            compScope:doCleanup()
		end,
	}
end
