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
    position = "left";
    widgets = {
      center = [
        {
          id = "Clock";
          formatHorizontal = "HH:mm ddd; MMM dd";
          formatVertical = "HH mm - dd ddd";
          customFont = "CaskaydiaCove NF";
          usePrimaryColor = true;
          useCustomFont = true;
        }
        {
            id = "plugin:weather-indicator";
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
          followFocusedScreen = false;
          showApplications = true;
          hideUnoccupied = false;
          labelMode = "none";
          characterCount = 2;
          iconScale = 0.8;
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
        {
            id = "plugin:workspace-overview";
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
            id = "plugin:kde-connect";
        }
        {
            id = "plugin:usb-drive-manager";
        }
        {
            id = "plugin:clipper";
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
            id = "plugin:mini-docker";
        }
        {
          id = "Tray";
          colorizeIcons = false;
          drawerEnabled = true;
          blacklist = [ ];
          pinned = [ ];
        }
      ];
    };
  };
}
