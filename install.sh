#!/bin/bash

set -e

sudo pacman -Syu
mkdir /tmp/yay
cd /tmp/yay
curl -OJ 'https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=yay'
makepkg -si
cd
rm -rf /tmp/yay
yay --version
 
echo "Starting installation of AUR packages..."

packages=(
        hyprland
        kitty
        tmux
        fzf
        unzip
        zsh
        firefox
        nvim
        hyprpaper
        waypaper
        zathura
        wofi
        ttf-iosevka-nerd
        waybar
        nvidia-utils
        nvidia
        stow
        wl-clipboard
        wl-clip-persist
        clipse
        wireplumber
        pwvucontrol
        pipewire-alsa
        pipewire-audio
        pipewire-jack
        hyprshot
        flatpak
)

yay -S --noconfirm --needed "${packages[@]}"

echo "Packages installed, preparing dotfiles"

# Dotfiles repo URL (change this to your actual repo)
DOTFILES_REPO="https://github.com/scrwww/.config"
DOTFILES_DIR="$HOME/.dotfiles"

echo "Installing AUR packages..."
yay -S --noconfirm --needed "${packages[@]}"

# If yay completes successfully, move on
echo "AUR packages installed successfully!"

# Clone dotfiles if not already cloned
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles into $DOTFILES_DIR..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
    echo "Dotfiles repo already exists at $DOTFILES_DIR, pulling latest changes..."
    git -C "$DOTFILES_DIR" pull
fi

# Navigate to dotfiles directory
cd "$DOTFILES_DIR" || exit

# Stow all folders (assumes each directory corresponds to a config, e.g. 'nvim/', 'zsh/', etc.)
echo "Creating symlinks with stow..."
stow */  # this stows all directories in your dotfiles repo

echo "Dotfiles successfully symlinked!

mkdir $HOME/personal
mkdir $HOME/personal/imgs
mkdir $HOME/personal/imgs/wallpapers
