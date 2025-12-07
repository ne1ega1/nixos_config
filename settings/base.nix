{ pkgs, lib, ... }:

{
  fonts.packages = [ ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  nixpkgs.config.allowUnfree = true;
  time.timeZone = "Europe/Moscow";
  system.stateVersion = "25.05";
}
