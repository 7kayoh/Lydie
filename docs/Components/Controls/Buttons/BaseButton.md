---
tags:
  - Controls
  - Components
  - Buttons
---

# BaseButton

<video width="100%" loop autoplay>
  <source src="preview.mp4" type="video/mp4">
</video>

BaseButton is a button class that provides the base style and functionality of a button. When compared to other button classes, BaseButton does not introduce the ability to add text or anything, this will be sourced by the user using the component. If you are looking for implementation of buttons with text/infographic included, see [TextButton](./TextButton.md), [IconButton](./IconButton.md), or [IconTextButton](./IconTextButton.md).

## Usage
BaseButton can be created by calling `Lydie.Components.Controls.BaseButton`:

```lua
local textState = Fusion.Value("Hello world!")

Lydie.Components.Controls.BaseButton {
    Size = UDim2.fromOffset(200, 40),

    [Children] = { -- (1)!
        New "TextLabel" {
            Text = textState,
        },
    },

    OnClickDown = function(),
        textState:set("Hello world??")
    end,

    OnClick = function() -- (2)!
        textState:set("Hello world!")
    end,
}
```

1.  You can pass children using the `[Fusion.Children]` key, all children will be stored under the BaseButton object. See [BaseButton.luau:51](https://github.com/7kayoh/Lydie/blob/8ee2f0d74b97db8a30f576396c194ed34eba28b4/src/Components/Controls/BaseButton.luau#L51).
2.  `OnClick` function will be invoked when `InputEnded` is fired and its input type matches either `Enum.UserInputType.MouseButton1` or `Enum.UserInputType.Touch`. Due to how input events work in Roblox, input will sink no matter what. You should ensure the user is clicking the button before doing any further processing. See [BaseButton.luau:69](https://github.com/7kayoh/Lydie/blob/8ee2f0d74b97db8a30f576396c194ed34eba28b4/src/Components/Controls/BaseButton.luau#L69).

## Properties
| Name        | Description                          | Required | Default |
| ----------- | ------------------------------------ | -------- | ------- |
| `BackgroundColor`       | Background color of the button  | :x: | `Scheme.GetAnimated(Scheme.Color.Text.Primary)` |
| `BackgroundOpacity`       | Background opacity of the button | :x: | `0.85` |
| `RoundedValue`    | The radius of the 4 corners | :x: | `Constants.RoundedValues[8]` |
| `LayoutOrder` | The layout order of the button, used in a `UIListLayout`/`UIGridLayout` | :x: | `0` |
| `ZIndex` | The Z index of the button, used to show hierarchy of the button. | :white_check_mark: | `NaN` |
| `AnchorPoint` | The location of the anchor point, defined in `Vector2` | :x: | `Vector2.new(0, 0)` |
| `Position` | The relative position of the button | :x: | `UDim2.fromScale(0, 0)` |
| `Size` | The size of the button | :x: | `UDim2.fromOffset(200, 50)` |
| `[Fusion.Children]` | The children of the button, this is used to insert other objects into the button itself | :x: | `nil` |

## Functions
| Name        | Description                          | Required |
| ----------- | ------------------------------------ | -------- |
| `OnClickDown: () -> ()` | A function invoked when `MouseButton1Down` is fired, where a user clicks the button and does not release | :x: |
| `OnClick: () -> ()` | A function invoked when `InputEnded` is fired with matching input types `Enum.UserInputType.MouseButton1` or `Enum.UserInputType.Touch`, where a user clicks the button and releases | :x: |