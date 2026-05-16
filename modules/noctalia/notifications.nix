{
  notifications = {
    enabled = true;
    monitors = [ ];
    overlayLayer = true;
    location = "top_right";
    lowUrgencyDuration = 3;
    normalUrgencyDuration = 8;
    criticalUrgencyDuration = 15;
    respectExpireTimeout = false;
    enableKeyboardLayoutToast = false;
      sounds = {
      excludedApps = "discord,firefox,chrome,chromium,edge";
      criticalSoundFile = "";
      separateSounds = false;
      normalSoundFile = "";
      lowSoundFile = "";
      enabled = false;
      volume = 0.5;
    };
  };
}
