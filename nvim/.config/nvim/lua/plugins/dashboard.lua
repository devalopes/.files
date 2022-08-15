local db = require('dashboard')

db.custom_header = {
[[                                                      ]],
[[███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
[[████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
[[██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
[[██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
[[██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
[[╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
[[                                                      ]],
[[                                                      ]],
}

-- db.custom_header = {
--   [[=================     ===============     ===============   ========  ========]],
--   [[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
--   [[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
--   [[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
--   [[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
--   [[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
--   [[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
--   [[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
--   [[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
--   [[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
--   [[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
--   [[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
--   [[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
--   [[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
--   [[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
--   [[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
--   [[||.=='    _-'                                                     `' |  /==.||]],
--   [[=='    _-'                        N E O V I M                         \/   `==]],
--   [[\   _-'                                                                `-_   /]],
--   [[ `''                                                                      ``']],
-- }

local home = os.getenv('HOME') or "~"

db.custom_center = {
  {icon = '  ',
  desc = 'Recently latest session                  ',
  shortcut = 'SPC s l',
  action ='SessionLoad'},
  {icon = '  ',
  desc = 'Recently opened files                   ',
  action =  'DashboardFindHistory',
  shortcut = 'SPC f h'},
  {icon = '  ',
  desc = 'Find  File                              ',
  action = 'Telescope find_files find_command=rg,--hidden,--files',
  shortcut = 'SPC f f'},
  {icon = '  ',
  desc ='File Browser                            ',
  action =  'Telescope file_browser',
  shortcut = 'SPC f b'},
  {icon = '  ',
  desc = 'Find  word                              ',
  action = 'Telescope live_grep',
  shortcut = 'SPC f w'},
  {icon = '  ',
  desc = 'Open Personal dotfiles                  ',
  action = 'Telescope dotfiles path=' .. home ..'/.files/nvim/.config/nvim/lua',
  shortcut = 'SPC f d'},
}

local time = os.date("*t") or 0
local greeting = ""
if (time.hour >= 6 and time.hour < 12)
then
  greeting = "Good morning! 🌄"
elseif (time.hour >= 12 and time.hour < 18) then
  greeting = "Good afternoon! 🌞"
elseif (time.hour >= 18 or time.hour < 6) then
  greeting = "Good night! 🌙"
end

local user = os.getenv("USER") or ""
local host = os.getenv("HOSTNAME") or ""

db.custom_footer = {
  "",
  greeting,
  os.date("%A, %B %m %Y"),
  "",
  "[".. user .. "@" .. host .. "]",
}
