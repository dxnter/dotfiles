### Install ZSH, oh-my-zsh, and plugins

## Install ZSH (Ubuntu)
zsh needs to be installed on Ubuntu machines as it's not a default like macOS.

Update dependencies
```
sudo apt-get update
sudo apt-get upgrade
```
Install zsh
```
sudo apt-get install zsh
```

## Install `oh-my-zsh`
Caveat: `curl` may need to be installed if the installation command does not work.
```
sudo apt-get install curl
````
Install `oh-my-zsh` with the following command.
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Install `oh-my-zsh` plugins
```
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## Install and configure the `powerlevel10k` theme
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
