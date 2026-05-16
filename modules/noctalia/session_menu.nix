{
  sessionMenu = {
    showHeader = true;
    position = "center";
    enableCountdown = true;
    showNumberLabels = true;
    largeButtonsStyle = true;
    countdownDuration = 10000;
    largeButtonsLayout = "single-row";
    powerOptions = [
      {
        enabled = true;
        action = "lock";
        countdownEnabled = true;
      }
      {
        enabled = true;
        action = "suspend";
        countdownEnabled = true;
      }
      {
        enabled = true;
        action = "hibernate";
        countdownEnabled = true;
      }
      {
        enabled = true;
        action = "reboot";
        countdownEnabled = true;
      }
      {
        enabled = true;
        action = "logout";
        countdownEnabled = true;
      }
      {
        enabled = true;
        action = "shutdown";
        countdownEnabled = true;
      }
    ];
  };
}
