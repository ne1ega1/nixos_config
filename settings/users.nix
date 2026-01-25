{ pkgs, ... }:

{
  users = {
    users.hanzo = {
      packages = with pkgs; [ pkgs.gnupg ];
      description = "hanZo";
      isNormalUser = true;
      shell = pkgs.fish;
      extraGroups = [
        "networkmanager"
        "adbusers"
        "storage"
        "docker"
        "wheel"
        "audio"
        "uucp"
        "i2c"
      ];
    };
    users.minidlna = {
      extraGroups = [ "users" ];
    };
  };
}
