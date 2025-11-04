{ config, osConfig, ... }:

{
  programs.noctalia-shell = {
    enable = true;
    settings =
      if (osConfig.networking.hostName == "hanzo") then
        {
          appLauncher = {
            pinnedExecs = [ ];
            position = "center";
            useApp2Unit = false;
            sortByMostUsed = true;
            backgroundOpacity = 1;
            enableClipboardHistory = false;
            terminalCommand = "ghostty -e";
          };
          audio = {
            visualizerType = "wave";
            volumeOverdrive = false;
            preferredPlayer = "";
            mprisBlacklist = [ ];
            cavaFrameRate = 144;
            volumeStep = 5;
          };
          bar = {
            monitors = [ ];
            floating = true;
            position = "left";
            showCapsule = false;
            backgroundOpacity = 1;
            marginVertical = 0.25;
            density = "comfortable";
            marginHorizontal = 0.25;
            widgets = {
              center = [
                {
                  customFont = "CaskaydiaCove NF";
                  formatHorizontal = "HH:mm ddd; MMM dd";
                  formatVertical = "HH mm - dd ddd";
                  id = "Clock";
                  useCustomFont = true;
                  usePrimaryColor = true;
                }
              ];
              left = [
                {
                  customIconPath = "";
                  icon = "";
                  id = "ControlCenter";
                  useDistroLogo = true;
                }
                {
                  hideUnoccupied = false;
                  id = "Workspace";
                  labelMode = "none";
                }
                {
                  autoHide = true;
                  id = "MediaMini";
                  scrollingMode = "hover";
                  showAlbumArt = true;
                  showVisualizer = true;
                  visualizerType = "wave";
                }
              ];
              right = [
                {
                  id = "Bluetooth";
                }
                {
                  displayMode = "onhover";
                  id = "Brightness";
                }
                {
                  displayMode = "alwaysHide";
                  id = "Volume";
                }
                {
                  hideWhenZero = true;
                  id = "NotificationHistory";
                  showUnreadBadge = true;
                }
                {
                  blacklist = [ ];
                  id = "Tray";
                }
              ];
            };
          };
          brightness = {
            brightnessStep = 5;
          };
          colors = with config.lib.stylix.colors; {
            mBackground = base00;
            mSurface = base01;
            mOverlay = base02;
            mMuted = base03;
            mBorder = base04;
            mText = base05;
            mTextAlt = base06;
            mTextDim = base07;
            mError = base08;
            mWarning = base09;
            mAccent = base0A;
            mSuccess = base0B;
            mCyan = base0C;
            mPrimary = base0D;
            mMagenta = base0E;
            mOrange = base0F;
            mOnBackground = base05;
            mOnSurface = base05;
            mOnPrimary = base00;
            mOnError = base00;
          };
          colorSchemes = {
            darkMode = true;
            generateTemplatesForPredefined = true;
            matugenSchemeType = "scheme-fruit-salad";
            predefinedScheme = "Gruvbox";
            useWallpaperColors = false;
          };
          controlCenter = {
            position = "close_to_bar_button";
            quickSettingsStyle = "compact";
            widgets = {
              quickSettings = [
                {
                  id = "WiFi";
                }
                {
                  id = "Bluetooth";
                }
                {
                  id = "Notifications";
                }
                {
                  id = "ScreenRecorder";
                }
              ];
            };
          };
          dock = {
            enabled = false;
            backgroundOpacity = 1;
            displayMode = "always_hide";
            floatingRatio = 1;
            monitors = [ ];
            onlySameOutput = true;
            pinnedApps = [ ];
          };
          general = {
            animationDisabled = false;
            animationSpeed = 1.1;
            avatarImage = "${config.home.homeDirectory}/Pictures/QVlmnnUjLs4.jpg";
            dimDesktop = true;
            forceBlackScreenCorners = false;
            radiusRatio = 0.6;
            screenRadiusRatio = 1;
            showScreenCorners = false;
          };
          hooks = {
            darkModeChange = "";
            enabled = false;
            wallpaperChange = "";
          };
          location = {
            showWeekNumberInCalendar = false;
            use12hourFormat = false;
            useFahrenheit = false;
          };
          network = {
            wifiEnabled = false;
          };
          nightLight = {
            autoSchedule = true;
            dayTemp = "6500";
            enabled = false;
            forced = false;
            manualSunrise = "06:30";
            manualSunset = "18:30";
            nightTemp = "4000";
          };
          notifications = {
            alwaysOnTop = false;
            criticalUrgencyDuration = 15;
            doNotDisturb = false;
            lastSeenTs = 1760440172000;
            location = "top_right";
            lowUrgencyDuration = 3;
            monitors = [ ];
            normalUrgencyDuration = 8;
            respectExpireTimeout = false;
          };
          osd = {
            alwaysOnTop = false;
            autoHideMs = 2500;
            enabled = true;
            location = "top";
            monitors = [ ];
          };
          screenRecorder = {
            audioCodec = "opus";
            audioSource = "default_output";
            colorRange = "limited";
            directory = "";
            frameRate = 60;
            quality = "very_high";
            showCursor = true;
            videoCodec = "h264";
            videoSource = "portal";
          };
          settingsVersion = 15;
          templates = {
            discord = false;
            discord_armcord = false;
            discord_dorion = false;
            discord_equibop = false;
            discord_lightcord = false;
            discord_vesktop = false;
            discord_webcord = false;
            enableUserTemplates = false;
            foot = false;
            fuzzel = false;
            ghostty = false;
            gtk = false;
            kcolorscheme = false;
            kitty = false;
            pywalfox = false;
            qt = false;
          };
          ui = {
            fontDefault = "CaskaydiaCove NF";
            fontDefaultScale = 1.1600000000000001;
            fontFixed = "CaskaydiaMono NF";
            fontFixedScale = 1.1600000000000001;
            idleInhibitorEnabled = false;
            monitorsScaling = [ ];
            tooltipsEnabled = false;
          };
          wallpaper = {
            defaultWallpaper = "";
            directory = "";
            enableMultiMonitorDirectories = false;
            enabled = false;
            fillColor = "#000000";
            fillMode = "crop";
            monitors = [ ];
            randomEnabled = false;
            randomIntervalSec = 300;
            setWallpaperOnAllMonitors = true;
            transitionDuration = 1500;
            transitionEdgeSmoothness = 0.05;
            transitionType = "random";
          };
        }
        // import ../secrets/location.nix
      else
        {
          appLauncher = {
            pinnedExecs = [ ];
            position = "center";
            useApp2Unit = false;
            sortByMostUsed = true;
            backgroundOpacity = 1;
            enableClipboardHistory = false;
            terminalCommand = "ghostty -e";
          };
          audio = {
            visualizerType = "wave";
            volumeOverdrive = false;
            preferredPlayer = "";
            mprisBlacklist = [ ];
            cavaFrameRate = 144;
            volumeStep = 5;
          };
          bar = {
            monitors = [ ];
            floating = true;
            position = "top";
            showCapsule = false;
            backgroundOpacity = 1;
            marginVertical = 0.25;
            density = "default";
            marginHorizontal = 0.25;
            widgets = {
              center = [
                {
                  customFont = "CaskaydiaCove NF";
                  formatHorizontal = "HH:mm ddd | dd MMMM";
                  formatVertical = "HH mm - dd ddd";
                  id = "Clock";
                  useCustomFont = true;
                  usePrimaryColor = true;
                }
              ];
              left = [
                {
                  customIconPath = "";
                  icon = "";
                  id = "ControlCenter";
                  useDistroLogo = true;
                }
                {
                  hideUnoccupied = false;
                  id = "Workspace";
                  labelMode = "none";
                }
                {
                  autoHide = true;
                  id = "MediaMini";
                  scrollingMode = "hover";
                  showAlbumArt = true;
                  showVisualizer = true;
                  visualizerType = "wave";
                }
              ];
              right = [
                {
                  id = "Bluetooth";
                }
                {
                  displayMode = "onhover";
                  id = "Brightness";
                }
                {
                  displayMode = "alwaysHide";
                  id = "Volume";
                }
                {
                  id = "battery";
                }
                {
                  id = "KeyboardLayout";
                }
                {
                  hideWhenZero = true;
                  id = "NotificationHistory";
                  showUnreadBadge = true;
                }
                {
                  blacklist = [ ];
                  id = "Tray";
                }
              ];
            };
          };
          brightness = {
            brightnessStep = 5;
          };
          colors = with config.lib.stylix.colors; {
            mBackground = base00;
            mSurface = base01;
            mOverlay = base02;
            mMuted = base03;
            mBorder = base04;
            mText = base05;
            mTextAlt = base06;
            mTextDim = base07;
            mError = base08;
            mWarning = base09;
            mAccent = base0A;
            mSuccess = base0B;
            mCyan = base0C;
            mPrimary = base0D;
            mMagenta = base0E;
            mOrange = base0F;
            mOnBackground = base05;
            mOnSurface = base05;
            mOnPrimary = base00;
            mOnError = base00;
          };
          colorSchemes = {
            darkMode = true;
            generateTemplatesForPredefined = true;
            matugenSchemeType = "scheme-fruit-salad";
            predefinedScheme = "Gruvbox";
            useWallpaperColors = false;
          };
          controlCenter = {
            position = "close_to_bar_button";
            quickSettingsStyle = "compact";
            widgets = {
              quickSettings = [
                {
                  id = "WiFi";
                }
                {
                  id = "Bluetooth";
                }
                {
                  id = "ScreenRecorder";
                }
                {
                  id = "PowerProfile";
                }
              ];
            };
          };
          dock = {
            enabled = false;
            backgroundOpacity = 1;
            displayMode = "auto_hide";
            floatingRatio = 1;
            monitors = [ ];
            onlySameOutput = true;
            pinnedApps = [ ];
          };
          general = {
            animationDisabled = false;
            animationSpeed = 1.1;
            avatarImage = "${config.home.homeDirectory}/Pictures/QVlmnnUjLs4.jpg";
            dimDesktop = true;
            forceBlackScreenCorners = false;
            radiusRatio = 0.6;
            screenRadiusRatio = 1;
            showScreenCorners = false;
          };
          hooks = {
            darkModeChange = "";
            enabled = false;
            wallpaperChange = "";
          };
          location = {
            showWeekNumberInCalendar = false;
            use12hourFormat = false;
            useFahrenheit = false;
          };
          network = {
            wifiEnabled = false;
          };
          nightLight = {
            autoSchedule = true;
            dayTemp = "6500";
            enabled = false;
            forced = false;
            manualSunrise = "06:30";
            manualSunset = "18:30";
            nightTemp = "4000";
          };
          notifications = {
            alwaysOnTop = false;
            criticalUrgencyDuration = 15;
            doNotDisturb = false;
            lastSeenTs = 1760440172000;
            location = "top_right";
            lowUrgencyDuration = 3;
            monitors = [ ];
            normalUrgencyDuration = 8;
            respectExpireTimeout = false;
          };
          osd = {
            alwaysOnTop = false;
            autoHideMs = 2500;
            enabled = true;
            location = "right";
            monitors = [ ];
          };
          screenRecorder = {
            audioCodec = "opus";
            audioSource = "default_output";
            colorRange = "limited";
            directory = "";
            frameRate = 60;
            quality = "very_high";
            showCursor = true;
            videoCodec = "h264";
            videoSource = "portal";
          };
          settingsVersion = 15;
          templates = {
            discord = false;
            discord_armcord = false;
            discord_dorion = false;
            discord_equibop = false;
            discord_lightcord = false;
            discord_vesktop = false;
            discord_webcord = false;
            enableUserTemplates = false;
            foot = false;
            fuzzel = false;
            ghostty = false;
            gtk = false;
            kcolorscheme = false;
            kitty = false;
            pywalfox = false;
            qt = false;
          };
          ui = {
            fontDefault = "CaskaydiaCove NF";
            fontDefaultScale = 1.1600000000000001;
            fontFixed = "CaskaydiaMono NF";
            fontFixedScale = 1.1600000000000001;
            idleInhibitorEnabled = false;
            monitorsScaling = [ ];
            tooltipsEnabled = false;
          };
          wallpaper = {
            defaultWallpaper = "";
            directory = "";
            enableMultiMonitorDirectories = false;
            enabled = false;
            fillColor = "#000000";
            fillMode = "crop";
            monitors = [ ];
            randomEnabled = false;
            randomIntervalSec = 300;
            setWallpaperOnAllMonitors = true;
            transitionDuration = 1500;
            transitionEdgeSmoothness = 0.05;
            transitionType = "random";
          };
        }
        // import ../secrets/location.nix;
  };
}
