local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
    null_ls.builtins.formatting.prettier, null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.black, null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.cmake_format,
    null_ls.builtins.formatting.codespell, null_ls.builtins.formatting.eslint,
    null_ls.builtins.formatting.fish_indent,
    null_ls.builtins.formatting.fixjson,
    null_ls.builtins.formatting.google_java_format
        .with({extra_args = {"--aosp"}}), null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.json_tool,
    null_ls.builtins.formatting.lua_format,
    null_ls.builtins.formatting.latexindent,
    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.formatting.nginx_beautifier,
    null_ls.builtins.formatting.nixfmt, null_ls.builtins.formatting.qmlformat,
    null_ls.builtins.formatting.rustfmt, null_ls.builtins.formatting.rustywind,
    null_ls.builtins.formatting.shellharden, null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.sqlformat,
    null_ls.builtins.formatting.stylelint, null_ls.builtins.formatting.taplo,
    null_ls.builtins.formatting.trim_whitespace,
    null_ls.builtins.formatting.uncrustify,

    null_ls.builtins.diagnostics.standardjs,
    null_ls.builtins.diagnostics.chktex, null_ls.builtins.diagnostics.stylelint,
    null_ls.builtins.diagnostics.qmllint,
    null_ls.builtins.diagnostics.shellcheck, null_ls.builtins.diagnostics.vint,
    null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.diagnostics.pylint.with({
        method = null_ls.methods.DIAGNOSTICS_ON_SAVE
    }), null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.code_actions.statix, null_ls.builtins.hover.dictionary,

    null_ls.builtins.completion.spell, null_ls.builtins.completion.vsnip,
    null_ls.builtins.completion.luasnip
}

local format_on_save = function(client)
    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
end

local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

local markdownlint = {
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = {"markdown"},
    -- null_ls.generator creates an async source
    -- that spawns the command with the given arguments and options
    generator = null_ls.generator({
        command = "markdownlint",
        args = {"--stdin"},
        to_stdin = true,
        from_stderr = true,
        -- choose an output format (raw, json, or line)
        format = "line",
        check_exit_code = function(code, stderr)
            local success = code <= 1

            if not success then
                -- can be noisy for things that run often (e.g. diagnostics), but can
                -- be useful for things that run on demand (e.g. formatting)
                print(stderr)
            end

            return success
        end,
        -- use helpers to parse the output from string matchers,
        -- or parse it manually with a function
        on_output = helpers.diagnostics.from_patterns({
            {
                pattern = [[:(%d+):(%d+) [%w-/]+ (.*)]],
                groups = {"row", "col", "message"}
            }, {pattern = [[:(%d+) [%w-/]+ (.*)]], groups = {"row", "message"}}
        })
    })
}

null_ls.register(markdownlint)

-- Test
-- :echo executable("eslint") or, similar
null_ls.setup({sources = sources, on_attach = format_on_save})

