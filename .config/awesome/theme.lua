---------------------------
------ awesome theme ------
---------------------------

theme = {}

theme.font          = "sans 8"

theme.bg_normal     = "#3f3f3f"
theme.bg_focus      = "#1e2320"
theme.bg_urgent     = "#75507b"
theme.bg_minimize   = "#444444"

theme.fg_normal     = "#dcdccc"
theme.fg_focus      = "#f0dfaf"
theme.fg_urgent     = "#cc9393"
theme.fg_minimize   = "#ffffff"

theme.border_width  = "2"
theme.border_normal = "#2e3735"
theme.border_focus  = "#afc81c"
theme.border_marked = "#91231c"

theme_icons = awful.util.getdir("config") .. "/icons/"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
--theme.tasklist_floating_icon =
theme.taglist_squares_sel   = theme_icons .. "taglist/square_sel.png"
theme.taglist_squares_unsel = theme_icons .. "taglist/square_unsel.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
--theme.menu_submenu_icon =
theme.menu_height = "15"
theme.menu_width  = "100"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_focus  = theme_icons .. "titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme_icons .. "titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active    = theme_icons .. "titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active   = theme_icons .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = theme_icons .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme_icons .. "titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active    = theme_icons .. "titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active   = theme_icons .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = theme_icons .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme_icons .. "titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active    = theme_icons .. "titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active   = theme_icons .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = theme_icons .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme_icons .. "titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active    = theme_icons .. "titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme_icons .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme_icons .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme_icons .. "titlebar/maximized_normal_inactive.png"

-- You can use your own command to set your wallpaper
theme.wallpaper_cmd = { "awsetbg" .. " " .. os.getenv("HOME") .. "/.Wallpaper" }

-- You can use your own layout theme_icons like this:
theme.layout_tile       = theme_icons .. "layouts/tile.png"
theme.layout_tileleft   = theme_icons .. "layouts/tileleft.png"
theme.layout_tilebottom = theme_icons .. "layouts/tilebottom.png"
theme.layout_tiletop    = theme_icons .. "layouts/tiletop.png"
theme.layout_fairv      = theme_icons .. "layouts/fairv.png"
theme.layout_fairh      = theme_icons .. "layouts/fairh.png"
theme.layout_spiral     = theme_icons .. "layouts/spiral.png"
theme.layout_dwindle    = theme_icons .. "layouts/dwindle.png"
theme.layout_max        = theme_icons .. "layouts/max.png"
theme.layout_fullscreen = theme_icons .. "layouts/fullscreen.png"
theme.layout_magnifier  = theme_icons .. "layouts/magnifier.png"
theme.layout_floating   = theme_icons .. "layouts/floating.png"

theme.awesome_icon = theme_icons .. "awesome.png"

return theme
