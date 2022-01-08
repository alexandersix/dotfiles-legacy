#!/bin/bash

#     _____ _____  __
#   / ___//  _/ |/ /    Alex Six
#   \__ \ / / |   /     https://github.com/alexandersix
#  ___/ // / /   |      alexanderhsix (at) gmail (dot) com
# /____/___//_/|_|
#
# This macOS install script is for my personal needs only,
# but feel free to copy, modify, and use for your own macOS
# installation needs as well.

# WARNING: THIS SCRIPT IS A WORK-IN-PROGRESS AND MOST LIKELY DOES NOT WORK!
# RUN AT YOUR OWN RISK!

#---------------------------------------------------------
# Point of No Return
#---------------------------------------------------------

echo "This script installs a number of default programs and packages for macOS."
echo "This script also requires occasional sudo access, so please remain by your machine for the duration of the install."
echo
read -p "Are you sure you would like to proceed with the install? [y/N]: " -r

if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Beginning macOS setup."
else
    return 1
fi

#---------------------------------------------------------
# System Initialization
#---------------------------------------------------------

# Install Xcode Tools
echo "Installing Xcode Tools"
xcode-select --install
sudo softwareupdate --install-rosetta

# Install Brew
echo "Installing Homebrew Package Manager"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install oh-my-zsh
echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "ZSH_THEME=\"crcandy\"" >> ~/.zshrc

# Add macOS defaults
echo "Saving Sensible macOS Defaults"

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit the printer app once print jobs are finished
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Trackpad: Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable press-and-hold in favor of key repeat (good for Vim)
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Require password immediately after sleep or screen saver
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Finder: Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: Show hidden files by default
defaults write com.apple.Finder AppleShowAllFiles true

# Finder: Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: Keep folders on top when sorting
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Finder: When performing a search, search current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Enable snap-to-grid for Finder and Desktop
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Show the ~/Library folder
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

#---------------------------------------------------------
# Package & Application Installation
#---------------------------------------------------------

echo "Installing Applications with Homebrew"

UTILITIES=(
    alfred          # macOS Spotlight alternative
    amethyst        # Tiling window manager for macOS (xmonad-inspired)
    audio-hijack    # Application audio recorder
    balenaetcher    # Flash images to SD and USB drives
    bartender       # Menu bar icon manager
    bpytop          # A graphical system processes manager
    coreutils       # GNU Core Utilities
    devutils        # Offline toolbox for developers
    docker          # Containerization
    exa             # A Rust-based ls alternative
    fd              # A Rust-based find alternative
    ffmpeg          # Video/audio record & conversion tool
    flycut          # Clipboard manager
    fzf             # Fuzzy finder written in Go
    git             # Version control
    gh              # Github CLI
    handbrake       # Open-source video transcoder
    htop            # System resource monitor
    imagemagick     # Command-line image manipulation
    imageoptim      # GUI image optimizer
    insomnia        # Lightweight Postman alternative
    loopback        # Software audio router
    mas             # Install macOS App Store applications with Homebrew
    nginx           # Web server
    ngrok           # Secure tunneler to localhost
    mysql@5.7       # The dull edge in MySQL
    mysql           # The cutting edge in MySQL
    postman         # API testing tool
    ranger          # Vim-inspired terminal file manager
    ripgrep         # A Rust-based grep alternative
    screenflow      # Quick screen recording software
    skhd            # A simple hotkey daemon for macOS
    smug            # A terminal session manager written in Go
    tmux            # Terminal multiplexer
    wget            # A pretty-looking cURL
)

LANGUAGES=(
    go
    lua
    node
    php
    php@8.0
    php@7.4
    python # Python 3
    rust
)

TERMINAL_EMULATORS=(
    kitty
)

COMMUNICATION=(
    slack
    zoom
    discord
)

EDITORS=(
    nvim            # Like vim, but in Lua!
    vim
    visual-studio-code
)

BROWSERS=(
    brave-browser
    firefox
    google-chrome
    qutebrowser
)

MEDIA=(
    vlc
    obs # Screen recording & livestreaming
)

DATABASE=(
    tableplus
)

GRAPHICS=(
    affinity-designer
    affinity-photo
    affinity-publisher
    figma
)

NOTE_TAKING=(
    notion          # A note-taking, knowledgebase app
)

PASSWORD_MANAGERS=(
    1password       # A password manager
    1password-cli   # The CLI for 1password
    lastpass        # Another password manager
)

APP_STORE=(     # Install with `mas` from the Apple App Store
    497799835   # Xcode
    424389933   # Final Cut Pro
    634159523   # MainStage
    434290957   # Motion
    634148309   # Logic Pro
    424390742   # Compressor
)

brew update

brew install ${UTILITIES[@]}
brew install ${LANGUAGES[@]}
brew install ${TERMINAL_EMULATORS[@]}
brew install ${COMMUNICATION[@]}
brew install ${EDITORS[@]}
brew install ${BROWSERS[@]}
brew install ${MEDIA[@]}
brew install ${DATABASE[@]}
brew install ${GRAPHICS[@]}
brew install ${NOTE_TAKING[@]}
brew install ${PASSWORD_MANAGERS[@]}

brew cleanup

echo "Installing App Store Applications with mas"

mas install ${APP_STORE[@]}

echo "Installing Composer"

EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet
RESULT=$?
rm composer-setup.php

if [[ $RESULT = 1 ]]
then
    echo "Composer failed to install. Exiting script."
fi

echo "Installing global Composer dependencies"
composer global require laravel/installer
composer global require laravel/valet
composer global require laravel/vapor-cli

echo "Installing NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
cat >> ~/.zshrc << EOF
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
EOF

#---------------------------------------------------------
# Post-Install Setup
#---------------------------------------------------------

echo "Symlink Dotfiles"
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
ln -s $HOME/dotfiles/kitty $HOME/.config/kitty
ln -s $HOME/dotfiles/qutebrowser $HOME/.config/qutebrowser
ln -s $HOME/dotfiles/tmux $HOME/.config/tmux

echo "Adding default aliases"
cat >> ~/.zshrc << EOF
# File Listing
alias ls="exa -lhg --git --group-directories-first"
# Navigation
alias sites="cd ~/Sites"
# Utilities
alias c="clear"
# Laravel Aliases
alias pa="php artisan"
alias sa="sail artisan"
alias sail="[ -f sail ] && bash sail || bash vendor/bin/sail"
# Configuration
alias config="cd ~/config" # Change this if not symlinking dotfiles from repo
alias smugconfig="cd ~/.config/smug"
alias vimconfig="cd ~/config/nvim"
# Git Aliases
alias main="git checkout main"
alias master="git checkout master"
alias develop="git checkout develop"
alias gcb="git checkout -b"
# Testing Aliases
alias pu="./vendor/bin/phpunit"
# Vim Aliases
alias vim="nvim"
# Tmux Aliases
alias tm="tmux"
alias tma="tmux attach -t"
alias tmn="tmux new -s"
alias tml="tmux ls"
# Exports
export GITHUB_TOKEN="" # Add GH token if using the Github CLI
# PATH appends
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/bin:$PATH"
EOF

echo "Restarting Finder"
killall Finder

#---------------------------------------------------------
# Export todo.md
#---------------------------------------------------------

echo "There are a few things left that you need to set up manually."
echo "Instructions and a checklist of those few remaining steps have been placed in ~/todo.md"

touch ~/todo.md
cat macos-setup/todo.md >> ~/todo.md

#---------------------------------------------------------
# Restart to Finish
#---------------------------------------------------------

echo
echo "Finished setup. Note that some of these changes require a restart."
read -p "Would you like to restart now? [y/N]: " -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Your setup is complete."
    sudo shutdown -r now
    echo "Restarting now!"
fi

echo "Your setup is complete. Please restart your machine when possible."
