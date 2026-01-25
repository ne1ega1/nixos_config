{ osConfig, ... }:

{
  workspace =
    if (osConfig.networking.hostName == "hanzo") then
      map (x: "${x}, monitor:DP-3, persistent:true") [
        "1"
        "2"
        "3"
        "4"
        "5"
      ]
    else
      [
        "1, monitor:HDMI-A-1, persistent:true, default:true"
        "2, monitor:HDMI-A-1, persistent:true"
        "3, monitor:HDMI-A-1, persistent:true"
        "4, monitor:eDP-1, persistent:true"
        "5, monitor:eDP-1, persistent:true"
        "6, monitor:eDP-1, persistent:true"
        "7, monitor:eDP-1, persistent:true"
        "8, monitor:eDP-1, persistent:true"
        "9, monitor:eDP-1, persistent:true"
        "10, monitor:eDP-1, persistent:true"
      ];
}
