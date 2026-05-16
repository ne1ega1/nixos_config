{ pkgs, ... }:

{
  programs = with pkgs; {
    fish.enable = true;
    ssh.startAgent = false;
    gamemode.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    throne = {
      enable = true;
      tunMode = {
        enable = true;
        setuid = true;
      };
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      gamescopeSession.enable = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    evolution = {
      enable = true;
      plugins = [ evolution-ews ];
    };
  };
}
