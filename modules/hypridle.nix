{ osConfig, ... }:

{
	services.hypridle = {
		enable = true;
		settings = if
            (
            osConfig.networking.hostName == "hanzo-thinkpad"
            )
        then {
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
        }
        else {
            general = {
                before_sleep_cmd = "hyprctl dispatch dpms off";
                after_sleep_cmd = "hyprctl dispatch dpms on";
            };
            listener =             [
                {
                    timeout = 600;
                    on-timeout = "hyprctl hyprsunset gamma 1";
                    on-resume = "hyprctl hyprsunset gamma 100";
                }
                {
                    timeout = 3600;
                    on-timeout = "hyprctl dispatch dpms off";
                    on-resume = "hyprctl dispatch dpms on";
                }
            ];
        };
	};
}
