#!/usr/bin/env python3
# Simple fetch program
from colorama import *

import distro, platform, os

print()

print(Fore.CYAN + "~ OS         " + Style.RESET_ALL + distro.name())
print(Fore.CYAN + "~ KERNEL     " + Style.RESET_ALL + platform.release())
print(Fore.CYAN + "~ HOSTNAME   " + Style.RESET_ALL + platform.node())
print(Fore.CYAN + "~ SHELL      " + Style.RESET_ALL + os.getenv("SHELL"))

print()
