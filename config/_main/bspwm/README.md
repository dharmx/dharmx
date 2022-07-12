<div align="center">
  <h2>Module: BSPWM.</h1>
  Brief description of how this sub configuration actually works.
</div>

#### Before we proceed

If the reader is well versed or, has a general experience with shell scripting or, know what you are doing then they may skip this section.

#### Main parts

##### config.bash

This script sources and executes other scripts that configure some other parts of the WM. Like for instance UI / Geometry related stuff or, window rules.
Additionally, configurations regarding `Xmodmap, Xresources, Xrdb, etc` will go here.

##### default.bash

Default WM state / UI configurations belong here. Mostly, the commands that starts with `bspc config`. Below are some examples:

```sh
bspc config remove_unplugged_monitors true
bspc config merge_overlapping_monitors true
bspc config automatic_scheme alternate
bspc config initial_polarity second_child
bspc config directional_focus_tightness high
```

##### extern.bash

External rules go here. I use this mainly for handling apps that do not follow [ICCCM](https://x.org/releases/X11R7.6/doc/xorg-docs/specs/ICCCM/icccm.html). Like Spotify.
To be more specific applications like Spotify, Zetllr do not set the `WM_CLASS` atom soon enough, resulting in the bspwm rules not applying.
Should be enabled in `defaults.bash` with `bspc external_rules_command path/to/extern.bash`.

##### launch.bash

Applications and commands that should be executed on WM start, goes here. Note, one needs to check if that application is already running first and then execute if it is **NOT** running.
Consider the following for the sake of illustration:

```bash
function preboot() {
  local running
  running="$(pgrep -x "$1")"
  [ "$running" ] && kill "$running" 2>/dev/null
  eval "$* &>/dev/null &"
  echo -e "$(tput setf 1)INFO\e[0m: Restarted $1."
}

# launch some nice apps
killall python bspc 2>/dev/null
preboot sxhkd -c '$XDG_CONFIG_HOME/sxhkd/config.sx' -s /tmp/sxhkd.fifo
```

##### rules.bash

Nerfed version of `extern.bash`. It is kind of cumbersome to use external rules and it is hard to read as well. So, really the purpose of this configuration script is purely for organization.

##### theme.bash

Dynamic colorscheme colors i.e. the colors will be fetched from `xprop` and assigned to variables which can then be sourced and used in other scripts. May be moved to another location.

#### Hooks

Stupid implementation of [autostart](https://specifications.freedesktop.org/autostart-spec/autostart-spec-latest.html) i.e. any scripts in the `bspwm/hooks` directory will be executed. Unless of course its extension ends with `.skip`.

```
:: 2bords.sh   -  dual borders
:: 2rain.bash  -  dual rainbow borders
:: audio.bash  -  audio change notifier
:: bctl.bash   -  brightness change notifier
:: bspwm.bash  -  bspwm config change notifier
:: live.bash   -  live wallpaper
:: stack.sh    -  fix some stacking problems
:: todo.sh     -  todo change notifier
```
