# dotfiles

My personal configuration files and scripts.

## Installation

macOS Install

```bash
xcode-select --install
```

Clone this repo to `~/.dotfiles` with:

```bash
git clone git@github.com:dxnter/dotfiles.git ~/.dotfiles
```

```bash
# Create symlinks & install applications
./install.sh

# Only create symlinks
./bootstrap.sh
```

```bash
# vim-plug install
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vim plugin install
vim ~/.vimrc
:PlugInstall
```

## Firefox

1. Download Firefox
2. Log in with Mozilla account
3. Open `about:support`

- Open the directory of **Profile Directory**
- Close Firefox
- Copy/Paste the `/extras/user.js` file into the profile directory

## uBlock Origin

1. Paste `extras/ublock-filters.txt` in **My filters** and **Apply changes**
2. Enable **AdGuard URL Tracking Protection** under the **Privacy** category
3. Add the URL to [LegitimateURLShortener](https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt) under **Custom**
