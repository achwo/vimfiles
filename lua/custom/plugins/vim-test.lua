local root_markers = { 'Gemfile', 'package.json', '.git/' }
function _G.RunVimTest(cmd_name)
  return function()
    for _, marker in ipairs(root_markers) do
      local marker_file = vim.fn.findfile(marker, vim.fn.expand('%:p:h') .. ';')
      if #marker_file > 0 then
        vim.g['test#project_root'] = vim.fn.fnamemodify(marker_file, ":p:h")
        break
      end
      local marker_dir = vim.fn.finddir(marker, vim.fn.expand('%:p:h') .. ';')
      if #marker_dir > 0 then
        vim.g['test#project_root'] = vim.fn.fnamemodify(marker_dir, ":p:h")
        break
      end
    end

    vim.cmd(':' .. cmd_name)
  end
end

return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux"
  },
  config = function()
    vim.g['test#strategy'] = 'vimux'
  end,
  keys = {
    { '<leader>tt', RunVimTest('TestNearest'), desc = "Run nearest test" },
    { '<leader>tT', RunVimTest('TestFile'),    desc = "Run all tests in the current file" },
    { '<leader>ta', RunVimTest('TestSuite'),   desc = "Run the nearest test suite" },
    { '<leader>tl', RunVimTest('TestLast'),    desc = "Run last test again" },
    { '<leader>tg', RunVimTest('TestVisit'),   desc = "Test visit" },
  },
}
