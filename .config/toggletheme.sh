#!/bin/sh

# theme_toggle.sh
# Original author: Hiradur
# License: CC0
# Description: Toggle between two themes for various applications
# designed for the Solarized themes by Ethan Schoonover

# This script toggles between a light and a dark theme for various applications
# by replacing the corresponding option(s) in their config files
# You need to have the Solarized Light/Dark theme installed for these applications

# Currently supported applications:
# background image, urxvt, zathura, vimperator (FF addon), GTK2/3-apps

# Tip: For a complete solarized experience you can use the Stylish addon for
# Firefox with Solarized dark/light Everywhere theme. It's not toggled here
# because it breaks the layout of a few websites.

# check which theme is active first
if [ ! -e ~/.config/darkmode ]; then
    # light theme active, switch to dark theme

    # urxvt
    sed -i 's|#include ".Xresources.d/solarized-light"|#include ".Xresources.d/solarized-dark"|' ~/.Xresources
    # GTK
    sed -i 's|gtk-theme-name="Arc"|gtk-theme-name="Arc-Dark"|' ~/.gtkrc-2.0
    sed -i 's|gtk-theme-name=Arc|gtk-theme-name=Arc-Dark|' ~/.config/gtk-3.0/settings.ini
		gsettings set org.gnome.desktop.interface gtk-theme Arc-Dark
#		term_dark
		touch ~/.config/darkmode
else
    # switch to light theme
    sed -i 's|#include ".Xresources.d/solarized-dark"|#include ".Xresources.d/solarized-light"|' ~/.Xresources
    # GTK
    sed -i 's|gtk-theme-name="Arc-Dark"|gtk-theme-name="Arc"|' ~/.gtkrc-2.0
    sed -i 's|gtk-theme-name=Arc-Dark|gtk-theme-name=Arc|' ~/.config/gtk-3.0/settings.ini
		gsettings set org.gnome.desktop.interface gtk-theme Arc
#		term_light
		rm  ~/.config/darkmode
fi
xrdb ~/.Xresources
xdotool key --clearmodifiers Alt
for i in `xdotool search --class st`
do
	xdotool key --clearmodifiers --window $i Alt+Tab
done
for i in `xdotool search --name vim`
do
	xdotool key --clearmodifiers --window $i Ctrl+T
done
