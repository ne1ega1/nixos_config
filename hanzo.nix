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
    getty.autologinUser = "hanzo";
    printing = {
      enable = true;
      drivers = [
        pkgs.brlaser
        pkgs.cups-brother-hll2340dw
      ];
    };
    udev.extraRules = ''
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="36a7", ATTRS{idProduct}=="a882", MODE="0777", GROUP="uucp", TAG+="uaccess"
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="0c45", ATTRS{idProduct}=="8044", MODE="0777", GROUP="uucp", TAG+="uaccess"
    '';
    minidlna = {
      enable = true;
      settings = {
        network_interface = "enp13s0";
        friendly_name = "NixOS Media Server";
        media_dir = [
          "V,/media/videos"
          "A,/media/music"
        ];
        notify_interval = 60;
        inotify = "yes";
      };
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
