local Config = require('config')
local wezterm = require('wezterm')

-- require('utils.backdrops')
--    :set_files()
--    -- :set_focus('#000000')
--    :random()

-- require('events.right-status').setup()
-- require('events.left-status').setup()
-- require('events.tab-title').setup()
-- require('events.new-tab-button').setup()
wezterm.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = '' .. name
  end
  window:set_right_status(name or '')
end)


local config =  Config:init()
   :append(require('config.appearance'))
   :append(require('config.binds'))
   -- :append(require('config.domains'))
   :append(require('config.fonts'))
   :append(require('config.general'))
   :append(require('config.launch'))


return config.options
