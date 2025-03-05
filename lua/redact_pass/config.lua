local M = {}

---@class rp.Config
---@field patterns string[]
local defaults = {
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

---@param opts? rp.Config
function M.setup(opts)
    ---@type rp.Config
    M.options = vim.tbl_extend("force", defaults, opts or {})

    local group = vim.api.nvim_create_augroup("redact_pass", { clear = true })

    vim.api.nvim_create_autocmd("VimEnter", {
        group = group,
        pattern = M.options.patterns,
        callback = function()
            -- Disable leaky options globally
            vim.opt.backup = false
            vim.opt.writebackup = false
            vim.opt.swapfile = false
            vim.opt.undofile = false
            vim.opt.shada = ""

            vim.cmd.redraw()
            vim.notify("Editing password file--disabled leaky options!", vim.log.levels.WARN)
        end,
    })
end

return M
