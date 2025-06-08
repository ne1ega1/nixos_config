{ pkgs, ... }:

{
	services.hypridle = {
		enable = true;
		settings = {
            general = {
                lock_cmd = "pidof hyprlock || hyprlock";
                after_sleep_cmd = "hyprctl dispatch dpms on";
            };
            listener = [
                {
                    timeout = 900;
                    on-timeout = "hyprlock";
                }
                {
                    timeout = 1800;
                    on-timeout = "hyprctl dispatch dpms off";
                    on-resume = "hyprctl dispatch dpms on";
                }
            ];
		};
	};
}
