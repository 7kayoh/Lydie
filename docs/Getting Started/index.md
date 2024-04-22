# Installing Lydie

Lydie is built around Wally packages, because of that, installation of Lydie and its dependencies should be installed the same as how Wally intended to.

### with wally <small>recommended</small> { #with-rojo data-toc-label="with rojo" }

Lydie is published as a [Wally](https://wally.run) package and can be installed as long as your game source code is saved in the filesystem. Edit your `wally.toml` configuration file and install the package:

```toml title="wally.toml"
[dependencies]
Fusion = "elttob/fusion@0.2.0"
Lydie = "7kayoh/lydie@0.1.0"
```

```sh title="terminal"
wally install
```

This will install Lydie into the `Packages` directory, the actual location of the folder in-game depends on your Rojo project configuration, but it is usually in `ReplicatedStorage`.

## with rbxm

If you edit your game in Roblox Studio, it may be more appropriate to directly install Lydie with the released `rbxm` file from the repository. Download the latest release [here](https://github.com/7kayoh/lydie/releases) and insert it into your game.