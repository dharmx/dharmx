require("presence"):setup({
    auto_update = true,
    neovim_image_text = "Keymaster's Forgery",
    main_image = "file",
    -- client_id           = "793271441293967371",
    log_level = nil,
    debounce_timeout = 10,
    enable_line_number = true,
    blacklist = {},
    buttons = true,

    editing_text = "Forging %s",
    file_explorer_text = "Browsing %s",
    git_commit_text = "Delivering Orders",
    plugin_manager_text = "Repairing Forgery",
    reading_text = "Mastering %s",
    workspace_text = "Conjuring %s",
    line_number_text = "Spell Line %s out of %s"
})

-- vim:ft=lua:nowrap
