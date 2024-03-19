# umbizo.nvim

Umbizo, a smart formatting plugin.

Umbizo is [swahili](https://en.wikipedia.org/wiki/Swahili_language) and
means format.

## Requirements

- [Neovim](https://github.com/neovim/neovim) (tested with 0.9.0)
- [prettier](https://prettier.io) (for formatting with prettier)
- [jq](https://github.com/jqlang/jq) (for JSON formatting)

## Installation

Via [lazy.nvim](https://github.com/folke/lazy.nvim):


### Simple configuration

```lua
require('lazy').setup({
  -- Smart formatting helper
  { 'mistweaverco/umbizo.nvim' },
})
```

## Public methods

### `require('umbizo').format()`

Formats the current buffer.
