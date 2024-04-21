local EnumList = require(script.Parent.EnumList)

local rect256 = Rect.new(Vector2.new(256, 256), Vector2.new(256, 256))

return {
	BottomRounded = EnumList.new("BottomRounded", {
		Center = rect256,
		Id = "rbxassetid://8858987793",
	}),

	Rounded = EnumList.new("Rounded", {
		Center = rect256,
		Id = "rbxassetid://8858983293",
	}),

	TopRounded = EnumList.new("TopRounded", {
		Center = rect256,
		Id = "rbxassetid://8858987141",
	}),

	RoundedValues = EnumList.new("RoundedValues", {
		[8] = 0.03,
		[7] = 0.025,
		[6] = 0.02,
	}),

	Elevation = EnumList.new("Elevation", {
		[0] = 0,
		[1] = 1,
		[2] = 2,
		[3] = 3,
		[4] = 4,
		[6] = 6,
		[8] = 8,
		[9] = 9,
		[12] = 12,
		[16] = 16,
	}),

	ShadowImage = "rbxassetid://1316045217",
}
