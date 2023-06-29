local wilder = require("wilder")

wilder.set_option("renderer", wilder.popupmenu_renderer(
    wilder.popupmenu_border_theme({
        highlighter = wilder.basic_highlighter(),
        highlights = {
            accent = wilder.make_hl("WilderAccent", "Pmenu", {
                { a = 1 },
                { a = 1 },
                { foreground = "#df7c8e" }
            }),
        },
        -- "single", "double", "rounded" or "solid"
        -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
        border = "rounded",
        left = { " ", wilder.popupmenu_devicons() },
        right = { " ", wilder.popupmenu_scrollbar() },
    })
))
