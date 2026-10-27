# Neovim Configuration

A modular Neovim setup for programming, navigation, LSP support, completion, formatting, and a transparent terminal-friendly UI. Requires **Neovim 0.11+** and **Git**. Some language features need their own tool-chains (see [Language support](https://github.com/Joshieingold/Nvim/tree/clean-up#language-support)).

## Commands to get some more use out of:

| Command     | Purpose                                                     |
| ----------- | ----------------------------------------------------------- |
| `<Space>ff` | Smart find files.                                           |
| `<Space>sg` | Search text in project                                      |
| `<Space>sH` | Highlight groups                                            |
| `<Space>su` | Undo history                                                |
| `<Space>uC` | Colorscheme picker                                          |
| `<Space>gl` | Git log                                                     |
| `<Space>gL` | Git log for current line                                    |
| `<Space>gf` | Git log for current file                                    |
| `<Space>gB` | Browse current Git file/selection in remote (normal/visual) |
| `<Space>rn` | Rename symbol (when an LSP is attached)                     |
| `<Space>xt` | TODO comments in Trouble                                    |

## Project Structure

```md
└── joshieingold-nvim/
├── README.md
├── init.lua
├── lazy-lock.json
├── after/
│ └── ftplugin/ # For Dealing with language syntax that is difficult to parse.
│ ├── jsp.lua
│ └── razor.lua
├── colors/ # Redirects to Themes
│ ├── blossom.lua
│ └── nordic_custom.lua # Built in default, does not require lush.
├── lsp/ # Special Configurations for LSP's
│ ├── clangd.lua
│ ├── cssls.lua
│ ├── emmet_ls.lua
│ ├── html.lua
│ ├── lua_ls.lua
│ └── roslyn.lua # Tuned for Razor Pages
└── lua/
├── config/
│ ├── autocmds.lua # For plugin free auto commands
│ ├── filetypes.lua # File detection help for Treesitter
│ ├── keymaps.lua # Vim Keymappings
│ ├── lazy.lua
│ ├── options.lua # Vim tweaks
│ └── transparency.lua # Handles transparency among all themes
├── lush_theme/
│ └── blossom.lua # Lush themes
└── plugins/
├── coding/
│ ├── completion.lua
│ ├── formatting.lua
│ └── treesitter.lua
├── editor/
│ ├── autopairs.lua
│ ├── autotag.lua
│ ├── copilot.lua # Not enabled.. but will be good one day
│ ├── harpoon.lua
│ ├── snacks.lua # Bulk of operations happen here
│ ├── surround.lua
│ ├── terminal.lua
│ └── trouble.lua
├── lang/ # Helper again for Treesitter to understand difficult files.
│ ├── jsp.lua
│ └── razor.lua
├── lsp/
│ ├── lspconfig.lua
│ └── mason.lua
└── ui/
├── colorscheme.lua
├── lualine.lua
├── lush.lua
└── smear-cursor.lua
```

## Keybindings

### Files and Buffers

| Command     | Action                                        |
| ----------- | --------------------------------------------- |
| `<Space>ff` | Smart find files                              |
| `<Space>pf` | Find files including hidden and ignored files |
| `<Space>pb` | List buffers                                  |
| `<Space>pg` | Find Git-tracked files                        |
| `<Space>pr` | Recent files                                  |
| `<Space>pv` | File explorer                                 |
| `<Space>bd` | Delete current buffer                         |
| `<Space>.`  | Toggle scratch buffer                         |
| `<Space>S`  | Select scratch buffer                         |

### Search and pickers

| Mapping     | Action                                                  |
| ----------- | ------------------------------------------------------- |
| `<Space>sg` | Search text in project (Grep; normally needs `ripgrep`) |
| `<Space>sw` | Search word under cursor / visual selection             |
| `<Space>sb` | Search lines in current buffer                          |
| `<Space>sB` | Search open buffers                                     |
| `<Space>sd` | Diagnostics picker                                      |
| `<Space>sh` | Help pages                                              |
| `<Space>sH` | Highlight groups                                        |
| `<Space>sk` | Keymaps                                                 |
| `<Space>sp` | Lazy/plugin specs picker                                |
| `<Space>sq` | Quickfix list                                           |
| `<Space>su` | Undo history                                            |
| `<Space>sR` | Resume last picker                                      |
| `<Space>uC` | Colorscheme picker                                      |
| `<Space>s`  | followed by other documented letters                    |

### Git

| Mapping                   | Action                                                      |
| ------------------------- | ----------------------------------------------------------- |
| `<Space>gs`               | Git status                                                  |
| `<Space>gd`               | Git diff/hunks                                              |
| `<Space>gb`               | Git branches                                                |
| `<Space>gl`               | Git log                                                     |
| `<Space>gL`               | Git log for current line                                    |
| `<Space>gf`               | Git log for current file                                    |
| `<Space>gS`               | Git stash picker                                            |
| `<Space>gB`               | Browse current Git file/selection in remote (normal/visual) |
| `<Space>lg`               | Open Lazygit UI through Snacks (requires Lazygit installed) |
| `<Space>gi` / `<Space>gI` | GitHub issues open / all (requires `gh`)                    |
| `<Space>gp` / `<Space>gP` | GitHub pull requests open / all (requires `gh`)             |

### LSP

| Mapping                   | Action                                  |
| ------------------------- | --------------------------------------- |
| `gd` / `gD`               | Definition / declaration                |
| `gr`                      | References                              |
| `gI`                      | Implementations                         |
| `gy`                      | Type definition                         |
| `gai` / `gao`             | Incoming / outgoing calls               |
| `<Space>ss` / `<Space>sS` | Document / workspace symbols            |
| `<Space>rn`               | Rename symbol (when an LSP is attached) |
| `<Space>ca`               | Code action (when an LSP is attached)   |
| `<Space>k`                | Show diagnostic under cursor            |

### Editing, terminal, and diagnostics

| Mapping                   | Action                                                       |
| ------------------------- | ------------------------------------------------------------ |
| `J` / `K` in visual mode  | Move selected lines down / up                                |
| `Ctrl-d` / `Ctrl-u`       | Half-page scroll and recenter                                |
| `<Space>y`                | Yank selection to system clipboard                           |
| `<Space>Y`                | Yank to end of line to system clipboard                      |
| `Ctrl-/`                  | Toggle terminal split (some terminals send `Ctrl-_` instead) |
| `<Space>/`                | Send current line to terminal; in visual mode send selection |
| `==`                      | Format current file or selected range                        |
| `<Space>z` / `<Space>Z`   | Zen mode / zoom                                              |
| `<Space>n`                | Notification history                                         |
| `<Space>un`               | Dismiss notifications                                        |
| `<Space>rr`               | LSP-aware file rename                                        |
| `<Space>xw` / `<Space>xd` | Workspace / current-buffer diagnostics in Trouble            |
| `<Space>xq` / `<Space>xl` | Quickfix / location list in Trouble                          |
| `<Space>xt`               | TODO comments in Trouble                                     |
| `<Space>a`                | Add current file to Harpoon                                  |
| `Ctrl-e`                  | Harpoon quick menu                                           |
| `Ctrl-h/j/k/l`            | Jump to Harpoon file 1/2/3/4                                 |
| `S{motion}{char}`         | Surround selected text with the char                         |

### Insert mode and snippets

| Mapping           | Action                         |
| ----------------- | ------------------------------ |
| `Ctrl-j / Ctrl-k` | Next/Previous completion item. |
| `Ctrl-e`          | Close completion menu.         |
| `enter`           | Confirm completion item.       |

## Colorschemes and transparency

Select the default in `lua/plugins/ui/colorscheme.lua`:

```lua
local active = "blossom" -- "nordic_custom" or "default"
```

Then run `:colorscheme blossom` or `:colorscheme nordic_custom` at any time. `blossom` is a Lush-defined pink/purple theme. `nordic_custom` is a **native Lua colorscheme** inspired by Nordic: it does not install or load `nordic.nvim` or Lush. It is deliberately self-contained in `colors/nordic_custom.lua`.

Transparency is controlled centrally in `lua/config/transparency.lua`:

```lua
vim.g.transparent_background = true -- set false for opaque backgrounds
```

The shared ColorScheme autocmd clears backgrounds for common editor UI groups after _any_ scheme is loaded, so switching schemes does not silently lose transparency. Set the option to `false` and restart/re-source the config if you want theme backgrounds. Your terminal emulator must itself have a background you like; Neovim's `NONE` means “use the terminal background”, not “make the terminal transparent”.

### Editing the Lush theme

- Theme definition: `lua/lush_theme/blossom.lua`
- Loader: `colors/blossom.lua`
- Preview: `:Lushify` while the theme definition is open (if supported by the installed Lush version).
- Apply: `:colorscheme blossom`
- Palette and syntax groups are defined in the theme file. Lush is a dependency only for this Lush-authored theme/tooling, not for `nordic_custom`.

To add another Lush theme, copy the theme definition and its loader, then change the theme name in the loader. To add a dependency-free theme, write a file in `colors/<name>.lua` using `vim.api.nvim_set_hl` and set `vim.g.colors_name = "<name>"`.

## Known Issues

- `<Leader>sf` : `No results found for quickfix.`
- `<Leader>pf` :

````lua
vim.schedule callback: /usr/share/nvim/runtime/lua/vim/treesitter/languagetree.lua:215: /usr/share/nvim/runtime/lua/vim/treesitter.lua:197: attempt to call method 'range' (a nil value)
stack traceback:
        [C]: in function 'f'
        /usr/share/nvim/runtime/lua/vim/treesitter/languagetree.lua:215: in function 'tcall'
        /usr/share/nvim/runtime/lua/vim/treesitter/languagetree.lua:596: in function </usr/share/nvim/runtime/lua/vim/treesitter/languagetree.lua:579>```
 - `<Leader>pg` : `vim.schedule callback: /usr/share/nvim/runtime/lua/vim/treesitter/languagetree.lua:215: /usr/share/nvim/runtime/lua/vim/treesitter.lua:197: attempt to call method 'range' (a nil value)
stack traceback:
        [C]: in function 'f'
        /usr/share/nvim/runtime/lua/vim/treesitter/languagetree.lua:215: in function 'tcall'
        /usr/share/nvim/runtime/lua/vim/treesitter/languagetree.lua:596: in function </usr/share/nvim/runtime/lua/vim/treesitter/languagetree.lua:579>
````

- `<Leader>sf` : `No results found for quickfix`
- `<Space>gl`:

```lua
Lua callback: /usr/share/nvim/runtime/lua/vim/treesitter.lua:197: attempt to call method 'range' (a nil
value)
stack traceback:
        /usr/share/nvim/runtime/lua/vim/treesitter.lua:197: in function 'get_range'
        /usr/share/nvim/runtime/lua/vim/treesitter.lua:239: in function 'get_node_text'
        ...nvim-treesitter/lua/nvim-treesitter/query_predicates.lua:141: in function 'handler'
        /usr/share/nvim/runtime/lua/vim/treesitter/query.lua:865: in function '_apply_directives'
        /usr/share/nvim/runtime/lua/vim/treesitter/query.lua:1086: in function '(for generator)'
        /usr/share/nvim/runtime/lua/vim/treesitter/languagetree.lua:1125: in function '_get_injections'
        /usr/share/nvim/runtime/lua/vim/treesitter/languagetree.lua:690: in function '_parse'
        /usr/share/nvim/runtime/lua/vim/treesitter/languagetree.lua:639: in function 'parse'
        ...im/lazy/snacks.nvim/lua/snacks/picker/util/highlight.lua:49: in function 'get_highlights'
        ...im/lazy/snacks.nvim/lua/snacks/picker/util/highlight.lua:121: in function 'get_virtual_lines'

        ...re/nvim/lazy/snacks.nvim/lua/snacks/picker/util/diff.lua:235: in function 'parse_hunk'
        ...re/nvim/lazy/snacks.nvim/lua/snacks/picker/util/diff.lua:323: in function 'format_hunk'
        ...re/nvim/lazy/snacks.nvim/lua/snacks/picker/util/diff.lua:160: in function 'format_block'
        ...re/nvim/lazy/snacks.nvim/lua/snacks/picker/util/diff.lua:101: in function 'format'
        ...re/nvim/lazy/snacks.nvim/lua/snacks/picker/util/diff.lua:87: in function 'render'
        ...hare/nvim/lazy/snacks.nvim/lua/snacks/picker/preview.lua:190: in function 'fancy_diff'
        ...hare/nvim/lazy/snacks.nvim/lua/snacks/picker/preview.lua:221: in function 'on_lines'
        ...ocal/share/nvim/lazy/snacks.nvim/lua/snacks/util/job.lua:124: in function 'on_exit'
        ...ocal/share/nvim/lazy/snacks.nvim/lua/snacks/util/job.lua:109: in function 'fn'
        ...ocal/share/nvim/lazy/snacks.nvim/lua/snacks/util/job.lua:48: in function <...ocal/share/nvim/
lazy/snacks.nvim/lua/snacks/util/job.lua:47>
```
