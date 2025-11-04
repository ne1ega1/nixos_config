{ pkgs, ... }:

{
  imports = [
    ../modules/nvf
    ../modules/stylix
    ../settings/nix.nix
    ../settings/i18n.nix
    ../settings/base.nix
    ../settings/users.nix
    ../settings/firewall.nix
    ../settings/programs.nix
    ./hardware-configuration.nix
    ../settings/virtualisation.nix
    ../settings/system_packages.nix
  ];

  boot = {
    initrd.kernelModules = [ "nvidia" "i915" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
    kernelParams = [ "nvidia-drm.fbdev=1" ];
    plymouth.enable = true;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  hardware = {
    i2c.enable = true;
    graphics.enable = true;
    nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        nvidiaSettings = true;
        open = false;
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
    xserver.videoDrivers = ["nvidia"];
    printing = {
      enable = true;
      drivers = [
        pkgs.brlaser
        pkgs.cups-brother-hll2340dw
      ];
    };
  };

  networking = {
    hostName = "hanzo-thinkpad";
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
  };
}
