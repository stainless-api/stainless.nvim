# Stainless Neovim plugin

This repo contains a Neovim plugin that provides a config for the Stainless LSP.

This plugin requires Neovim 0.11+.

## Installation

Example using [Lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "stainless-api/stainless.nvim",
  config = function()
    require("stainless")
  end
}
```

You'll also need to have the LSP [installed](https://www.npmjs.com/package/@stainless-api/stainless-language-server) and accessible in your PATH as `stainless-language-server`.
