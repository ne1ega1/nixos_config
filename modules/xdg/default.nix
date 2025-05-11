{ pkgs, lib, ... }:

{
    xdg = {
        mimeApps = {
            enable = true;
        }
        // import ./mimeapps.nix {
            inherit lib;
        };
        portal = {
            enable = true;
            xdgOpenUsePortal = true;
            extraPortals = with pkgs; [
                xdg-desktop-portal-gtk
                xdg-desktop-portal-hyprland
            ];
            config = {
                common = {
                    default = [
                        "gtk"
                    ];
                };
            };
        };
    };
}
