# Dotfiles
Bleeding-edge dots[.](https://blog.aktsbot.in/better-font-rendering-linux.html) Yes. I'm layze so, README isn't coming anytime soon. Sorry :cry:

## Management
I use [stow](https://savannah.gnu.org/projects/stow) to manage dotfiles. Hence, the weird yet weird file structure
```bash
## NOTE: Use --delete="package" for deleting a stowed package.
sudo stow --target=/etc/X11/xorg.conf.d --dir="$HOME/Dotfiles/dots.sh/etc/X11" xorg.conf.d
sudo stow --target="/etc/udev/rules.d" --dir="$HOME/Dotfiles/dots.sh/etc/udev" rules.d
sudo stow --target="/usr/share/polkit-1/rules.d" --dir="$HOME/Dotfiles/dots.sh/etc/polkit-1" rules.d
sudo stow --target="/usr/share/obs/obs-studio/themes" --dir="$HOME/Dotfiles/dots.sh/config/_explicit/obs-studio" themes
stow --target="${XDG_CONFIG_HOME:-HOME/.config}/GIMP/2.10" --dir="$HOME/Dotfiles/dots.sh/config/_explicit/GIMP" 2.10
stow --target="$HOME" --dir="$HOME/Dotfiles/dots.sh" home --ignore=".mozilla"
stow --target="$HOME/.mozilla/profiles/Minimal" --dir="$HOME/Dotfiles/dots.sh/home/.mozilla/profiles" Minimal
stow --target="${XDG_CONFIG_HOME:-HOME/.config}/systemd/user" --dir="$HOME/Dotfiles/dots.sh" services
stow --target="${XDG_DATA_HOME:-HOME/.local/share}" --dir="$HOME/Dotfiles/dots.sh/local" share
stow --target="${XDG_CONFIG_HOME:-HOME/.config}" --dir="$HOME/Dotfiles/dots.sh/config" _files
stow --target="${XDG_CONFIG_HOME:-HOME/.config}" --dir="$HOME/Dotfiles/dots.sh/config" _standalone
stow --target="${XDG_CONFIG_HOME:-HOME/.config}" --dir="$HOME/Dotfiles/dots.sh/config" _secured
```

<!--
  vim:filetype=markdown
-->
