# Initial Setup

## System Settings
* Spotlight > Uncheck everything
* Spotlight > Keyboard Shortcuts > Uncheck `Show Spotlight Search`
* Spotlight > Keyboard Shortcuts > Services > Uncheck `Search man Page Index in Terminal`
* Disable Siri
* Software Update > Enable Automatic Updates
* Trackpack > Point & Click > Look up & Data Detectors off
* Keyboard > Touch Bar Shows: F1, F2, etc. Keys
* Keyboard > Press Fn key to : SHow Control Strip
* Keyboard > Key Repeat `Fast`
* Keyboard > Delay Until Repeat `Short`
* Setup `Screenshots` folder in `Documents`
* ⇧⌘5 and change folder under `Options`
* Sharing > Disable Sharing & Change device name to `apollo`
* Show hidden files
```
defaults write com.apple.Finder AppleShowAllFiles true
```

##Finder Settings
* Preferences > Show filename extensions
* Change New Finder window to show to open in Home Directory
* Show dotfiles > Cmd + shift + . 
* Show path bar in footer
* Create `Code` and "`Work` folder in sidebar, remove excessive bookmarks

## MacOS Dock
* Remove everything from the Dock except Finder, System Preferences and Trash
* Turn Dock Auto Hiding On
* Uncheck Show recent applications in Dock

Install xcode
```
xcode-select --install
```

Install Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install iTerm2
```
brew install --cask iterm2
```
* Go to profiles -> Default -> Terminal -> Check silence bell to disable the terminal session from making any sound

Silence login message
```
cd ~ ; touch .hushlogin
```
Disable dialog on quit
```
defaults write com.googlecode.iterm2 PromptOnQuit -bool false
```

Install Hack Font
```
brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```

Install Programs
```
brew install --cask alfred deluge discord dozer evernote spotify slack vlc streamio private-internet-access git google-chrome-dev visual-studio-code
```
Launch Alfred at Logiun and change hotkey to Cmd + Space

## Install NVM
https://github.com/nvm-sh/nvm
```
nvm install node
nvm use node
node -v && npm -v
```
## Install Python
```
brew install pyenv
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
```

Install CLI
```
brew install htop tree bat delta ripgrep youtube-dl fzf lsd
```

Install ZSH Plugins and theme
```
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```
