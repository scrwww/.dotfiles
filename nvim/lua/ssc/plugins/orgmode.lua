return{
  'nvim-orgmode/orgmode',
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/personal/org/*',
      org_default_notes_file = '~/personal/org/refile.org',
    })
  end,
}
