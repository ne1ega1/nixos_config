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
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber = {
        enable = true;
        extraConfig."51-yandex-station" = {
          "wireplumber.settings" = {
            "bluetooth.autoswitch-to-headset-profile" = false;
          };
          "monitor.bluez.rules" = [
            {
              matches = [{ "device.name" = "bluez_card.3C_0B_4F_3F_EE_B9"; }];
              actions = {
                "update-props" = {
                  "bluez5.auto-connect" = [ "a2dp_sink" ];
                  "bluez5.profile" = "a2dp-sink";
                  "device.profile" = "a2dp-sink";
                };
              };
            }
          ];
        };
      };
    };
    getty.autologinUser = "hanzo";
    gnome.evolution-data-server.enable = true;
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

  security.rtkit.enable = true;

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
