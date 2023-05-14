import ranger.api.commands

from .filter import FzfFilter


class fzf_filter(ranger.api.commands.Command):
    """
    :fzf_filter <query>

    Filter with fzf
    """

    def execute(self):
        self.fm.thisdir.__dict__['fzf_filter'] = self._build_filter()
        self.fm.thisdir.refilter()
        if self.quickly_executed:
            self.fm.open_console(self.line)

    def cancel(self):
        self.fm.thisdir.__dict__['fzf_filter'] = None
        self.fm.thisdir.refilter()

    def quick(self):
        return True

    def _build_filter(self):
        directory = self.fm.thisdir.path
        source = [i.basename for i in self.fm.thisdir.files_all]
        query = ' '.join(self.args[1:])
        return FzfFilter(directory, source, query)
