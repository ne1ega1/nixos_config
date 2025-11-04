{
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      dns = [
        "172.17.0.1"
        "8.8.8.8"
      ];
    };
  };
}
