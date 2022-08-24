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
  { icon = '  ', desc = 'Find History                            ', shortcut = 'SPC f o', action = 'Telescope oldfiles' },
  { icon = '  ', desc = 'Find Files                              ', action = 'Telescope find_files hidden=true',
    shortcut = 'SPC f f' },
  { icon = '  ', desc = 'Find Project                            ', action = 'Telescope projects',
    shortcut = 'SPC f p' },
  { icon = '  ', desc = 'Find Word                               ', action = 'Telescope live_grep',
    shortcut = 'SPC f g' },
  { icon = '✉  ', desc = 'Git                                     ', action = 'Neogit', shortcut = 'SPC g  ' },
  { icon = '☸  ', desc = 'Git Branches                            ', action = 'Telescope git_branches',
    shortcut = '   -   ' },
  { icon = '☉  ', desc = 'Git Commits                             ', action = 'Telescope git_commits',
    shortcut = '   -   ' },
  { icon = '❂  ', desc = 'Git Stash                               ', action = 'Telescope git_stash',
    shortcut = '   -   ' },
  { icon = '☢  ', desc = 'Lsp Install                             ', action = 'Mason', shortcut = 'SPC m  ' },
  { icon = '✎  ', desc = 'New File                                ', action = 'DashboardNewFile', shortcut = 'SPC f n' },
  { icon = '⚠  ', desc = 'Help                                    ', action = 'Telescope help_tags',
    shortcut = 'SPC f h' },
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
local host = os.getenv("HOSTNAME") or os.getenv("NAME") or ""

db.custom_footer = {
  "",
  greeting,
  "[" .. user .. "@" .. host .. "]",
  "",
  os.date("%A, %B %m %Y"),
}
