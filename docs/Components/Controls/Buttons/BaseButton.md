---
tags:
  - Controls
  - Components
  - Buttons
---

# BaseButton
BaseButton is a button class that provides the base style and functionality of a button. When compared to other button classes, BaseButton does not introduce the ability to add text or anything, this will be sourced by the user using the component. If you are looking for implementation of buttons with text/infographic included, see [TextButton](./TextButton), [IconButton](./IconButton), or [IconTextButton](./IconTextButton).

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
