require 'nvim-treesitter.configs'.setup {
  ensure_installed = "python", -- one of "all", "language", or a list of languages
  highlight = {
    enable = true -- false will disable the whole extension
  }
}
