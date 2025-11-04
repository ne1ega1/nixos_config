{ pkgs, lib, ... }:

{
  fonts.packages =
    [ ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  time.timeZone = "Europe/Moscow";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
}
