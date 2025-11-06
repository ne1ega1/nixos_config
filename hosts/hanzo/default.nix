{ pkgs, ... }:

{
  boot = {
    plymouth.enable = true;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  hardware = {
    i2c.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };
  };

  services = {
    pcscd.enable = true;
    blueman.enable = true;
    udisks2.enable = true;
    resolved.enable = true;
    noctalia-shell.enable = true;
    getty.autologinUser = "hanzo";
    printing = {
      enable = true;
      drivers = [
        pkgs.brlaser
        pkgs.cups-brother-hll2340dw
      ];
    };
  };

  networking = {
    hostName = "hanzo";
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
  };
}
