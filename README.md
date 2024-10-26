# IDEConfig
THis is my configuration about IDE, which include
- Terminal
- Neovim
- Luasnip
- oh-my-posh

First of all, install Homebrew, a powerful package manager for Macos and Linux.
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Now, we can start configuration
## Terminal 
For the default terminal of Macos only supports a 256 color palette, install of supporting true color, thus we need to install third-party terminal.
What is choose is wezterm, which can be configed by lua file, here is it's [website](https://wezfurlong.org/wezterm/).
To install wezterm, use to command below
```
brew install --cask wezterm
```
