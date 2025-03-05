# 🚫 redact_pass.nvim
Set Neovim options to edit `pass(1)` files securely

This plugin switches off the `'shada'`, `'backup'`, `'writebackup'`, `'swapfile'`, and `'undofile'` options globally when editing a password in `pass(1)`.

This is to prevent anyone being able to extract passwords from your Neovim cache files in the event of a compromise.

You should test this after installation to ensure you see this message is printed whenever you `pass edit`:

> Editing password file--disabled leaky options!

Adapted from [redact_pass.vim][1] by [Tom Ryder][2]

[1]: https://dev.sanctum.geek.nz/cgit/vim-redact-pass.git/
[2]: https://sanctum.geek.nz/


## 📦 Installation

Install the plugin with your preferred package manager:

```lua
-- Lazy.nvim
{
  "BB223/redact_pass.nvim",
  opts = {
    -- ...
  }
}
```

## ⚙️ Configuration

**redact_pass.nvim** comes with the following defaults:

```lua
{
    patterns = {
        "/dev/shm/pass.?*/?*.txt",
        (vim.env.TMPDIR or "/tmp") .. "/pass.?*/?*.txt",
        "/tmp/pass.?*/?*.txt",
        "/dev/shm/gopass-?*/?*",
        (vim.env.TMPDIR or "/tmp") .. "/gopass-?*/?*",
        "/tmp/gopass-?*/?*.txt",
        -- pattern for mac users
        "/private/var/?*/pass.?*/?*.txt",
        "/private/var/?*/gopass-?*/?*",

    },

}
```
