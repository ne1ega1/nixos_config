{
  programs.nixcord = {
    enable = true;
    dorion.enable = true;
    vesktop.enable = true;
    quickCss = "some CSS";
    config = {
      frameless = true;
      useQuickCss = true;
      plugins = {
        ignoreActivities = {
          enable = true;
          ignorePlaying = true;
          ignoreWatching = true;
        };
      };
      themeLinks = [
        "https://raw.githubusercontent.com/link/to/some/theme.css"
      ];
    };
    dorion = {
      zoom = "1.1";
      theme = "dark";
      sysTray = true;
      blur = "acrylic";
      rpcServer = true;
      pushToTalk = true;
      openOnStartup = true;
      autoClearCache = true;
      rpcProcessScanner = true;
      disableHardwareAccel = false;
      pushToTalkKeys = ["RControl"];
      desktopNotifications = true;
      unreadBadge = true;
    };
    extraConfig = { };
  };
}
