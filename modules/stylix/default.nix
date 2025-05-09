{ pkgs, config, ... }:

{
    stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
        image = ./wallpapers/kace-rodriguez-p3OzJuT_Dks-unsplash.jpg;
			# let color = "${config.lib.stylix.colors.base00}";
			# in import ./color.nix { inherit pkgs; col = "#${color}"; w = 1920; h = 1080; };
        fonts = rec {
            monospace = sansSerif;
            sizes = {
                terminal = 12;
            };
            serif = {
                name = "DejaVu Serif";
                package = pkgs.dejavu_fonts;
            };
            sansSerif = {
                name = "JetBrainsMono NF";
                package = pkgs.nerd-fonts.jetbrains-mono;
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
