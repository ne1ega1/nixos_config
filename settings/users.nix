{ pkgs, ... }:

{
  users.users.hanzo = {
    isNormalUser = true;
    description = "hanZo";
    extraGroups = [
      "networkmanager"
      "adbusers"
      "storage"
      "docker"
      "wheel"
      "audio"
      "i2c"
    ];
    shell = pkgs.fish;
    packages = with pkgs; [ pkgs.gnupg ];
  };
}
