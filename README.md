# Nightly
Bleeding-edge dots[.](https://blog.aktsbot.in/better-font-rendering-linux.html) Yes. I'm layze so, README isn't coming anytime soon. Sorry :cry:

## GNU Stow
I use stow to manage my dotfiles. Hence, the weird yet weirdly sensible file structure
```bash
cd "${HOME}/Dotfiles/nightly/etc/X11"
sudo stow --target=/etc/X11/xorg.conf.d xorg.conf.d

cd "${HOME}/Dotfiles/nightly/etc/udev"
sudo stow --target="/etc/udev/rules.d" rules.d

cd "${HOME}/Dotfiles/nightly/etc/polkit-1"
sudo stow --target="/usr/share/polkit-1/rules.d" rules.d

cd "${HOME}/Dotfiles/nightly/config/_explicit/obs-studio"
sudo stow --target="/usr/share/obs/obs-studio/themes" themes

cd "${HOME}/Dotfiles/nightly/config/_explicit/GIMP"
stow --target="${XDG_CONFIG_HOME:-HOME/.config}/GIMP/2.10" 2.10

cd "${HOME}/Dotfiles/nightly"
stow --target="${HOME}" home
stow --target="${XDG_CONFIG_HOME:-HOME/.config}/systemd/user" services

cd "${HOME}/Dotfiles/nightly/local"
stow --target="${XDG_DATA_HOME:-HOME/.local/share}" share

cd "${HOME}/Dotfiles/nightly/config"
stow --target="${XDG_CONFIG_HOME:-HOME/.config}" _files
stow --target="${XDG_CONFIG_HOME:-HOME/.config}" _standalone
stow --target="${XDG_CONFIG_HOME:-HOME/.config}" _secured

```
<!--
  vim:filetype=markdown
-->
