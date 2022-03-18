![cover](./images/cover.png)

# dotfiles

Fully automated macOS software installation/configuration, modified system preferences, and extra necessities.

⚠️ **Warning:** This repository does not serve as a universal macOS setup script. The software I use and configuration defined are catered to my individual use. I recommend reviewing the [setup script](https://github.com/dxnter/dotfiles/blob/main/system/setup.sh) and making changes to any other files before running the script.

## 🔧 Setup

### Requirements

Xcode Command Line Tools include the `git` and `make` requirement. Install them in the terminal.

```bash
sudo softwareupdate -i -a
xcode-select --install
```

### Installation

1. Clone the repository locally:

```bash
git clone https://github.com/dxnter/dotfiles.git ~/.dotfiles
```

2. Run the setup script:

```bash
cd ~/.dotfiles
make
```

3. After the installation script is complete and your system restarts, a GPG key needs to be generated to sign commits. After completion, your public GPG key will be copied to the clipboard and a GitHub page will open in your browser. Select **New GPG Key** at the bottom and paste inside the textbox.

```bash
make gpg
```

## ⚙️ Customize

### Local Settings

The dotfiles can be easily extended to suit additional local
requirements by using the following files:

#### `~/.zshrc.local`

The `~/.zhrc.local` file will be automatically sourced after all
the other zsh related files, thus, allowing its content
to add to or overwrite the existing aliases, settings, `PATH`, etc. This can be beneficial for separating environment specific (work, personal) settings away from the base symlinked files and from version control.

Here is an example:

```shell
#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set PATH additions.

export PATH="$HOME/.composer/vendor/bin:$PATH"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set local aliases.

alias g="git"
```

Any other universal modifications to the shell should take place in the appropriate file.

- `~/.config/zsh/.zshenv` → Environment variables, `$PATH` exports, and global directory paths
- `~/.config/zsh/.aliases` → Command aliases
- `~/.config/zsh/.zshrc` → Theme, sourcing, and plugin settings

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

### Miscellaneous

#### 🦊 Firefox

1. Open `about:support`
2. Next to **Profile Folder** click **Show in Finder**
3. Close Firefox
4. Copy/Paste the `/extras/user.js` file into the profile directory

#### 🛡️ uBlock Origin

1. Paste the contents of `extras/ublock-filters.txt` in **My filters** and **Apply changes**
2. Enable **AdGuard URL Tracking Protection** under the **Privacy** category
3. Add the [LegitimateURLShortener](https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt) URL under **Custom**

#### 🔳 Fig Alacritty Integration

At the time of writing, the Fig integration with Alacritty is a preview. Follow these steps to enable Fig in Alacritty.

1. Run `fig settings integrations.experimental true` and then restart the Fig app
2. Click the Fig menubar icon > Integrations > Alacritty > "Attempt to Install"
3. Go to a terminal and run `fig debug ime enable`. A System Preferences window will appear and prompt you to install a third party Input Method.
4. Run `fig debug ime select`
5. Restart Alacritty

---

## ⏫ Adding Additional Dotfiles

Naturally, there will be dotfiles of your own that are missing from this repository. Adding them to this directory allows a centralized location to symlink, maintain, and version control.

`stow` is used to create symbolic links to your `$HOME` directory. An example of the expected folder structure is shown below. The top level directory should correspond to the name of the package, while the contents will be symlinked relative to your `$HOME` directory.

```
nvim
├── .config
│   └── nvim
│       ├── init.vim
│       └── plug.vim
└── .vimrc
```

Once the new files are created, the `symlink_dirs` file needs to be updated with the directory name.

```bash
# Example
echo 'nvim' >> symlink_dirs
```

Lastly, run `make link` to create the new symbolic links.

## 📑 License

Usage is provided under the [MIT License](https://opensource.org/licenses/MIT).

## 👏 Acknowledgments

- [alraa/dotfiles](https://github.com/alrra/dotfiles)
- [webpro/dotfiles](https://github.com/webpro/dotfiles)
