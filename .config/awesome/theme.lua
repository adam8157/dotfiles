---------------------------
------ awesome theme ------
---------------------------

theme = {}

theme.font          = "sans 10"

theme.bg_normal     = "#3f3f3f"
theme.bg_focus      = "#1e2320"
theme.bg_urgent     = "#75507b"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#dcdccc"
theme.fg_focus      = "#f0dfaf"
theme.fg_urgent     = "#cc9393"
theme.fg_minimize   = "#ffffff"

theme.border_width  = "1"
theme.border_normal = "#2e3735"
theme.border_focus  = "#afc81c"
theme.border_marked = "#91231c"

theme_icons_dir = awful.util.getdir("config") .. "/icons/"

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
theme.taglist_squares_sel   = theme_icons_dir .. "taglist/square_sel.png"
theme.taglist_squares_unsel = theme_icons_dir .. "taglist/square_unsel.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
--theme.menu_submenu_icon =
theme.menu_height = "15"
theme.menu_width  = "115"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_focus  = theme_icons_dir .. "titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme_icons_dir .. "titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active    = theme_icons_dir .. "titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active   = theme_icons_dir .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = theme_icons_dir .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme_icons_dir .. "titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active    = theme_icons_dir .. "titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active   = theme_icons_dir .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = theme_icons_dir .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme_icons_dir .. "titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active    = theme_icons_dir .. "titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active   = theme_icons_dir .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = theme_icons_dir .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme_icons_dir .. "titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active    = theme_icons_dir .. "titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme_icons_dir .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme_icons_dir .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme_icons_dir .. "titlebar/maximized_normal_inactive.png"

theme.wallpaper = os.getenv("HOME") .. "/.wallpaper"

-- You can use your own layout icons like this:
theme.layout_tile       = theme_icons_dir .. "layouts/tile.png"
theme.layout_tileleft   = theme_icons_dir .. "layouts/tileleft.png"
theme.layout_tilebottom = theme_icons_dir .. "layouts/tilebottom.png"
theme.layout_tiletop    = theme_icons_dir .. "layouts/tiletop.png"
theme.layout_fairv      = theme_icons_dir .. "layouts/fairv.png"
theme.layout_fairh      = theme_icons_dir .. "layouts/fairh.png"
theme.layout_spiral     = theme_icons_dir .. "layouts/spiral.png"
theme.layout_dwindle    = theme_icons_dir .. "layouts/dwindle.png"
theme.layout_max        = theme_icons_dir .. "layouts/max.png"
theme.layout_fullscreen = theme_icons_dir .. "layouts/fullscreen.png"
theme.layout_magnifier  = theme_icons_dir .. "layouts/magnifier.png"
theme.layout_floating   = theme_icons_dir .. "layouts/floating.png"

theme.awesome_icon = theme_icons_dir .. "awesome.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
