# ⚙️ dotfiles

# THIS IS A WORK IN PROGRESS, DO NOT USE

My personal configuration files and scripts.

## Installation

### Requirements

Xcode Command Line Tools include the `git` and `make` requirement. Install them in the terminal.

```bash
sudo softwareupdate -i -a
xcode-select --install
```

1. Clone the repository locally and navigate to the installed location:

```bash
$ git clone https://github.com/dxnter/dotfiles.git ~/.dotfiles
```

2. Run the setup script:

```bash
$ cd ~/.dotfiles
$ make
```

## Post Installation

### Edit Local Files

Edit .gitconfig.local

### Firefox

1. Log in with Mozilla account
2. Open `about:support`
3. Next to **Profile Folder** click **Show in Finder**
4. Close Firefox
5. Copy/Paste the `/extras/user.js` file into the profile directory

### uBlock Origin

1. Paste `extras/ublock-filters.txt` in **My filters** and **Apply changes**
2. Enable **AdGuard URL Tracking Protection** under the **Privacy** category
3. Add the URL to [LegitimateURLShortener](https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt) under **Custom**
