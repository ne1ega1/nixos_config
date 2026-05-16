{ pkgs, ... }:

{
  users = {
    users.hanzo = {
      packages = with pkgs; [ gnupg ];
      description = "hanZo";
      isNormalUser = true;
      shell = pkgs.fish;
      extraGroups = [
        "networkmanager"
        "adbusers"
        "storage"
        "docker"
        "render"
        "wheel"
        "audio"
        "video"
        "uucp"
        "i2c"
      ];
    };
    users.minidlna = {
      extraGroups = [ "users" ];
    };
  };
}
