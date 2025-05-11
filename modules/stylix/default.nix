{ pkgs, config, ... }:

{
    stylix = {
        enable = true;
        polarity = "dark";
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
        image = ./wallpapers/nix-magenta-blue-1920x1080.png;
			# let color = "${config.lib.stylix.colors.base00}";
			# in import ./color.nix { inherit pkgs; col = "#${color}"; w = 1920; h = 1080; };
        fonts = rec {
            monospace = sansSerif;
            sizes = {
                terminal = 12;
            };
            serif = {
                name = "CaskaydiaCove Nerd Font";
                package = pkgs.nerd-fonts.caskaydia-cove;
            };
            sansSerif = {
                name = "CaskaydiaCove Nerd Font";
                package = pkgs.nerd-fonts.caskaydia-cove;
            };
            emoji = {
                name = "Noto Color Emoji";
                package = pkgs.noto-fonts-color-emoji;
            };
        };
        cursor = {
            size = 24;
            name = "catppuccin-macchiato-dark-cursors";
            package = pkgs.catppuccin-cursors.macchiatoDark;
        };
        opacity = {
            terminal = 1.0;
            applications = 1;
        };
    };
}
