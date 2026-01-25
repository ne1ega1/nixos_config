{ osConfig, ... }:

{
  monitor =
    if (osConfig.networking.hostName == "hanzo") then
      [
        "DP-3,5120x1440@144,auto,1"
      ]
    else
      [
        "HDMI-A-1,3840x2160@60,auto,1"
        "eDP-1,1920x1080@60,auto-right,1"
      ];
}
