# sddm-hyprland

- SDDM layer-shell on Hyprland Compositor
- HyDE's sddm wayland configuration

# Dependencies

- [Hyprland](https://github.com/hyprwm/Hyprland/)
- [SDDM](https://wiki.archlinux.org/title/SDDM)

You also need to have [layer-shell-qt5](https://archlinux.org/packages/extra/x86_64/layer-shell-qt5/) installed.

- https://wiki.archlinux.org/title/SDDM#Wayland

Soon this might change but for now this will fix the black screen issue.

# Installation

Base installation guide for sddm-hyprland.
This should work on any distro that provides sddm and hyprland.

### Manual (makefile)

```bash
    git clone https://github.com/HyDE-Project/sddm-hyprland
    cd sddm-hyprland
    sudo make install
```

### Archlinux (AUR)

<!--
    ```bash
    yay -S sddm-hyprland
    ``` -->

> Not available yet

# Configuration

sddm-hyprland tries to source these configuration files:

> It is on the user to create these file/s and directory and be organized.

```bash
${prefix}/share/hyde/sddm/hyprprefs.conf
/etc/sddm.conf.d/sddm-hyprland.conf
```

> [!Note]
> Default ${prefix} is `/usr`

### Keyboard layouts

[Configuring keyboard layouts in hyprland ](https://wiki.hyprland.org/Configuring/Keyboard/)

```hyprlang
input{
    kb_layout = us,ed,de
}
```

To change a layout use, press **SUPER + K**, this will trigger the keyboard layout switcher script.

### Monitors

https://wiki.hyprland.org/Configuring/Monitors/

By default, this configuration will use all available monitors.
You can override this by disabling the monitor.
You can also solve some scaling issue specific to your monitor.

### Cursor

<!-- ##### Without HyDE -->

Due to some sort of [bug](https://forum.garudalinux.org/t/sddm-does-not-use-the-set-cursor/37680/6), the cursors cannot be set naturally by the compositor.
Therefore we have to set it manually.
sddm-hyprland added the [sddm-user.conf](src/sddm-user.conf) to set the cursor.
To avoid issues, we encorage you to add it manually.

Inside `/etc/sddm.conf.d/sddm-user.conf` add the following:

```sddm
[Theme]
CursorTheme=Bibata-Modern-Ice
CursorSize=24
```

> [!Note]
> Some changes happenned and I don't this is is working properly.

<!--

##### With HyDE

When you have HyDE installed, you can set the cursor theme and size in the `hyde.conf` file.

example:

```bash
SDDM_CURSOR_THEME="Bibata-Modern-Ice"
SDDM_CURSOR_SIZE=24
```

or you can also dynamically set it together with the `Hyde sddm set/select` commands.

```bash
export SDDM_CURSOR_THEME=Bibata-Modern-Ember
export SDDM_CURSOR_SIZE=30
 Hyde sddm select "Candy"
```
-->

# TODO

- [x] Separate sddm-hyprland and hyde configuration
- [ ] Package manager support (AUR)
- [ ] nix support

# Support

- Reporting relevant issues are appreciated
- Bug fixes are welcome
- We could talk about feature requests

  [![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/A0A3TECUZ)
