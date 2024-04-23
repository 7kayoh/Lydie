---
tags:
  - Controls
  - Components
---

# TextField

<video width="100%" loop autoplay>
  <source src="preview.mp4" type="video/mp4">
</video>

TextField is an extension of the existing `TextBox` class from Roblox. TextField provides more expressive styling and accessibility features, such as proper cursor support.

## Usage
TextField can be created by calling `Lydie.Components.Controls.TextField`:

```lua
Lydie.Components.Controls.TextField {
    PlaceholderText = "Type me!"

    OnTextChanged = function(text)
        print("Changed to: " .. text)
    end,
}
```

## Properties
| Name        | Description                          | Required | Default |
| ----------- | ------------------------------------ | -------- | ------- |
| `ForegroundColor`       | Foreground color of the TextField, used to color the outline when active | :x: | `Scheme.Accent` |
| `Text`       | The text string of the TextField. | :x: | `""` |
| `PlaceholderText`       | The placeholder text string of the TextField. | :x: | `"Click to type` |
| `LayoutOrder` | The layout order of the button, used in a `UIListLayout`/`UIGridLayout` | :x: | `1` |
| `ZIndex` | The Z index of the button, used to show hierarchy of the button. | :x: | `1` |
| `Position` | The relative position of the button | :x: | `UDim2.fromScale(0, 0)` |
| `Size` | The size of the button | :x: | `UDim2.fromOffset(200, 42)` |

## Functions
| Name        | Description                          | Required |
| ----------- | ------------------------------------ | -------- |
| `OnClick: () -> ()` | A function invoked when `MouseButton1Up` is fired, where a user clicks the button and releases | :x: |
| `OnTextChanged: (text: string) -> ()` | A function invoked when `Text` is changed | :x: |