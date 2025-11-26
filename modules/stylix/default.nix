{ pkgs, config, ... }:

{
  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-soft.yaml";
    image = ./wallpapers/aishot-3433.jpg;
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
      size = 32;
      name = "material_light_cursors";
      package = pkgs.material-cursors;
    };
    opacity = {
      terminal = 1.0;
      applications = 1;
    };
  };
}
