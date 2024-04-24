-- 7kayoh
-- Demo.lua
-- 07 February 2022

-- Tests out every UI component in the library

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local Packages = ReplicatedStorage.Packages

local Lydie = require(Packages.Lydie)
local Fusion = require(Packages.Fusion)

local Components = Lydie.Components
local Modules = Lydie.Modules

local Scheme = Modules.Scheme
local Icons = Modules.Icons

local AppTabBar = Components.Views.AppTabBar
local BottomAppBar = Components.Views.BottomAppBar
local TopAppBar = Components.Views.TopAppBar
local Window = Components.Views.Window

local AppBarButton = Components.Controls.AppBarButton
local AppTabBarButton = Components.Controls.AppTabBarButton
local Checkbox = Components.Controls.Checkbox
local IconButton = Components.Controls.IconButton
local IconTextButton = Components.Controls.IconTextButton
local TextButton = Components.Controls.TextButton
local Toggle = Components.Controls.Toggle
local TextField = Components.Controls.TextField
local Slider = Components.Controls.Slider
local ColorPicker = Components.Controls.ColorPicker

local themeIcon = Fusion.Value(Icons.sun)
local windowVisible = Fusion.Value(true)

local tabStates = {
	Home = Fusion.Value(true),
	Settings = Fusion.Value(false),
	About = Fusion.Value(false),
}

local accentNames = {
	"Red", "Green", "Blue", "Amber", "Orange", "Pink", "Purple", "Indigo", "Teal", "Mint",
}

local function tabOnClick(state)
	state:set(true)
	for _, tabState in pairs(tabStates) do
		if tabState ~= state then
			tabState:set(false)
		end
	end
end

Fusion.New("ScreenGui")({
	Parent = PlayerGui,

	[Fusion.Children] = {
		Window({
			AspectRatio = Fusion.Value(1.5),
			Visible = windowVisible,

			[Fusion.Children] = {
				TopAppBar({
					Icon = Icons.info,
					Subtitle = Fusion.Value("Subtitle"),
					Title = Fusion.Value("Top App Bar"),
					ZIndex = 2,

					[Fusion.Children] = {
						Fusion.New("UIPadding")({
							PaddingRight = UDim.new(0, 5),
						}),

						AppBarButton({
							Icon = Icons["x-circle"],
							LayoutOrder = 2,

							OnClick = function()
								windowVisible:set(false)
							end,
						}),

						AppBarButton({
							Icon = themeIcon,
							LayoutOrder = 1,

							OnClick = function()
								if Scheme.Current == Scheme.Schemes.Dark then
									themeIcon:set(Icons.moon)
									Scheme.Switch(Scheme.Schemes.Light)
								elseif Scheme.Current == Scheme.Schemes.Light then
									themeIcon:set(Icons.sun)
									Scheme.Switch(Scheme.Schemes.Dark)
								end
							end,
						}),
					},
				}),

				Fusion.New("Frame")({
					BackgroundTransparency = 1,

					Position = UDim2.fromOffset(0, 50),
					Size = UDim2.new(1, 0, 1, -100),

					[Fusion.Children] = {
						Fusion.New("UIListLayout")({
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, 15),
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center,
						}),

						Fusion.New("Frame")({
							BackgroundTransparency = 1,

							Size = UDim2.new(1, 0, 0, 50),

							[Fusion.Children] = {
								Fusion.New("UIListLayout")({
									FillDirection = Enum.FillDirection.Horizontal,
									HorizontalAlignment = Enum.HorizontalAlignment.Center,
									Padding = UDim.new(0, 15),
									SortOrder = Enum.SortOrder.LayoutOrder,
									VerticalAlignment = Enum.VerticalAlignment.Center,
								}),

								TextButton({
									Text = Fusion.Value("Random Theme Color"),

									OnClick = function()
										print("TextButton Clicked")
										Scheme.AccentName:set(accentNames[math.random(1, #accentNames)])
									end,
								}),

								IconTextButton({
									Icon = Icons.info,
									Text = Fusion.Value("Random Scheme"),

									OnClick = function()
										print("IconTextButton Clicked")
										local tbl = {"Dark", "Light", "SolarizedDark"}
										Scheme.Switch(tbl[math.random(1, 3)])
									end,
								}),
							},
						}),

						Fusion.New("Frame")({
							BackgroundTransparency = 1,
							LayoutOrder = 2,

							Size = UDim2.new(1, 0, 0, 50),

							[Fusion.Children] = {
								Fusion.New("UIListLayout")({
									FillDirection = Enum.FillDirection.Horizontal,
									HorizontalAlignment = Enum.HorizontalAlignment.Center,
									Padding = UDim.new(0, 15),
									SortOrder = Enum.SortOrder.LayoutOrder,
									VerticalAlignment = Enum.VerticalAlignment.Center,
								}),

								IconTextButton({
									BackgroundColor = Scheme.GetAnimated(Scheme.Accent),
									BackgroundOpacity = 0,
									ForegroundColor = Scheme.GetAnimated(Scheme.Elevation[2]),
									Icon = Icons.info,
									Text = Fusion.Value("IconTextButton"),

									OnClick = function()
										print("IconTextButton Clicked")
									end,
								}),

								IconButton({
									BackgroundColor = Scheme.GetAnimated(Scheme.Accent),
									BackgroundOpacity = 0,
									ForegroundColor = Scheme.GetAnimated(Scheme.Elevation[2]),
									Icon = Icons["alert-circle"],
									LayoutOrder = 2,

									OnClick = function()
										print("IconButton Clicked")
									end,
								}),

								IconButton({
									BackgroundColor = Scheme.GetAnimated(Scheme.Accent),
									Icon = Icons.info,
									LayoutOrder = 3,

									OnClick = function()
										print("IconButton Clicked")
									end,
								}),
							},
						}),

						Fusion.New("Frame")({
							BackgroundTransparency = 1,
							LayoutOrder = 3,

							Size = UDim2.new(1, 0, 0, 24),

							[Fusion.Children] = {
								Fusion.New("UIListLayout")({
									FillDirection = Enum.FillDirection.Horizontal,
									HorizontalAlignment = Enum.HorizontalAlignment.Center,
									Padding = UDim.new(0, 15),
									SortOrder = Enum.SortOrder.LayoutOrder,
									VerticalAlignment = Enum.VerticalAlignment.Center,
								}),

								Toggle({
									OnClick = function(state)
										state:set(not state:get())
										print("Toggle Clicked", state:get())
									end,
								}),

								Checkbox({
									LayoutOrder = 2,

									OnClick = function(state)
										state:set(not state:get())
										print("Checkbox Clicked", state:get())
									end,
								}),

								TextField({
									LayoutOrder = 3,

									OnTextChanged = function(text)
										print("Changed to: " .. text)
									end,
								}),
							},
						}),

						Fusion.New("Frame")({
							BackgroundTransparency = 1,
							LayoutOrder = 4,

							Size = UDim2.new(1, 0, 0, 24),

							[Fusion.Children] = {
								Fusion.New("UIListLayout")({
									FillDirection = Enum.FillDirection.Horizontal,
									HorizontalAlignment = Enum.HorizontalAlignment.Center,
									Padding = UDim.new(0, 15),
									SortOrder = Enum.SortOrder.LayoutOrder,
									VerticalAlignment = Enum.VerticalAlignment.Center,
								}),

								Slider({}),
							},
						}),
					
						Fusion.Hydrate(ColorPicker {}) {
							Size = UDim2.fromOffset(150, 0),
						}
					},
				}),

				BottomAppBar({
					ZIndex = 2,

					[Fusion.Children] = {
						AppTabBar({
							[Fusion.Children] = {
								AppTabBarButton({
									Icon = Icons.home,
									State = tabStates.Home,
									OnClick = tabOnClick,
								}),

								AppTabBarButton({
									Icon = Icons.sliders,
									State = tabStates.Settings,
									OnClick = tabOnClick,
								}),

								AppTabBarButton({
									Icon = Icons.info,
									State = tabStates.About,
									OnClick = tabOnClick,
								}),
							},
						}),
					},
				}),
			},
		}),
	},
})

if Scheme.Current == Scheme.Schemes.Dark then
	themeIcon:set(Icons.sun)
else
	themeIcon:set(Icons.moon)
end
