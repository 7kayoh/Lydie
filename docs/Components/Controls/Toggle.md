---
tags:
  - Controls
  - Components
---

# Toggle

<video width="100%" loop autoplay>
  <source src="preview.mp4" type="video/mp4">
</video>

Toggle is used to toggle the selection of an item on or off. They are best used to let users adjust settings.

## Usage
Toggle can be created by calling `Lydie.Components.Controls.Toggle`:

```lua
Lydie.Components.Controls.Toggle {
    OnClick = function(state) -- (1)!
        state:set(not state:get())
        print("Toggle Clicked", state:get())
    end,
},
```

1.  When passing an `OnClick` function to the toggle, it is important to know that the default behavior of the toggle will be overridden. The toggle state will not react to the user response automatically and requires manual intervention. See [Toggle.luau:80](https://github.com/7kayoh/Lydie/blob/8ee2f0d74b97db8a30f576396c194ed34eba28b4/src/Components/Controls/Toggle.luau#L80).

## Properties
| Name        | Description                          | Required | Default |
| ----------- | ------------------------------------ | -------- | ------- |
| `ZIndex` | The Z index of the button, used to show hierarchy of the button. | :x: | `1` |
| `Position` | The relative position of the button | :x: | `UDim2.fromOffset(0, 0)` |

## Functions
| Name        | Description                          | Required |
| ----------- | ------------------------------------ | -------- |
| `OnClick: (state: Fusion.Value<boolean>) -> ()` | A function invoked when `MouseButton1Up` is fired, where a user clicks the button and releases | :x: |