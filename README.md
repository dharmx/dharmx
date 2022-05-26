# Dotfiles
Bleeding-edge dots[.](https://blog.aktsbot.in/better-font-rendering-linux.html) Yes. I'm layze so, README isn't coming anytime soon. Sorry :cry:

## Management
I use [stow](https://savannah.gnu.org/projects/stow) to manage dotfiles. Hence, the weird file structure.
```bash
## NOTE: Use --delete="package" for deleting a stowed package.
## INFO: Use --restow for refreshing stowed packages (--delete -> --stow)

sudo stow --target=/etc/X11/xorg.conf.d --dir="$HOME/Dotfiles/dots.sh/etc/X11" xorg.conf.d
sudo stow --target="/etc/udev/rules.d" --dir="$HOME/Dotfiles/dots.sh/etc/udev" rules.d
sudo stow --target="/usr/share/polkit-1/rules.d" --dir="$HOME/Dotfiles/dots.sh/etc/polkit-1" rules.d
sudo stow --target="/usr/share/obs/obs-studio/themes" --dir="$HOME/Dotfiles/dots.sh/config/_explicit/obs-studio" themes
sudo stow --target=/usr/lib/systemd/system --dir=/home/maker/Dotfiles/dots.sh/services root

stow --target=/usr/lib/systemd/system --dir=/home/maker/Dotfiles/dots.sh/services user
stow --target="${XDG_CONFIG_HOME:-~/.config}/GIMP/2.10" --dir="$HOME/Dotfiles/dots.sh/config/_explicit/GIMP" 2.10
stow --target="$HOME" --dir="$HOME/Dotfiles/dots.sh" home --ignore=".mozilla"
stow --target="$HOME/.mozilla/profiles/Minimal" --dir="$HOME/Dotfiles/dots.sh/home/.mozilla/profiles" Minimal
stow --target="${XDG_DATA_HOME:-~/.local/share}" --dir="$HOME/Dotfiles/dots.sh/local" share
stow --target="${XDG_CONFIG_HOME:-~/.config}" --dir="$HOME/Dotfiles/dots.sh/config" --stow _files --stow _standalone --stow _secured
```

<!--
  vim:filetype=markdown
-->
