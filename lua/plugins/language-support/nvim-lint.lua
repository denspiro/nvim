vim.api.nvim_create_autocmd({ "TextChanged", "BufEnter", "InsertLeave" }, {
  callback = function()
    local success = pcall(require, "lint")
    if success then
      require("lint").try_lint()
    end
  end,
})
