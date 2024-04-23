# Using Lydie

Lydie follows the same code pattern found in Fusion, all components are wrapped in a function and can be created by calling it with the properties table. Like:
```lua
local Lydie = require(Packages.Lydie)

Lydie.Components.Divider {
    Size = UDim2.new(1, 0, 0, 1),
    ZIndex = 2,
}
```