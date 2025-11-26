{ pkgs, ... }:

{
  users = {
    groups.wireshark = { };
    users.hanzo = {
      packages = with pkgs; [ pkgs.gnupg ];
      description = "hanZo";
      isNormalUser = true;
      shell = pkgs.fish;
      extraGroups = [
        "networkmanager"
        "wireshark"
        "adbusers"
        "storage"
        "docker"
        "wheel"
        "audio"
        "i2c"
      ];
    };
  };
}
