import ranger.api
import ranger.container.directory
from .command import fzf_filter

# region overwrite hook_init
HOOK_INIT_OLD = ranger.api.hook_init


def hook_init(fm):
    def clear_fzf_filter(signal):
        if fm.settings.clear_filters_on_dir_change and signal.previous:
            signal.previous.__dict__['fzf_filter'] = None
            signal.previous.refilter()

    fm.signal_bind("cd", clear_fzf_filter)
    return HOOK_INIT_OLD(fm)


ranger.api.hook_init = hook_init
# endregion overwrite hook_init

# region overwrite accept_file
ACCEPT_FILE_OLD = ranger.container.directory.accept_file


def accept_file(fobj, filters):
    _fzf_filter = fobj.fm.thisdir.__dict__.get('fzf_filter', None)
    if _fzf_filter:
        filters.append(_fzf_filter)
    return ACCEPT_FILE_OLD(fobj, filters)


ranger.container.directory.accept_file = accept_file
# endregion overwrite accept_file
