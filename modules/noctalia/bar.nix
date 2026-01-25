{ osConfig, ... }:

{
  bar = {
    monitors = [ ];
    floating = true;
    exclusive = true;
    showCapsule = false;
    outerCorners = false;
    marginVertical = 0.25;
    density = "comfortable";
    marginHorizontal = 0.25;
    position = if (osConfig.networking.hostName == "hanzo") then "left" else "top";
    widgets = {
      center =
        if (osConfig.networking.hostName == "hanzo") then
          [
            {
              id = "Clock";
              formatHorizontal = "HH:mm ddd; MMM dd";
              formatVertical = "HH mm - dd ddd";
              customFont = "CaskaydiaCove NF";
              usePrimaryColor = true;
              useCustomFont = true;
            }
          ]
        else
          [
            {
              id = "Clock";
              formatHorizontal = "HH:mm ddd | dd MMMM";
              formatVertical = "HH mm - dd ddd";
              customFont = "CaskaydiaCove NF";
              usePrimaryColor = true;
              useCustomFont = true;
            }
          ];
      left = [
        {
          id = "ControlCenter";
          colorizeSystemIcon = "none";
          enableColorization = false;
          colorizeDistroLogo = true;
          useDistroLogo = true;
          customIconPath = "";
          icon = "";
        }
        {
          id = "Workspace";
          followFocusedScreen = true;
          hideUnoccupied = false;
          labelMode = "none";
          characterCount = 2;
        }
        {
          id = "MediaMini";
          visualizerType = "wave";
          scrollingMode = "hover";
          showProgressRing = true;
          showArtistFirst = true;
          useFixedWidth = false;
          showVisualizer = true;
          hideWhenIdle = false;
          hideMode = "hidden";
          showAlbumArt = true;
          maxWidth = 145;
        }
      ];
      right = [
        {
          id = "Bluetooth";
          displayMode = "onhover";
        }
        {
          id = "Brightness";
          displayMode = "onhover";
        }
        {
          id = "Volume";
          displayMode = "alwaysHide";
        }
        {
          id = "NotificationHistory";
          showUnreadBadge = true;
          hideWhenZero = true;
        }
        {
          id = "VPN";
          displayMode = "onhover";
        }
        {
          id = "Tray";
          colorizeIcons = false;
          drawerEnabled = true;
          blacklist = [ ];
          pinned = [ ];
        }
      ]
      ++ (
        if osConfig.networking.hostName != "hanzo" then
          [
            {
              id = "battery";
            }
          ]
        else
          [ ]
      );
    };
  };
}
