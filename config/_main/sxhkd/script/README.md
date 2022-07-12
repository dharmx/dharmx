<div align="center">
  <h2>Module: BSPWM.</h1>
  Brief description of how this sub configuration actually works.
</div>

### Scripts

Brief explanation and information on the script's functionality and its dependencies.

#### bsize.bash

A script to expand and contract nodes from both sides. Meaning for example running with the `-x` flag would
result in the script being expanded by 20 pixels on both left and right side.

##### Dependencies

- None.

#### center.bash

Script that centers any floating node in the screen.

##### Dependencies

- xdotool

#### close.bash

A quick close script that closes some specific applications on pressing the Escape key.

#### mini.bash

Use Rofi or, FZF to go through all minimized / hidden nodes and maximize them or, vice-versa.

##### Dependencies

- xdotool
- rofi
- fzf

#### noborders.bash

There will be no borders on all of the floating nodes on the the focused desktop.

##### Dependencies

- None.

#### shot.bash

A neat script for taking screenshots. Doesn't capture pointers.

##### Dependencies

- xdg-utils
- rofi
- xrandr

#### skunk.bash

Similar script to that of `mini.bash` but the only difference is that it uses a pointer to select the node that needs
to be minimized. Additionaly as a bonus option it also allows you to close nodes as well.

##### Dependencies

- xdotool
- lsw from wmutils/core

#### slyfuzz.sh

Mark a given area and open a node of that size (geometry).

##### Dependencies

- slop
- rofi

#### unify.bash

Unify a desktop i.e. you can have all the nodes in a certain desktop be at a certain state, initially.
Dor example you can assert that, all of the nodes in workspace one shall be in a floating state.

##### Dependencies

- None

#### xmodmap.bash

##### Dependencies

- xmodmap

Swap keyboard mappings.
