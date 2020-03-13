# Dotfiles

This repository contains all configurations I currently have on my laptop.
There's also an installation script which facilitates replication of the same
configurations and apps on a new MacOS instalation.

## Installing

There's a install script which does the following:

1. Install all development dependencies
2. Setup all configurations for NeoVim, tmux, etc.
3. Install all MacOS applications

In order to run this script just clone the repository and then, at the root of
the project, run:

```
./install.sh
```

## Post-Install

After installation you'll still need to manually install some stuff, detailed in the next sections.

### Window Manager

I use [yabai](https://github.com/koekeishiya/yabai) as my windows manager however you first need to
disable SIP in order to install, so please follow
[yabai's quickstart guide](https://github.com/koekeishiya/yabai/wiki#quickstart-guide).

### Wallpaper

* [Current Wallpaper](https://i.imgur.com/MKG8r88.png)
* [Previous Wallpaper](https://cdn.vox-cdn.com/uploads/chorus_asset/file/13272831/The_Verge_Hysteresis_Wallpaper_Landscape.0.png)
* [Gallery of 200+ minimal wallpaper](https://imgur.com/gallery/XOygnM3)

### Fonts

* JetBrains Mono Font

    ```
    brew tap homebrew/cask-fonts
    brew cask install font-jetbrainsmono-nerd-font
    ```

* [Input Mono Font](http://input.fontbureau.com/download/?customize&fontSelection=whole&a=ss&g=ss&i=0&l=0&zero=0&asterisk=height&braces=straight&preset=default&line-height=1.2&email=)
* [SauceCodePro Nerd Font](https://github.com/ryanoasis/nerd-fonts)

### Other Apps

* [Calibre Kobo Utilities Plugin](https://www.mobileread.com/forums/showthread.php?t=215339)
* [Installing TMUX Plugins with TPM](https://github.com/tmux-plugins/tpm#installing-plugins)
* [Change CGFontRenderingFontSmoothingDisabled](https://angristan.xyz/how-to-fix-font-rendering-macos-10-14-mojave/)
* [Epoch Clock Screensaver](https://github.com/chrstphrknwtn/epoch-flip-clock-screensaver/)

Finally enable Reduce Motion on MacOS: `System Preferences > Accessibility > Display > Reduce Motion`.
