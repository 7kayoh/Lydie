-- 7kayoh
-- Shadow.lua
-- 29 January 2022

-- This component uses code from AmaranthineCodices's Shadow component for roact-material, hosted at
-- https://github.com/AmaranthineCodices/roact-material/blob/master/src/Components/Shadow.lua, licensed under
-- the MIT license

--[[

    Shadow {
        Elevation: Value<number>|number,
		Size: number?,
		ZIndex: number?
    } -> Frame

--]]
local Components = script.Parent
local Modules = Components.Parent.Modules
local Lydie = Components.Parent

local Fusion = require(Lydie.Parent.Fusion)
local Constants = require(Modules.Constants)

local Children = Fusion.Children
local ForValues = Fusion.ForValues
local New = Fusion.New
local Value = Fusion.Value

local shadowData = {
	[0] = {
		Ambient = {
			Opacity = 0,
			Blur = 0,
		},

		Penumbra = {
			Opacity = 0,
			Blur = 0,
		},

		Umbra = {
			Opacity = 0,
			Blur = 0,
		},
	},

	[1] = {
		Ambient = {
			Opacity = 0.2,
			Blur = 3,
			Offset = UDim2.new(0, 0, 0, 1),
		},

		Penumbra = {
			Opacity = 0.12,
			Blur = 2,
			Offset = UDim2.new(0, 0, 0, 2),
		},

		Umbra = {
			Opacity = 0.14,
			Blur = 2,
		},
	},

	[2] = {
		Ambient = {
			Opacity = 0.2,
			Blur = 5,
			Offset = UDim2.new(0, 0, 0, 1),
		},

		Penumbra = {
			Opacity = 0.12,
			Blur = 4,
			Offset = UDim2.new(0, 0, 0, 3),
		},

		Umbra = {
			Opacity = 0.14,
			Blur = 4,
		},
	},

	[3] = {
		Ambient = {
			Opacity = 0.2,
			Blur = 8,
			Offset = UDim2.new(0, 0, 0, 1),
		},

		Penumbra = {
			Opacity = 0.12,
			Blur = 4,
			Offset = UDim2.new(0, 0, 0, 3),
		},

		Umbra = {
			Opacity = 0.14,
			Blur = 3,
			Offset = UDim2.new(0, 0, 0, 3),
		},
	},

	[4] = {
		Ambient = {
			Opacity = 0.2,
			Blur = 10,
			Offset = UDim2.new(0, 0, 0, 1),
		},

		Penumbra = {
			Opacity = 0.12,
			Blur = 5,
			Offset = UDim2.new(0, 0, 0, 4),
		},

		Umbra = {
			Opacity = 0.14,
			Blur = 4,
			Offset = UDim2.new(0, 0, 0, 2),
		},
	},

	[6] = {
		Ambient = {
			Opacity = 0.2,
			Blur = 5,
			Offset = UDim2.new(0, 0, 0, 3),
		},

		Penumbra = {
			Opacity = 0.12,
			Blur = 18,
			Offset = UDim2.new(0, 0, 0, 1),
		},

		Umbra = {
			Opacity = 0.14,
			Blur = 10,
			Offset = UDim2.new(0, 0, 0, 6),
		},
	},

	[8] = {
		Ambient = {
			Opacity = 0.2,
			Blur = 15,
			Offset = UDim2.new(0, 0, 0, 4),
		},

		Penumbra = {
			Opacity = 0.12,
			Blur = 14,
			Offset = UDim2.new(0, 0, 0, 3),
		},

		Umbra = {
			Opacity = 0.14,
			Blur = 10,
			Offset = UDim2.new(0, 0, 0, 8),
		},
	},

	[9] = {
		Ambient = {
			Opacity = 0.2,
			Blur = 6,
			Offset = UDim2.new(0, 0, 0, 5),
		},

		Penumbra = {
			Opacity = 0.12,
			Blur = 16,
			Offset = UDim2.new(0, 0, 0, 3),
		},

		Umbra = {
			Opacity = 0.14,
			Blur = 12,
			Offset = UDim2.new(0, 0, 0, 9),
		},
	},

	[12] = {
		Ambient = {
			Opacity = 0.2,
			Blur = 8,
			Offset = UDim2.new(0, 0, 0, 7),
		},

		Penumbra = {
			Opacity = 0.12,
			Blur = 22,
			Offset = UDim2.new(0, 0, 0, 5),
		},

		Umbra = {
			Opacity = 0.14,
			Blur = 17,
			Offset = UDim2.new(0, 0, 0, 12),
		},
	},

	[16] = {
		Ambient = {
			Opacity = 0.2,
			Blur = 10,
			Offset = UDim2.new(0, 0, 0, 8),
		},

		Penumbra = {
			Opacity = 0.12,
			Blur = 30,
			Offset = UDim2.new(0, 0, 0, 6),
		},

		Umbra = {
			Opacity = 0.14,
			Blur = 24,
			Offset = UDim2.new(0, 0, 0, 16),
		},
	},
}

for _, elevation in pairs(shadowData) do
	for _, data in pairs(elevation) do
		data.Size = UDim2.new(1, data.Blur, 1, data.Blur)
		data.Position = UDim2.new(0.5, 0, 0.5, 0) + (data.Offset or UDim2.new())
		data.ImageTransparency = 1 - data.Opacity

		data.Blur = nil
		data.Offset = nil
		data.Opacity = nil
	end
end

return function(props)
	if type(props.Elevation) == "number" then
		props.Elevation = Value(props.Elevation)
	end

	local shadows = ForValues({ "Penumbra", "Umbra", "Ambient" }, function(value)
		local data = shadowData[props.Elevation:get()] or shadowData[0]
		data = data[value]

		return New("ImageLabel")({
			BackgroundTransparency = 1,
			Image = Constants.ShadowImage,
			ImageColor3 = Color3.new(0, 0, 0),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(10, 10, 118, 118),
			ImageTransparency = data.ImageTransparency,

			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = data.Size,
			Position = data.Position,
		})
	end, function(obj)
        obj:Destroy()
    end)

	return New("Frame")({
		BackgroundTransparency = 1,
		ZIndex = props.ZIndex or 1,

		Size = props.Size or UDim2.fromScale(1, 1),

		[Children] = shadows,
	})
end
