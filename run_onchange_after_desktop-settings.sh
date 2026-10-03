#!/bin/sh
# Desktop settings that live in dconf rather than in files. chezmoi re-runs
# this whenever it changes.
#
# Without a session bus (e.g. aarbs applying the dotfiles before the first
# login), gsettings would only write to memory, so start a private one; dconf
# then writes ~/.config/dconf/user as usual.
set -eu

if [ -z "${DBUS_SESSION_BUS_ADDRESS:-}" ]; then
    exec dbus-run-session -- sh "$0" "$@"
fi

# Dark mode for libadwaita/GTK 4 apps (also read by xdg-desktop-portal-gtk).
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark

gsettings set org.gnome.desktop.interface cursor-theme breeze_cursors
gsettings set org.gnome.desktop.interface cursor-size 36

gsettings set org.gnome.desktop.interface font-name 'Noto Sans 12'
gsettings set org.gnome.desktop.interface document-font-name 'Noto Serif 12'
gsettings set org.gnome.desktop.interface monospace-font-name 'FiraCode Nerd Font Mono 12'

# virt-manager connects to the system libvirtd on start (only if installed).
if gsettings list-schemas | grep -qx org.virt-manager.virt-manager.connections; then
    gsettings set org.virt-manager.virt-manager.connections autoconnect "['qemu:///system']"
fi
