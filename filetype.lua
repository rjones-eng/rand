-- .config/nvim

vim.filetype.add({
    extension = {note = "note"}  })

-- Attach lightweight per-ft options
vim.api.nvim_create_autocmd("FileType", {
  pattern = "note",
  callback = function()
    vim.bo.commentstring = "# %s"
    vim.bo.comments = "b:#"
  end,
})
