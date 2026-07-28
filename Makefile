# Define the PREFIX variable
PREFIX ?= /usr
DESTDIR ?=
SRC=src

# Default target
all: clean install

prepare:
	mkdir -p $(DESTDIR)$(PREFIX)/share/hypr/sddm
	mkdir -p $(DESTDIR)/etc/sddm.conf.d/

install: clean prepare
	@install -D $(SRC)/hyprland.lua $(DESTDIR)$(PREFIX)/share/hypr/sddm/hyprland.lua && echo "[Installed] $(DESTDIR)$(PREFIX)/share/hypr/sddm/hyprland.lua"
	@install -D $(SRC)/hyprprefs.lua $(DESTDIR)$(PREFIX)/share/hypr/sddm/hyprprefs.lua && echo "[Installed] $(DESTDIR)$(PREFIX)/share/hypr/sddm/hyprprefs.lua"
	@install -D $(SRC)/sddm-hyprland.conf $(DESTDIR)/etc/sddm.conf.d/sddm-hyprland.conf && echo "[Installed] $(DESTDIR)/etc/sddm.conf.d/sddm-hyprland.conf"
	@install -D $(SRC)/sddm-user.conf $(DESTDIR)/etc/sddm.conf.d/sddm-user.conf && echo "[Installed] $(DESTDIR)/etc/sddm.conf.d/sddm-user.conf"
	@sed -i 's|CompositorCommand=.*|CompositorCommand=start-hyprland -- -c $(PREFIX)/share/hypr/sddm/hyprland.lua|' $(DESTDIR)/etc/sddm.conf.d/sddm-hyprland.conf &&	echo "[default hyprland.lua config] $(PREFIX)/share/hypr/sddm/hyprland.lua" 

clean:
	@rm -rf $(DESTDIR)$(PREFIX)/share/hypr/sddm && echo "[cleaned] $(DESTDIR)$(PREFIX)/share/hypr/sddm"
	@rm -rf $(DESTDIR)$(PREFIX)/share/hyde/sddm && echo "[cleaned] $(DESTDIR)$(PREFIX)/share/hyde/sddm"
	@rm -rf $(DESTDIR)/etc/sddm.conf.d/sddm-hyprland.conf && echo "[cleaned] $(DESTDIR)/etc/sddm.conf.d/sddm-hyprland.conf"
	@rm -rf $(DESTDIR)/etc/sddm.conf.d/sddm-user.conf && echo "[cleaned] $(DESTDIR)/etc/sddm.conf.d/sddm-user.conf"  

.PHONY: all install prepare clean