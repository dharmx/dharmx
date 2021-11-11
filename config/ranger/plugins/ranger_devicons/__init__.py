from abc import ABC
from ranger.container.fsobject import FileSystemObject

from ranger.api import register_linemode
from ranger.core.linemode import LinemodeBase

from os import getenv
from .devicons import devicon

SEPARATOR: str = getenv('RANGER_DEVICONS_SEPARATOR', ' ')


@register_linemode
class DevIconsLineMode(LinemodeBase, ABC):
    name: str = "devicons"
    uses_metadata: bool = False

    # noinspection SpellCheckingInspection
    def filetitle(self, file: FileSystemObject, metadata: str) -> str:
        return devicon(file) + SEPARATOR + file.relative_path
