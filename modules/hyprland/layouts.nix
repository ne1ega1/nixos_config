{ osConfig, ... }:

{
  device = {
    name = "logitech-usb-receiver-mouse";
    sensitivity = 0;
  };
  # dwindle = {
  #   pseudotile = true;
  #   force_split = 2;
  #   preserve_split = true;
  #   smart_split = false;
  #   smart_resizing = true;
  #   permanent_direction_override = false;
  #   special_scale_factor = 1;
  #   split_width_multiplier = 1.0;
  #   use_active_for_splits = true;
  #   default_split_ratio = 1.0;
  # };
  plugin = {
    hyprscrolling = {
      column_width = 0.5;
      follow_focus = true;
      focus_fit_method = 0;
      fullscreen_on_one_column = if (osConfig.networking.hostName == "hanzo") then false else true;
    };
  };
}
