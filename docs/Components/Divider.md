---
tags:
  - Components
---

# Divider

Divider is a thin grey line, used to separate multiple objects.

## Usage
Divider can be created by calling `Lydie.Components.Divider`:

```lua
Lydie.Components.Divider {
    ZIndex = 2,

    AnchorPoint = Vector2.new(0, 1),
    Position = UDim2.fromScale(0, 1),
},
```

## Properties
| Name        | Description                          | Required | Default |
| ----------- | ------------------------------------ | -------- | ------- |
| `Size` | The size of the divider | :x: | `UDim2.new(1, 0, 0, 1)` |
| `ZIndex` | The Z index of the divider | :x: | `1` |
| `AnchorPoint` | The anchor point of the divider | :x: | `Vector2.new(0, 0)` |
| `Position` | The relative position of the divider | :x: | `UDim2.new(0, 0, 0, 0)` |