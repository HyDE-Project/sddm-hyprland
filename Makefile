# Define the PREFIX variable
PREFIX ?= /usr
SRC=src

# Default target
all: clean install

prepare:
	mkdir -p $(PREFIX)/share/hypr/sddm
	mkdir -p /etc/sddm.conf.d/

install: clean prepare
	@install -D $(SRC)/hyprland.conf $(PREFIX)/share/hypr/sddm/hyprland.conf && echo "[Installed] $(PREFIX)/share/hypr/sddm/hyprland.conf" 
	@install -D $(SRC)/sddm-hyprland.conf /etc/sddm.conf.d/sddm-hyprland.conf && echo "[Installed] /etc/sddm.conf.d/sddm-hyprland.conf"
	@sed -i 's|CompositorCommand=.*|CompositorCommand=start-hyprland -- -c $(PREFIX)/share/hypr/sddm/hyprland.conf|' /etc/sddm.conf.d/sddm-hyprland.conf &&	echo "[default sddm conf] $(PREFIX)/share/hypr/sddm/hyprland.conf" 


clean:
	@rm -rf $(PREFIX)/share/hypr/sddm && echo "[cleaned] $(PREFIX)/share/hypr/sddm"
	@rm -rf $(PREFIX)/share/hyde/sddm && echo "[cleaned] $(PREFIX)/share/hyde/sddm"
	@rm -rf /etc/sddm.conf.d/sddm-hyprland.conf	&& echo "[cleaned] /etc/sddm.conf.d/sddm-hyprland.conf"

.PHONY: all install prepare
