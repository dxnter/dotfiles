-- Alacritty Padding Configuration
--[[
  A padding of 20 is set in alacritty.yml but it looks unappealing when
  running vim. These funtions will remove the padding when entering vim
  and set it back when exiting.
]]

function Sad(line_nr, from, to, fname)
  vim.cmd(string.format("silent !sed -i '%ss/%s/%s/' %s", line_nr, from, to, fname))
end

function IncreasePadding()
  Sad('19', 0, 20, '~/.config/alacritty/alacritty.yml')
  Sad('20', 0, 20, '~/.config/alacritty/alacritty.yml')
end

function DecreasePadding()
  Sad('19', 20, 0, '~/.config/alacritty/alacritty.yml')
  Sad('20', 20, 0, '~/.config/alacritty/alacritty.yml')
end

vim.cmd[[
  augroup ChangeAlacrittyPadding
   au!
   au VimEnter * lua DecreasePadding()
   au VimLeavePre * lua IncreasePadding()
  augroup END
]]
