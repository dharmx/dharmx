# Nightly
Bleeding-edge dots[.](https://blog.aktsbot.in/better-font-rendering-linux.html) Yes. I'm layze so, README isn't coming anytime soon. Sorry :cry:

## GNU Stow
I use stow to manage my dotfiles. Hence, the weird yet weirdly sensible file structure
```bash
## NOTE: Use --ignore="regexp" for ignoring certain files / dirs.
## NOTE: Use --delete="package" for deleting a stowed package.

sudo stow --target=/etc/X11/xorg.conf.d --dir="$HOME/Dotfiles/nightly/etc/X11" xorg.conf.d
sudo stow --target="/etc/udev/rules.d" --dir="$HOME/Dotfiles/nightly/etc/udev" rules.d
sudo stow --target="/usr/share/polkit-1/rules.d" --dir="$HOME/Dotfiles/nightly/etc/polkit-1" rules.d
sudo stow --target="/usr/share/obs/obs-studio/themes" --dir="$HOME/Dotfiles/nightly/config/_explicit/obs-studio" themes
stow --target="${XDG_CONFIG_HOME:-HOME/.config}/GIMP/2.10" --dir="$HOME/Dotfiles/nightly/config/_explicit/GIMP" 2.10
stow --target="$HOME" --dir="$HOME/Dotfiles/nightly" home
stow --target="${XDG_CONFIG_HOME:-HOME/.config}/systemd/user" --dir="$HOME/Dotfiles/nightly" services
stow --target="${XDG_DATA_HOME:-HOME/.local/share}" --dir="$HOME/Dotfiles/nightly/local" share
stow --target="${XDG_CONFIG_HOME:-HOME/.config}" --dir="$HOME/Dotfiles/nightly/config" _files
stow --target="${XDG_CONFIG_HOME:-HOME/.config}" --dir="$HOME/Dotfiles/nightly/config" _standalone
stow --target="${XDG_CONFIG_HOME:-HOME/.config}" --dir="$HOME/Dotfiles/nightly/config" _secured
```

<!--
  vim:filetype=markdown
-->
