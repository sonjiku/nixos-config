local platform = require('utils.platform')

local options = {
   default_prog = {},
   launch_menu = {},
}

if platform.is_win then
   options.default_prog = { 'pwsh', '-NoLogo' }
   options.launch_menu = {
   }
elseif platform.is_mac then
   options.default_prog = { '/opt/homebrew/bin/fish', '-l' }
   options.launch_menu = {
   }
elseif platform.is_linux then
   options.default_prog = { os.getenv("SHELL"), '-l' }
   options.launch_menu = {
      { label = 'Bash Login', args = { 'bash', '-l' } },
      -- { label = 'Fish', args = { 'fish', '-l' } },
      -- { label = 'Zsh', args = { 'zsh', '-l' } },
   }
end

return options
