---
tags:
  - Controls
  - Components
---

# Slider

<video width="100%" loop autoplay>
  <source src="preview.mp4" type="video/mp4">
</video>

Slider is used to let users make selection from a range of values

## Usage
Slider can be created by calling `Lydie.Components.Controls.Slider`:

```lua
local sliderValue = Fusion.Value(0)

Lydie.Components.Controls.Slider {
    Value = sliderValue, -- (1)!
    Stepper = 10,
},

Fusion.Observer(sliderValue):onChange(function()
    print("Slider value changed to ", sliderValue:get())
end
```

1.  Slider does not provide a function that will be invoked on slider value change, you can manually attach a `Fusion.Value` into the properties table as `["Value"]`, and observe the changes using `Fusion.Observer`.

## Properties
| Name        | Description                          | Required | Default |
| ----------- | ------------------------------------ | -------- | ------- |
| `Value` | The value user is selecting in the slider | :x: | `Fusion.Value(0)` |
| `Stepper` | The stepper portions of the slider. If set to `0`, the slider will become indiscrete. | :x: | `Fusion.Value(5)` |
| `Position` | The relative position of the slider | :x: | `UDim2.fromOffset(0, 0)` |
| `Width` | The width of the slider | :x: | `200` |