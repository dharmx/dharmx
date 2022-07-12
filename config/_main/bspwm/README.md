<div align="center">
  <h2><samp>Module: BSPWM.<samp></h1>
  <samp>Brief description of how this sub configuration actually works.</samp>
</div>

<h4><samp>Before we proceed.<samp></h2>
<samp>If the reader is well versed or, has a general experience with shell scripting or, know what you are doing then they may skip this section.</samp>

<h4><samp>Main parts.<samp></h2>
<h5><samp> - config.bash.<samp></h2>
<samp>This script sources and executes other scripts that configure some other parts of the WM. Like for instance UI / Geometry related stuff or, window rules.</samp>
<samp>Additionally, configurations regarding <code><samp>Xmodmap, Xresources, Xrdb, etc</samp></code> will go here.</samp>

<h5><samp> - default.bash.<samp></h2>
<samp>Default WM state / UI configurations belong here. Mostly, the commands that starts with <code><samp>bspc config</samp></code>. Below are some examples:</samp>

<pre>
bspc config remove_unplugged_monitors true
bspc config merge_overlapping_monitors true
bspc config automatic_scheme alternate
bspc config initial_polarity second_child
bspc config directional_focus_tightness high
</pre>

<h5><samp> - extern.bash.<samp></h2>
<samp>External rules go here. I use this mainly for handling apps that do not follow <a href="https://x.org/releases/X11R7.6/doc/xorg-docs/specs/ICCCM/icccm.html">ICCCM</a>. Like Spotify.</samp>
<samp>To be more specific applications like Spotify, Zetllr do not set the <code><samp>WM_CLASS</samp></code> atom soon enough, resulting in the bspwm rules not applying.</samp>
<samp>Should be enabled in <code><samp>defaults.bash</samp></code> with <code><samp>bspc external_rules_command path/to/extern.bash</samp></code>.</samp>

<h5><samp> - launch.bash.<samp></h2>
<samp>Applications and commands that should be executed on WM start, goes here. Note, one needs to check if that application is already running first and then execute if it is <b>NOT</b> running.</samp>
<samp>Consider the following for the sake of illustration:</samp>

<pre>
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
</pre>

<h5><samp> - rules.bash.<samp></h2>
<samp>Nerfed version of <code><samp>extern.bash</samp></code>. It is kind of cumbersome to use external rules and it is hard to read as well. So, really the purpose of this configuration script is purely for organization.</samp>

<h5><samp> - theme.bash.<samp></h2>
<samp>Dynamic colorscheme colors i.e. the colors will be fetched from <code><samp>xprop</samp></code> and assigned to variables which can then be sourced and used in other scripts. May be moved to another location.</samp>

<h4><samp>Hooks.<samp></h2>
<samp>Stupid implementation of <a href="https://specifications.freedesktop.org/autostart-spec/autostart-spec-latest.html">autostart</a> i.e. any scripts in the <code><samp>bspwm/hooks</samp></code> directory will be executed. Unless of course its extension ends with <code><samp>.skip</samp></code>.</samp>

<pre>
:: 2bords.sh   -  dual borders 
:: 2rain.bash  -  dual rainbow borders
:: audio.bash  -  audio change notifier
:: bctl.bash   -  brightness change notifier
:: bspwm.bash  -  bspwm config change notifier
:: live.bash   -  live wallpaper
:: stack.sh    -  fix some stacking problems
:: todo.sh     -  todo change notifier
</pre>
