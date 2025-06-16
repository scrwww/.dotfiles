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
        kitty
        tmux
        fzf
        unzip
        thunar
        nvim
        hyprpaper
        waypaper
        rofi-wayland
        waybar
        wl-clipboard
        wl-clip-persist
        clipse
        wireplumber
        hyprshot
        flatpak
)

yay -S --noconfirm --needed "${packages[@]}"

echo "Packages installed, preparing dotfiles"

DOTFILES_REPO="https://github.com/scrwww/.dotfiles"
DOTFILES_DIR="$HOME/.dotfiles"

echo "Installing AUR packages..."
yay -S --noconfirm --needed "${packages[@]}"

echo "AUR packages installed successfully!"

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles into $DOTFILES_DIR..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
    echo "Dotfiles repo already exists at $DOTFILES_DIR, pulling latest changes..."
    git -C "$DOTFILES_DIR" pull
fi

cd "$DOTFILES_DIR" || exit
