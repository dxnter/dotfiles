# ⚙️ dotfiles

# THIS IS A WORK IN PROGRESS, DO NOT USE

My personal configuration files and scripts.

## Installation

| OS       | Snippet                                                                           |
| :------- | :-------------------------------------------------------------------------------- |
| macOS    | `bash -c "$(curl -LsS https://raw.github.com/dxnter/dotfiles/main/os/setup.sh)"`  |
| Pop!\_OS | `bash -c "$(wget -qO - https://raw.github.com/dxnter/dotfiles/main/os/setup.sh)"` |

Restart your computer

Edit .gitconfig.local

## Firefox

1. Download Firefox
2. Log in with Mozilla account
3. Open `about:support`
4. Open the directory of **Profile Directory**
5. Close Firefox
6. Copy/Paste the `/extras/user.js` file into the profile directory

## uBlock Origin

1. Paste `extras/ublock-filters.txt` in **My filters** and **Apply changes**
2. Enable **AdGuard URL Tracking Protection** under the **Privacy** category
3. Add the URL to [LegitimateURLShortener](https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt) under **Custom**
