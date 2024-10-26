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
What we choose is wezterm, which can be configed by lua file, here is it's [website](https://wezfurlong.org/wezterm/).
To install wezterm, use to command below
```
brew install --cask wezterm
```
## Zathura 
Make an icon of zathura, try [this](https://github.com/zegervdv/homebrew-zathura/issues/122)
1. Create a New Directory:
```
mkdir -p MyApp.app/Contents/MacOS
mkdir -p MyApp.app/Contents/Resources
```
2. Move Your Executable: 
```
cp  /opt/homebrew/bin/zathura MyApp.app/Contents/MacOS/zathura
```
3. Create the Info.plist:
```
cd  MyApp.app/Contents
```
```
touch Info.plist
```

4. Add the Following XML Content to the `Info.plist` File:
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleName</key>
    <string>MyApp</string>
    <key>CFBundleDisplayName</key>
    <string>MyApp</string>
    <key>CFBundleIdentifier</key>
    <string>com.yourcompany.myapp</string>
    <key>CFBundleVersion</key>
    <string>1.0</string>
    <key>CFBundleExecutable</key>
    <string>zathura</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleIconFile</key>
    <string>AppIcon</string>
</dict>
</plist>
```

