local cursorTheme = "Bibata-Modern-Ice"
local cursorSize = "24"

hl.config({
    cursor = {
        no_warps = true,
        no_hardware_cursors = 1,
    },
    ecosystem = {
        enforce_permissions = false,
        no_update_news = true,
        no_donation_nag = true,
    },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        disable_watchdog_warning = true,
        force_default_wallpaper = 0,
        initial_workspace_tracking = 1,
    },
    input = {
        kb_layout = "us",
        numlock_by_default = true,
    },
})

-- This rule only apply when using xdg-shell https://wiki.archlinux.org/title/SDDM#Wayland
hl.window_rule({
    workspace = "emptym",
    fullscreen = true,
    stay_focused = true,
    decorate = false,
    no_anim = true,
    no_dim = true,
    no_shadow = true,
    match = {
        class = "sddm-greeter"
    }
})

-- source a file relative to the current configuration file
pcall(dofile, "./hyprprefs.lua") -- Manually create and edit this file
-- source from a sddm.conf.d directory
pcall(dofile, "/etc/sddm.conf.d/hypr/hyprland.lua") -- # Manually create and edit this file

-- ! Known issue: The cursor theme and size are not working
hl.on("hyprland.start", function ()
    hl.dsp.exec_cmd("hyprctl setcursor " .. cursorTheme .. " " .. cursorSize)
end)
hl.env("HYPRCURSOR_THEME", cursorTheme)
hl.env("HYPRCURSOR_SIZE", cursorSize)

-- KB Layout switcher
local cmdSwitch = "hyprctl switchxkblayout all next -q"
local cmdCheck = "$(hyprctl -j devices | jq '.keyboards' | jq '.[] | select (.main == true)' | awk -F '\"' '{if ($2==\"active_keymap\") print $4}')"
local cmdNotify = "hyprctl notify \"1 9000 rgba(1,1,1,1)  Keyboard: " .. cmdCheck .. "\""

hl.bind("SUPER + K", function()
    hl.dsp.exec_cmd(cmdSwitch)
    hl.dsp.exec_cmd(cmdNotify)
end)
