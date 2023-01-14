import atexit
import json
import logging
import os
import socket
import subprocess
import sys
import traceback
from pathlib import Path

from ranger.ext.img_display import ImageDisplayer, register_image_displayer

logger = logging.getLogger(__name__)


@register_image_displayer("mpv")
class MPVImageDisplayer(ImageDisplayer):
    """Implementation of ImageDisplayer using mpv, a general media viewer.
    Opens media in a separate X window.

    mpv 0.25+ needs to be installed for this to work.
    """

    def _send_command(self, path, sock):

        message = '{"command": ["raw","loadfile",%s]}\n' % json.dumps(path)
        s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        s.connect(str(sock))
        logger.info(f'-> {message}')
        s.send(message.encode())
        message = s.recv(1024).decode()
        logger.info(f'<- {message}')

    def _launch_mpv(self, path, sock):

        proc = subprocess.Popen(
            [
                *os.environ.get("MPV", "mpv").split(),
                "--no-terminal",
                "--force-window",
                f"--input-ipc-server={str(sock)}",
                "--image-display-duration=inf",
                "--loop-file=inf",
                "--no-osc",
                "--no-input-default-bindings",
                "--keep-open",
                "--idle",
                "--",
                path,
            ]
        )

        @atexit.register
        def _():
            proc.terminate()
            sock.unlink()

    def draw(self, path, *_):

        path = os.path.abspath(path)
        cache = Path(os.environ.get("XDG_CACHE_HOME", "~/.cache")).expanduser()
        cache = cache / "ranger"
        cache.mkdir(exist_ok=True)
        sock = cache / "mpv.sock"

        try:
            self._send_command(path, sock)
        except (ConnectionRefusedError, FileNotFoundError):
            logger.info(f'LAUNCHING {path}')
            self._launch_mpv(path, sock)
        except Exception:
            logger.exception(traceback.format_exc())
            sys.exit(1)
        logger.info('SUCCESS')
