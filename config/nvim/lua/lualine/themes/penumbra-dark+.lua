local colors = {
    sunp    = "#fffdfb",
    sun     = "#fff7ed",
    sunm    = "#f2e6d4",
    skyp    = "#cecece",
    sky     = "#9e9e9e",
    skym    = "#636363",
    shadep  = "#3e4044",
    shade   = "#24272b",
    shadem  = "#181b1f",
    red     = "#df7f78",
    orange  = "#ce9042",
    yellow  = "#9ca748",
    green   = "#50b584",
    cyan    = "#00b3c2",
    blue    = "#61a3e6",
    purple  = "#a48fe1",
    magenta = "#d080b6",
}

return {
    normal = {
        a = { fg = colors.shade, bg = colors.green, gui = "bold" },
        b = { fg = colors.sky, bg = colors.shadep },
        c = { fg = colors.sky, bg = colors.shadem },
    },
    command  = { a = { fg = colors.shade, bg = colors.yellow, gui = "bold" } },
    insert   = { a = { fg = colors.shade, bg = colors.blue,   gui = "bold" } },
    visual   = { a = { fg = colors.shade, bg = colors.purple, gui = "bold" } },
    terminal = { a = { fg = colors.shade, bg = colors.cyan,   gui = "bold" } },
    replace  = { a = { fg = colors.shade, bg = colors.red,    gui = "bold" } },
    inactive = {
        a = { fg = colors.skym, bg = colors.shade, gui = "bold" },
        b = { fg = colors.skym, bg = colors.shade },
        c = { fg = colors.skym, bg = colors.shadem },
    },
}
