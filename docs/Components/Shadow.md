---
tags:
  - Components
---

# Shadow

!!! note

    This component uses code from AmaranthineCodices's Shadow component in MIT-licensed roact-material, see [Shadow.lua](https://github.com/AmaranthineCodices/roact-material/blob/master/src/Components/Shadow.lua).

Shadow is a stack of three shadow images of different properties to emulate the physical properties of shadow in real life. This is often used to show the hierarchy of an object in visual ways.

## Usage
Shadow can be created by calling `Lydie.Components.Shadow`:

```lua
Lydie.Components.Shadow {
    Elevation = Value(Constants.Elevation[4]),
    ZIndex = 0,
    Size = UDim2.fromScale(1, 1),
},
```

## Properties
| Name        | Description                          | Required | Default |
| ----------- | ------------------------------------ | -------- | ------- |
| `Size` | The size of the shadow | :x: | `UDim2.fromScale(1, 1)` |
| `ZIndex` | The Z index of the shadow | :x: | `1` |
| `Elevation` | The elevation index of the shadow. You should use [`Constants.Elevation`](../Modules/Constants.md) enums. | :white_check_mark: | `NaN` |