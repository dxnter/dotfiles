## System Settings

### Disable Spotlight for Alfred
* Spotlight > Uncheck everything
* Spotlight > Keyboard Shortcuts > Uncheck `Show Spotlight Search`
* Spotlight > Keyboard Shortcuts > Services > Uncheck `Search man Page Index in Terminal`

### macOS Dock
* Remove everything from the Dock except Finder, System Preferences and Trash
* Turn Dock Auto Hiding On
* Minimize windows into application icon
* Uncheck Show recent applications in Dock

### Security
* Enable FileVault / Firewall
* Security & Privacy > General: Require password immediately after sleep of screen saver begins
* Security & Privacy > General: Unlock with Apple Watch
* Software Update > Enable Automatic Updates

### Trackpad and Keyboard
* Trackpack > Point & Click > Look up & Data Detectors off
* Keyboard > Touch Bar Shows: F1, F2, etc. Keys
* Keyboard > Press Fn key to : SHow Control Strip
* Keyboard > Key Repeat `Fast`
* Keyboard > Delay Until Repeat `Short`

### Mouse
Disable mouse acceleration
`defaults write -g com.apple.mouse.scaling -integer -1` 

### Misc
* Disable Siri
* Setup `Screenshots` folder in `Documents`
* ⇧⌘5 and change folder under `Options`
* Sharing > Disable Sharing & Change device name to `apollo`

### Finder Settings
* Preferences > Show filename extensions
* Change New Finder window to show to open in Home Directory
* Show dotfiles > Cmd + shift + . 
* Show path bar in footer
* Create `Code` and "`Work` folder in sidebar, remove excessive bookmarks
* Show hidden files
```
defaults write com.apple.Finder AppleShowAllFiles true
```

## Installations

### Install Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install iTerm2
```
brew install --cask iterm2
```
* Go to profiles > Default > Terminal > Check silence bell to disable the terminal session from making any sound
* Preferences > Appearance > General > Theme: `Minimal`
* Silence login message
```
cd ~ ; touch .hushlogin
```
Disable dialog on quit
```
defaults write com.googlecode.iterm2 PromptOnQuit -bool false
```


### Install xcode
```
xcode-select --install
```

### Install Hack Font
```
brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```
Change terminal font in iTerm

### Install GUI Applications
```
brew install --cask alfred deluge discord dozer evernote spotify slack vlc streamio private-internet-access google-chrome-dev visual-studio-code
```
Launch Alfred at Login, get preferences from iCloud, and change hotkey to Cmd + Space

### Install CLI Applications
```
brew install htop tree bat delta ripgrep youtube-dl fzf lsd neofetch
```
```
brew install thefuck
brew info thefuck
```
Add thefuck configuration to `.zshrc`


### Install PHP & Laravel
Install PHP

`brew install php`

Install nginx & DNSMASQ

`brew install nginx && brew install dnsmasq`

Install and start MySQL

`brew install mysql`

`brew services start mysql`

Install Composer

`brew install composer`

Install Laravel Installer & Laravel Valet

`composer global require laravel/installer`

`composer global require laravel/valet`

Add Composer to PATH variable

`PATH=$PATH:~/.composer/vendor/bin`

Install Laravel Valet

`valet install`

Create a Laravel Project Directory

`mkdir laravel`

`valet park`

`laravel new blog`


### Install NVM
https://github.com/nvm-sh/nvm
```
nvm install node
nvm use node
node -v && npm -v
```

### Install Python
```
brew install pyenv
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
```

### Configure Github
https://blog.sffc.xyz/post/185195398930/why-you-should-use-git-pull-ff-only-git-is-a
```
git config --global pull.ff only 
```
Set name, email, default branch in `.gitconfig`

### Install ZSH Plugins and theme
```
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```
Update `.zshrc` and change the alias of `batcat` to just `bat`.
