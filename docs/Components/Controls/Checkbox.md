---
tags:
  - Controls
  - Components
---

# Checkbox

<video width="100%" loop autoplay>
  <source src="preview.mp4" type="video/mp4">
</video>

!!! warning
    
    While the usage of checkbox and [toggle](./Toggle.md) may seem familiar, they are not. Checkboxes are often used when the user can **select** one or more items from a list, whereas toggles are used to set the state of an item, like whether to mute audio or not for instance.

Checkbox is used to select one or multiple items from a list.

## Usage
Checkbox can be created by calling `Lydie.Components.Controls.Checkbox`:

```lua
Lydie.Components.Controls.Checkbox {
    OnClick = function(state) -- (1)!
        state:set(not state:get())
        print("Checkbox Clicked", state:get())
    end,
},
```

1.  When passing an `OnClick` function to the toggle, it is important to know that the default behavior of the toggle will be overridden. The toggle state will not react to the user response automatically and requires manual intervention. See [Checkbox.luau:58](https://github.com/7kayoh/Lydie/blob/8ee2f0d74b97db8a30f576396c194ed34eba28b4/src/Components/Controls/Checkbox.luau#L58).

## Properties
| Name        | Description                          | Required | Default |
| ----------- | ------------------------------------ | -------- | ------- |
| `ZIndex` | The Z index of the button, used to show hierarchy of the button. | :x: | `1` |
| `Position` | The relative position of the button | :x: | `UDim2.fromOffset(0, 0)` |

## Functions
| Name        | Description                          | Required |
| ----------- | ------------------------------------ | -------- |
| `OnClick: (state: Fusion.Value<boolean>) -> ()` | A function invoked when `MouseButton1Up` is fired, where a user clicks the button and releases | :x: |