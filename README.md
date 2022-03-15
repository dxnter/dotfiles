# ⚙️ dotfiles

Fully automated macOS software installation/configuration, modified system preferences, and extra necessities.

While possible for some, this repository does not serve as a universal macOS setup script. The software I use and configuration defined are catered to my individual use. I recommend reviewing the [setup script](https://github.com/dxnter/dotfiles/blob/main/system/setup.sh) and making changes to any other files before running the script.

## Setup

### Requirements

Xcode Command Line Tools include the `git` and `make` requirement. Install them in the terminal.

```bash
sudo softwareupdate -i -a
xcode-select --install
```

### Installation

1. Clone the repository locally and navigate to the installed location:

```bash
git clone https://github.com/dxnter/dotfiles.git ~/.dotfiles
```

2. Run the setup script:

```bash
cd ~/.dotfiles
make
```

After the installation script is complete, a GPG key needs to be generated to sign commits.
```bash
make gpg
```
Your public GPG key will be copied to the clipboard and a GitHub page will open in your browser. Select **New GPG Key** at the bottom and paste in the textbox.

## Customize

### Local Settings

The dotfiles can be easily extended to suit additional local
requirements by using the following files:

#### `~/.zshrc.local`

The `~/.zhrc.local` file will be automatically sourced after all
the other zsh related files, thus, allowing its content
to add to or overwrite the existing aliases, settings, `PATH`, etc. This can be beneficial for separating environment specific (work, personal) settings away from the base symlinked files.

Here is an example:

```shell
#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set PATH additions.

PATH="$HOME/.composer/vendor/bin:$PATH"

export PATH

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set local aliases.

alias g="git"
```

#### `~/.gitconfig.local`

The `~/.gitconfig.local` file will be automatically included after
the configurations from `~/.gitconfig`, thus, allowing its content
to overwrite or add to the existing Git configurations.

**Note:** Use `~/.gitconfig.local` to store sensitive information
such as the Git user credentials, e.g.:

```ini
[user]
    name = John Doe
    email = jdoe@example.com
    signingKey = XXXXXXXX
```

#### `~/.vimrc.local`

The `~/.vimrc.local` file will be automatically sourced after
`~/.vimrc`, thus, allowing its content to add or overwrite the
settings from `~/.vimrc`.

Here is an example:

```vim
" Disable arrow keys in insert mode.

inoremap <Down>  <ESC>:echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>

" Disable arrow keys in normal mode.

nnoremap <Down>  :echoe "Use j"<CR>
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
```

## Miscellaneous

### Firefox

1. Open `about:support`
2. Next to **Profile Folder** click **Show in Finder**
3. Close Firefox
4. Copy/Paste the `/extras/user.js` file into the profile directory

### uBlock Origin

1. Paste the contents of `extras/ublock-filters.txt` in **My filters** and **Apply changes**
2. Enable **AdGuard URL Tracking Protection** under the **Privacy** category
3. Add the [LegitimateURLShortener](https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt) URL under **Custom**

## Credits

- [alraa/dotfiles](https://github.com/alrra/dotfiles)
