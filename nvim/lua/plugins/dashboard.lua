return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        width = 60,
        preset = {
          header = [[
██╗  ██╗██╗██████╗  ██████╗ ████████╗
██║ ██╔╝██║██╔══██╗██╔═══██╗╚══██╔══╝
█████╔╝ ██║██████╔╝██║   ██║   ██║
██╔═██╗ ██║██╔══██╗██║   ██║   ██║
██║  ██╗██║██████╔╝╚██████╔╝   ██║
╚═╝  ╚═╝╚═╝╚═════╝  ╚═════╝    ╚═╝
          ]],
        },
        sections = {
          { section = "header", align = "center", padding = 2 },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup", align = "center", padding = 1 },
        },
      },
    },
  },
}
