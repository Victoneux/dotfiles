-- Catppuccin color scheme.

local catppuccin = {}
catppuccin.flamingo = '#F2CDCD'
catppuccin.mauve = '#DDB6F2'
catppuccin.pink = '#f5c2e7'
catppuccin.maroon = '#e8a2af'
catppuccin.red = '#f28fad'
catppuccin.peach = '#f8bd96'
catppuccin.yellow = '#fae3b0'
catppuccin.green = '#abe9b3'
catppuccin.teal = '#b5e8e0'
catppuccin.blue = '#96cdfb'
catppuccin.sky = '#89dceb'

catppuccin.black0 = '#161320'
catppuccin.black1 = '#1a1826'
catppuccin.black2 = '#1e1e2e'
catppuccin.black3 = '#302d41'
catppuccin.black4 = '#575268'
catppuccin.gray0 = '#6e6c73'
catppuccin.gray1 = '#988ba2'
catppuccin.gray2 = '#c3bac6'
catppuccin.white = '#d9e0ee'
catppuccin.lavender = '#c9cbff'
catppuccin.rosewater = '#f5e0dc'

-- Actual Color Defines

local colors = {}

-- Blacks (0 is darker, 4 is lighter)
colors.dark0 = catppuccin.black0
colors.dark1 = catppuccin.black1
colors.dark2 = catppuccin.black2
colors.dark3 = catppuccin.black3
colors.dark4 = catppuccin.black4

-- Grays (0 is darker, 4 is lighter)
colors.medium0 = catppuccin.gray0
colors.medium1 = catppuccin.gray1
colors.medium2 = catppuccin.gray2
colors.medium3 = catppuccin.gray2
colors.medium4 = catppuccin.gray2

-- Whites (0 is darker, 4 is lighter)
colors.white0 = catppuccin.white
colors.white1 = catppuccin.white
colors.white2 = catppuccin.white
colors.white3 = catppuccin.white
colors.white4 = catppuccin.white

-- Colors!
colors.flamingo = catppuccin.flamingo
colors.mauve = catppuccin.mauve
colors.pink = catppuccin.pink
colors.maroon = catppuccin.maroon
colors.peach = catppuccin.peach
colors.yellow = catppuccin.yellow
colors.green = catppuccin.green
colors.teal = catppuccin.teal
colors.blue = catppuccin.blue
colors.sky = catppuccin.sky
colors.lavender = catppuccin.lavender
colors.rosewater = catppuccin.rosewater
colors.red = catppuccin.red

-- General
colors.foreground = colors.white0
colors.background = colors.dark2
colors.transparent = '#ffffff00'

return colors
