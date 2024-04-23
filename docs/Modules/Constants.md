---
tags:
  - Modules
---

# Constants

Constants is a table of data that is not meant to be changed during runtime. In Lydie, they are used to store the appearance values of different components, like [Shadow](../Components/Shadow.md).

```lua title="Constants.luau"
local EnumList = require(script.Parent.EnumList)

local rect256 = Rect.new(Vector2.new(256, 256), Vector2.new(256, 256))

return {
	BottomRounded = EnumList.new("BottomRounded", { -- (1)!
		Center = rect256,
		Id = "rbxassetid://8858987793",
	}),

	Rounded = EnumList.new("Rounded", { -- (2)!
		Center = rect256,
		Id = "rbxassetid://8858983293",
	}),

	TopRounded = EnumList.new("TopRounded", { -- (3)!
		Center = rect256,
		Id = "rbxassetid://8858987141",
	}),

	RoundedValues = EnumList.new("RoundedValues", { -- (4)!
		[8] = 0.03,
		[7] = 0.025,
		[6] = 0.02,
	}),

	Elevation = EnumList.new("Elevation", { -- (5)!
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

	ShadowImage = "rbxassetid://1316045217", -- (6)!
}
```

1.  This is the image for objects that only wanted the bottom corners to be rounded, this is used in [BottomAppBar](../Components/View/BottomAppBar.md)
2.  This is the image for objects that only wanted the all corners to be rounded, this is used in many components, such as [BaseButton](../Components/Controls/Buttons/BaseButton.md)
3.  This is the image for objects that only wanted the top corners to be rounded, this is used in [TopAppBar](../Components/View/TopAppBar.md)
4.  This is the list of rounded values in Lydie, we only use from `8px` to `6px`. The rounded values in the list are the `SliceScale` values for `TopRounded`, `Rounded`, and `BottomRounded` images.
5.  This is the list of elevation values in Lydie. They are used in defining shadow sizes. See [Shadow](../Components/Shadow.md).
6.  This is the image of the [Shadow](../Components/Shadow.md) component.