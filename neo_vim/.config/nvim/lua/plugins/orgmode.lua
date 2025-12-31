require('orgmode').setup({
  org_agenda_files = '~/safe/orgfiles/**/*',
  org_default_notes_file = '~/safe/orgfiles/refile.org',
  mappings = {
      prefix = '<Leader><Leader>',
  }
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'org',
  callback = function()
    vim.keymap.set('i', '<S-CR>', '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
      silent = true,
      buffer = true,
    })
  end,
})
