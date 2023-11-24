require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {
            config = {
                init_open_folds = "never",
                icons = {
                    ordered = {
                        icons = (not has_anticonceal) and { "1", "A", "a", "i", "5", "6" } or nil
                    }
                },
            },
        },
        ["core.summary"] = {},
        ["core.esupports.metagen"] = {
            config = {
                type = "auto",
            },
        },
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    flying = "~/safe/neorg/flying",
                    cooking = "~/safe/neorg/cooking",
                    misc = "~/safe/neorg/misc",
                },
                default_workspace = "misc",
		use_popup = false,
            },
        },
    },
}
