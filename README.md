# Neovim config

Requires **Neovim ≥ 0.11** (uses `vim.lsp.config`, `lsp/*.lua`) and **git**. For C#/Razor you also need the **.NET SDK** (`dotnet` on PATH).

## Layout

```
init.lua                    entry point (load order is documented inside)
lsp/                        one file per language server (native Neovim 0.11)
  clangd lua_ls html cssls emmet_ls roslyn
after/ftplugin/             per-filetype buffer settings (razor, jsp)
lua/config/
  options.lua               editor options + <leader>
  keymaps.lua               global keymaps (plugin keymaps live with their plugin)
  autocmds.lua              plugin-free autocommands
  filetypes.lua             razor / jsp filetype detection
  lazy.lua                  lazy.nvim bootstrap + which plugin groups to load
lua/plugins/
  ui/       colorscheme, lualine, smear-cursor
  editor/   snacks (pickers/explorer/dashboard), harpoon, terminal, trouble,
            autopairs, autotag, surround, copilot (disabled)
  coding/   completion (cmp + snippets), formatting (conform), treesitter
  lsp/      lspconfig (core wiring), mason (installs servers/tools)
  lang/     language packs: razor.lua, jsp.lua
```

### How to extend

| I want to…                        | Do this                                                                                                                                                                                         |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Add a plugin                      | New file in the matching `lua/plugins/<group>/` folder returning a lazy spec                                                                                                                    |
| Add/tune a language server        | Create `lsp/<server>.lua` (returns a table); add the name to `ensure_installed` in `plugins/lsp/mason.lua` (or to the `vim.lsp.enable` list in `plugins/lsp/lspconfig.lua` if system-installed) |
| Add a formatter                   | `formatters_by_ft` in `coding/formatting.lua` + package name in `lsp/mason.lua`                                                                                                                 |
| Support a new language end-to-end | Copy `lang/jsp.lua`: it _extends_ treesitter / autotag / mason specs via `opts`, so everything for that language sits in one file                                                               |
| Add a picker hotkey               | `editor/snacks.lua`: `{ "<leader>xx", pick("<source>"), desc = "…" }`                                                                                                                           |
| Find any existing hotkey          | `<leader>sk`                                                                                                                                                                                    |

## Razor / Blazor / .cshtml

Roslyn (the same server as VS Code's C# extension) now handles Razor itself via roslyn.nvim, so **rzls.nvim is not needed**.

The missing piece in the old config: the `roslyn` package lives in a community Mason registry that wasn't registered. `lang/razor.lua` adds it and auto-installs `roslyn` + `csharpier`.

| Piece                                                                       | Where                                               |
| --------------------------------------------------------------------------- | --------------------------------------------------- |
| Server package + Mason registry                                             | `lang/razor.lua`                                    |
| `.razor` and `.cshtml` → filetype `razor` (was split into `razor`/`cshtml`) | `config/filetypes.lua`                              |
| Server settings                                                             | `lsp/roslyn.lua`                                    |
| Markup completion (HTML/CSS/Emmet)                                          | `lsp/html.lua`, `lsp/cssls.lua`, `lsp/emmet_ls.lua` |
| Snippets (html + csharp)                                                    | `coding/completion.lua`                             |
| Tag auto-close alias                                                        | `lang/razor.lua`                                    |
| Comments `@* *@`                                                            | `after/ftplugin/razor.lua`                          |

**First run:** open nvim, let Lazy install, wait for Mason to finish (`:Mason`, look for `roslyn`), then open a `.razor`/`.cshtml` file inside a project with a `.sln`/`.csproj`.
**Multiple solutions:** `:Roslyn target`. **Restart:** `:Roslyn restart`.
**If nothing attaches:** `:set ft?` (should say `razor`), `:checkhealth vim.lsp`, `:Mason`.

## JSP

No JSP-aware language server or treesitter grammar exists, so this is "best available":

- **Syntax:** Vim's built-in `jsp` syntax (understands `<% %>`, `${}`, taglibs, embedded Java). Treesitter highlighting is disabled for `jsp` on purpose (HTML grammar would flatten scriptlets).
- **HTML/CSS completion** via the html/cssls servers, **Emmet**, **tag auto-close/rename**, **snippets** (html + java), **`gc` comments** as `<%-- --%>`.
- **Not available:** Java completion/diagnostics inside scriptlets, and formatting.

## Key changes vs. your old config

Fixes

- `<leader>s` (normal) was mapped to `"+y`, shadowing every `<leader>s…` picker (e.g. `<leader>si` was "yank inner"). Replaced with `<leader>Y`.
- Harpoon's `settings` were never passed to `setup()`; now they are.
- Snacks `toggle` for `ufo`/`noice` (not installed) would error → removed. Dead `]]`/`[[` keys (Snacks `words` is disabled, so they just shadowed the built-in) → removed. Duplicate `<leader>sb` → removed.
- nvim-ts-autotag was configured with options the plugin doesn't have (`filetypes`, `per_filetype.razor`) → fixed to `opts` + `aliases`.
- roslyn.nvim was set up with the old `config = {…}` API → server settings now in `lsp/roslyn.lua`.
- Two Mason specs (`plugins/mason.lua` and `plugins/lsp/mason.lua`) → merged.
- nvim-treesitter-textobjects was unpinned (→ `main`, incompatible with treesitter `master`) → pinned to `master`.
- Colorscheme overrides now survive re-applying a theme.
- conform: replaced deprecated `lsp_fallback` with `lsp_format`.

Removed (run `:Lazy clean` afterwards)

- **telescope** (Snacks picker covers it; `<leader>pf` now uses Snacks with hidden+ignored files)
- **lazygit.nvim** (`Snacks.lazygit` on `<leader>gg` does the same; `<leader>lg` is gone)
- **nvim-lsp-file-operations** (only useful with nvim-tree/neo-tree; Snacks rename handles LSP renames)
- `lush.nvim`, `sakura.nvim` (in your lockfile but never used in a spec)

Added (small)

- `<leader>rn` rename, `<leader>ca` code action (on LSP attach); `<Tab>`/`<S-Tab>` to jump within snippets; yank highlight; `todo-comments` is now actually set up so `:Trouble todo` works; `clang-format` and `csharpier` in Mason.
