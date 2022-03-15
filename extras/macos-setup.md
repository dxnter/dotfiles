### Disable Spotlight for Alfred
* Spotlight > Uncheck everything
* Spotlight > Keyboard Shortcuts > Uncheck `Show Spotlight Search`
* Spotlight > Keyboard Shortcuts > Services > Uncheck `Search man Page Index in Terminal`

### Trackpad and Keyboard
* Trackpack > Point & Click > Look up & Data Detectors off
* Keyboard > Touch Bar Shows: F1, F2, etc. Keys
* Keyboard > Press Fn key to : SHow Control Strip
* Keyboard > Key Repeat `Fast`
* Keyboard > Delay Until Repeat `Short`

### Misc
* Disable Siri
* Setup `Screenshots` folder in `Documents`
* ⇧⌘5 and change folder under `Options`
* Sharing > Disable Sharing & Change device name to `apollo`

Launch Alfred at Login, get preferences from iCloud, and change hotkey to Cmd + Space

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
