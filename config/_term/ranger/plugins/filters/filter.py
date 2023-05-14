import os
import subprocess


class FzfFilter:
    def __init__(self, directory, source, query):
        self.directory = directory
        self.source = source or []
        self.query = query

        cmd = subprocess.Popen(['fzf', '-f', self.query],
                               stdin=subprocess.PIPE,
                               stdout=subprocess.PIPE,
                               )
        stdout, _ = cmd.communicate('\n'.join(source).encode('utf-8'))
        self.result = stdout.decode('utf-8').strip().splitlines()

    def __call__(self, fobj):
        if os.path.dirname(fobj.path) != self.directory:
            return True
        return fobj.basename in self.result
