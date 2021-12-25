local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.autopep8,

    null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.diagnostics.pylint.with({
        method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
    }),

    null_ls.builtins.code_actions.gitsigns,

    null_ls.builtins.hover.dictionary,
    
    null_ls.builtins.completion.spell,
}

null_ls.setup({ sources = sources })

