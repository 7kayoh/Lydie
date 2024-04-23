---
tags:
  - Controls
  - Components
  - Buttons
  - Tabs
  - Window
---

# AppTabBarButton

<video width="100%" loop autoplay>
  <source src="preview.mp4" type="video/mp4">
</video>

AppTabBarButton is a class inherited from [IconButton](./IconButton.md), compared to its ancestor, AppTabBarButton is an infographic-only button with proper styling to fit in the [AppTabBar](../../View/AppTabBar.md) component.

## Usage
AppTabBarButton can be created by calling `Lydie.Components.Controls.AppTabBarButton`:

```lua
local iconState = Fusion.Value(Icons.album)
local toggleState = Fusion.Value(false)

Lydie.Components.Controls.AppTabBarButton {
    State = toggleState
    Icon = iconState, -- (1)!

    OnClick = function(state) -- (2)!
        state:set(true)
    end,
}
```

1.  `Icon` property accepts both a string of a state-wrapped string. The string should be either the asset URL or the ID of the image. Lydie has provided a list of icons from Lucide Icons for basic usage. Spritesheet-based icons are not supported at the moment.

2.  `OnClick` function will be invoked when `InputEnded` is fired and its input type matches either `Enum.UserInputType.MouseButton1` or `Enum.UserInputType.Touch`. Due to how input events work in Roblox, input will sink no matter what. You should ensure the user is clicking the button before doing any further processing. See [BaseButton.luau:69](https://github.com/7kayoh/Lydie/blob/8ee2f0d74b97db8a30f576396c194ed34eba28b4/src/Components/Controls/BaseButton.luau#L69).

## Properties

| Name        | Description                          | Required | Default |
| ----------- | ------------------------------------ | -------- | ------- |
| `Icon`       | The asset URL/ID of the icon. | :x: | `Icons["loader-2"]` |
| `State`       | The toggle state of the button, used to indicate whether this tab is active or not | :x: | `Fusion.Value(false)` |
| `LayoutOrder` | The layout order of the button, used in a `UIListLayout`/`UIGridLayout` | :white_check_mark: | `NaN` |

## Functions
| Name        | Description                          | Required |
| ----------- | ------------------------------------ | -------- |
| `OnClick: (Fusion.Value<boolean>) -> ()` | A function invoked when `InputEnded` is fired with matching input types `Enum.UserInputType.MouseButton1` or `Enum.UserInputType.Touch`, where a user clicks the button and releases | :x: |