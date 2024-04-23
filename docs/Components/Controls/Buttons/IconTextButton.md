---
tags:
  - Controls
  - Components
  - Buttons
---

# IconTextButton

<video width="100%" loop autoplay>
  <source src="preview.mp4" type="video/mp4">
</video>

IconTextButton is a class inherited from [BaseButton](./BaseButton.md), compared to its ancestor, IconTextButton provides both infographic and text support on top of a button.

## Usage
IconTextButton can be created by calling `Lydie.Components.Controls.IconTextButton`:

```lua
local textState = Fusion.Value("Hello world!")

Lydie.Components.Controls.IconTextButton {
    Size = UDim2.fromOffset(200, 40),
    Text = textState,
    Icon = Icons.album, -- (1)!

    OnClickDown = function(),
        textState:set("Hello world??")
    end,

    OnClick = function() -- (2)!
        textState:set("Hello world!")
    end,
}
```

1.  `Icon` property accepts both a string of a state-wrapped string. The string should be either the asset URL or the ID of the image. Lydie has provided a list of icons from Lucide Icons for basic usage. Spritesheet-based icons are not supported at the moment.

2.  `OnClick` function will be invoked when `InputEnded` is fired and its input type matches either `Enum.UserInputType.MouseButton1` or `Enum.UserInputType.Touch`. Due to how input events work in Roblox, input will sink no matter what. You should ensure the user is clicking the button before doing any further processing. See [BaseButton.luau:69](https://github.com/7kayoh/Lydie/blob/8ee2f0d74b97db8a30f576396c194ed34eba28b4/src/Components/Controls/BaseButton.luau#L69).

## Properties

!!! note

    While being inherited from [BaseButton](./BaseButton.md), TextButton does not allow using the `Fusion.Children` to insert children as it will be used to insert the text label and the icon instead.

| Name        | Description                          | Required | Default |
| ----------- | ------------------------------------ | -------- | ------- |
| `BackgroundColor`       | Background color of the button  | :x: | `Scheme.GetAnimated(Scheme.Color.Text.Primary)` |
| `BackgroundOpacity`       | Background opacity of the button | :x: | `0.85` |
| `ForegroundColor`       | Foreground color of the button, used to color the text and icon | :x: | `BackgroundColor` or `Scheme.GetAnimated(Scheme.Color.Text.Primary)` |
| `Icon`       | The asset URL/ID of the icon. | :white_check_mark: | `nil` |
| `Text`       | The text string of the button. | :white_check_mark: | `nil` |
| `RoundedValue`    | The radius of the 4 corners | :x: | `Constants.RoundedValues[8]` |
| `LayoutOrder` | The layout order of the button, used in a `UIListLayout`/`UIGridLayout` | :x: | `0` |
| `ZIndex` | The Z index of the button, used to show hierarchy of the button. | :white_check_mark: | `NaN` |
| `AnchorPoint` | The location of the anchor point, defined in `Vector2` | :x: | `Vector2.new(0, 0)` |
| `Position` | The relative position of the button | :x: | `UDim2.fromScale(0, 0)` |
| `Size` | The size of the button | :x: | `UDim2.fromOffset(200, 50)` |

## Functions
| Name        | Description                          | Required |
| ----------- | ------------------------------------ | -------- |
| `OnClickDown: () -> ()` | A function invoked when `MouseButton1Down` is fired, where a user clicks the button and does not release | :x: |
| `OnClick: () -> ()` | A function invoked when `InputEnded` is fired with matching input types `Enum.UserInputType.MouseButton1` or `Enum.UserInputType.Touch`, where a user clicks the button and releases | :x: |