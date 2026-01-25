{ pkgs, config, ... }:

let
  theme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
  inputImage = ./wallpapers/aishot-3969.jpg;
  # tintedWallpaper =
  #   pkgs.runCommand "tinted-wallpaper.png"
  #     {
  #       buildInputs = [ pkgs.imagemagick ];
  #     }
  #     ''
  #       magick ${inputImage} \
  #       -fill "#${config.lib.stylix.colors.base00}" \
  #       -colorize 45% \
  #       $out
  #     '';
in
{
  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = theme;
    image = inputImage;
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
