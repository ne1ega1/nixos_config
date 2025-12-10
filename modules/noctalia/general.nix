{ config, ... }:

{
  general = {
    scaleRatio = 1;
    language = "ru";
    iRadiusRatio = 1;
    shadowOffsetX = 2;
    shadowOffsetY = 3;
    radiusRatio = 0.6;
    boxRadiusRatio = 1;
    dimmerOpacity = 0.6;
    animationSpeed = 1.1;
    screenRadiusRatio = 1;
    lockOnSuspend = false;
    enableShadows = false;
    compactLockScreen = false;
    showScreenCorners = false;
    animationDisabled = false;
    forceBlackScreenCorners = false;
    shadowDirection = "bottom_right";
    showHibernateOnLockScreen = false;
    allowPanelsOnScreenWithoutBar = true;
    showSessionButtonsOnLockScreen = true;
    avatarImage = "${config.home.homeDirectory}/Pictures/QVlmnnUjLs4.jpg";
  };
}
