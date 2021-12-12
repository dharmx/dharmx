#!/usr/bin/env bash

TEMPS="$(sensors pch_cannonlake-virtual-0 | sed -n 3p | awk '{print $2}') $(sensors nouveau-pci-0100 | sed -n 3p | awk '{print $2}')"
echo "<span foreground=\"#BF616A\"> </span><span foreground=\"#88c0d0\">$TEMPS</span>"

