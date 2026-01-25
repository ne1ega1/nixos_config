{
  input = {
    kb_layout = "us, ru";
    kb_options = "grp:caps_toggle,grp:lalt_lshift_toggle,grp:win_space_toggle";
    follow_mouse = 1;
    accel_profile = "flat";
    mouse_refocus = false;
    touchpad = {
      natural_scroll = true;
      disable_while_typing = true;
      tap-and-drag = true;
    };
  };
  device = [
    {
      name = "wl-wlmouse-sword-x-8k-receiver-1";
      sensitivity = -0.97;
    }
    {
      name = "wl-wlmouse-1k-receiver";
      sensitivity = -0.97;
    }
    {
      name = "wl-wlmouse-sword-x";
      sensitivity = -0.97;
    }
  ];
}
