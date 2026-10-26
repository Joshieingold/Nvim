# Neovim Configuration

A modular Neovim setup for programming, navigation, LSP support, completion, formatting, and a transparent terminal-friendly UI. Requires **Neovim 0.11+** and **Git**. Some language features need their own toolchains (see [Language support](#language-support)).

## Install / update

1. Back up your existing config directory (usually `~/.config/nvim`).
2. Copy this repository/config into `~/.config/nvim`, preserving the directory structure.
3. Start `nvim`. `lua/config/lazy.lua` bootstraps `lazy.nvim`; plugins install on first launch.
4. Run `:Lazy` to inspect plugin installation and `:Mason` to inspect language servers and formatters.
5. Restart Neovim after first-time installation.

Useful maintenance commands:

| Command                                                            | Purpose                                                   |
| ------------------------------------------------------------------ | --------------------------------------------------------- |
| `:Lazy`                                                            | Open plugin manager UI.                                   |
| `:Lazy sync`                                                       | Install/update plugins and remove no-longer-used plugins. |
| `:Lazy clean`                                                      | Remove plugins no longer declared in the config.          |
| `:Lazy update`                                                     | Update plugins.                                           |
| `:Mason`                                                           | Browse/install external LSP servers and tools.            |
| `:checkhealth`                                                     | Run Neovim health checks.                                 |
| `:checkhealth vim.lsp`                                             | Diagnose LSP setup.                                       |
| `:messages`                                                        | View recent errors/messages.                              |
| `:set ft?`                                                         | Show the current buffer's filetype.                       |
| `:verbose map <key>`                                               | Find which mapping owns a key.                            |
| `:lua print(vim.inspect(vim.api.nvim_get_hl(0, {name='Normal'})))` | Inspect a highlight group.                                |

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

## Configuration layout

````text
init.lua
lsp/                         Native Neovim 0.11 per-server LSP settings
    clangd.lua cssls.lua emmet_ls.lua html.lua lua_ls.lua roslyn.lua
after/ftplugin/               Buffer-local language settings (Razor, JSP)
    colors/                      Colorscheme entry points
    lua/config/
    options.lua                 Editor options and leader key
    keymaps.lua                 Plugin-independent mappings
    autocmds.lua                Plugin-independent autocommands
    filetypes.lua               Razor/JSP filetype detection
    lazy.lua                    lazy.nvim bootstrap and plugin imports
    transparency.lua            Transparency applied after every colorscheme
    lua/lush_theme/               Lush theme definitions
    lua/plugins/ui/               Colorscheme, statusline, cursor animation, Lush
    lua/plugins/editor/           Snacks, Harpoon, terminal, Trouble, pairs/tags/surround
    lua/plugins/coding/           Completion/snippets, formatting, Treesitter
    lua/plugins/lsp/               LSP wiring and Mason installers
    lua/plugins/lang/              Razor and JSP language packs
    lazy-lock.json                 Locked plugin revisions
    ```

### Startup order

    `init.lua` loads options first (so `<leader>` is set before mappings), then custom filetypes, Lazy/plugin specs, global mappings, and simple autocommands. Plugin configuration is grouped by UI, editor, coding, LSP, and language support in `lua/config/lazy.lua`.

## Keymaps

    `<leader>` is **Space**. Use `:WhichKey` only if you install a Which-Key plugin; this config's reliable built-in keymap finder is **`<Space>sk`** (Snacks keymap picker). Some mappings are available only after their plugin or an LSP attaches.

### Files and buffers (Snacks)

    | Mapping     | Action                                        |
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

    | Mapping                                         | Action                                                                                                                    |
    | ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
    | `<Space>sg`                                     | Search text in project (Grep; normally needs `ripgrep`)                                                                   |
    | `<Space>sw`                                     | Search word under cursor / visual selection                                                                               |
    | `<Space>sb`                                     | Search lines in current buffer                                                                                            |
    | `<Space>sB`                                     | Search open buffers                                                                                                       |
    | `<Space>sd`                                     | Diagnostics picker                                                                                                        |
    | `<Space>sh`                                     | Help pages                                                                                                                |
    | `<Space>sH`                                     | Highlight groups                                                                                                          |
    | `<Space>sk`                                     | Keymaps                                                                                                                   |
    | `<Space>sp`                                     | Lazy/plugin specs picker                                                                                                  |
    | `<Space>sq`                                     | Quickfix list                                                                                                             |
    | `<Space>su`                                     | Undo history                                                                                                              |
    | `<Space>sR`                                     | Resume last picker                                                                                                        |
    | `<Space>uC`                                     | Colorscheme picker                                                                                                        |
    | `<Space>s` followed by other documented letters | Additional Snacks pickers: registers, search history, autocmds, command history, commands, icons, jumps, marks, man pages |

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

    | Mapping                   | Action                                                                          |
    | ------------------------- | ------------------------------------------------------------------------------- |
    | `J` / `K` in visual mode  | Move selected lines down / up                                                   |
    | `Ctrl-d` / `Ctrl-u`       | Half-page scroll and recenter                                                   |
    | `<Space>y`                | Yank selection to system clipboard                                              |
    | `<Space>Y`                | Yank to end of line to system clipboard                                         |
    | `Ctrl-/`                  | Toggle terminal split (some terminals send `Ctrl-_` instead)                    |
    | `<Space>/`                | Send current line to terminal; in visual mode send selection                    |
    | `==`                      | Format current file or selected range (Conform; LSP fallback for manual format) |
    | `<Space>z` / `<Space>Z`   | Zen mode / zoom                                                                 |
    | `<Space>n`                | Notification history                                                            |
    | `<Space>un`               | Dismiss notifications                                                           |
    | `<Space>rr`               | LSP-aware file rename                                                           |
    | `<Space>xw` / `<Space>xd` | Workspace / current-buffer diagnostics in Trouble                               |
    | `<Space>xq` / `<Space>xl` | Quickfix / location list in Trouble                                             |
    | `<Space>xt`               | TODO comments in Trouble                                                        |
    | `<Space>a`                | Add current file to Harpoon                                                     |
    | `Ctrl-e`                  | Harpoon quick menu                                                              |
    | `Ctrl-h/j/k/l`            | Jump to Harpoon file 1/2/3/4                                                    |

### Insert mode and snippets

    - `Ctrl-Space`: open completion menu.
    - `Ctrl-j` / `Ctrl-k`: next / previous completion item.
    - `Ctrl-b` / `Ctrl-f`: scroll completion documentation.
    - `Ctrl-e`: close completion menu.
    - `Enter`: confirm a selected completion item (does not blindly select the first item).
    - `Tab` / `Shift-Tab`: jump forward/backward inside an active snippet; otherwise normal fallback behavior.
    - Emmet examples: type `ul>li*3` and invoke completion with `Ctrl-Space` in supported markup filetypes.

### Surround

    Provided by `nvim-surround`: `ys{motion}{char}` adds a surround, `cs{old}{new}` changes one, and `ds{char}` deletes one. Example: `ysiw"` surrounds the word under the cursor with quotes.

## Language support

    LSPs are configured with native Neovim 0.11 files in `lsp/<server>.lua`; `lua/plugins/lsp/lspconfig.lua` applies completion capabilities and enables servers. Mason handles configured server/tool installs.

    - **C/C++:** system `clangd` is expected on `PATH`; configured for background indexing, clang-tidy, and C++20 fallback flags. Install a compiler/toolchain separately.
    - **Lua:** `lua_ls`; Neovim API support through `lazydev.nvim`.
    - **HTML/CSS/Emmet:** HTML, CSS, and Emmet servers support markup; Emmet is enabled for Razor/JSP too.
    - **JavaScript/TypeScript and web frameworks:** configured Mason servers include TypeScript, Tailwind, Svelte, GraphQL, Prisma, and ESLint-related tooling. Exact support depends on the project and installed executables.
    - **Python:** Pyright plus configured Black/isort formatters.
    - **C# and Razor/Blazor:** `roslyn.nvim` and the community Mason registry; C# formatting uses CSharpier. Install the .NET SDK and open files inside a `.sln` or `.csproj` project. Commands: `:Roslyn restart`, `:Roslyn start`, `:Roslyn stop`, `:Roslyn target`.
    - **JSP:** best-effort built-in Vim JSP syntax, HTML/CSS completion, Emmet, tag completion, snippets, and JSP comment syntax. This setup does not provide Java diagnostics/completion inside JSP scriptlets or JSP formatting.

### Formatters

    Configured through `lua/plugins/coding/formatting.lua` and installed through Mason where supported. Format-on-save uses configured external formatters only; it deliberately does not fall back to LSP formatting on save. Manual `==` uses Conform and allows LSP fallback. Razor/JSP are not auto-formatted. If formatting fails, check `:ConformInfo`, `:Mason`, and whether the tool is on `PATH`.

## Adding or changing things

    - **Plugin:** add a Lazy spec under `lua/plugins/<group>/`.
    - **LSP server:** add `lsp/<server>.lua`, then enable it in `lua/plugins/lsp/lspconfig.lua` or add it to the Mason server list.
    - **Formatter:** add it to `formatters_by_ft` in `lua/plugins/coding/formatting.lua` and ensure the executable is installed.
    - **New filetype:** add detection in `lua/config/filetypes.lua`, then add language-specific Treesitter/Mason/autotag options in `lua/plugins/lang/` as appropriate.
    - **Picker mapping:** edit `lua/plugins/editor/snacks.lua` and follow the existing `{ "<Space>xx", pick("source"), desc = "..." }` pattern.
    - **Find a mapping:** press `<Space>sk`.

## Troubleshooting

    1. `:Lazy` → check for plugin errors and run `:Lazy sync`.
    2. `:Mason` → verify the relevant server/formatter is installed.
    3. `:checkhealth vim.lsp` and `:LspInfo` (if available) → check attached servers.
    4. `:set ft?` → verify the filetype, especially `razor` and `jsp`.
    5. `:messages` → read startup errors.
    6. If transparency appears opaque, confirm `vim.g.transparent_background` is `true`, the terminal supports transparency, and the selected terminal background is configured as expected.
    7. If a tool cannot be found, check `:echo executable('tool-name')` or run it in a shell.
````
