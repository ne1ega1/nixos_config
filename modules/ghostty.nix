{
    programs.ghostty = {
        enable = true;
        settings = {
            font-size = 11;
            class = "ghostty";
            gtk-titlebar = false;
            cursor-style = "block";
            cursor-text = "1F2130";
            window-decoration = true;
            shell-integration = "fish";
            background-opacity = 0.85;
            cursor-style-blink = false;
            background-blur-radius = 20;
            window-padding-balance = true;
            confirm-close-surface = false;
            font-family = "Hack Nerd Font";
            theme = "catppuccin-macchiato";
            mouse-hide-while-typing = true;
            shell-integration-features = "no-cursor";
            # custom-shader = /home/jumanji/.config/ghostty/ghostty-shaders/gears-and-belts.glsl
            keybind = [
                "super+space=ignore"
                "ctrl+shift+r=reload_config"
                "ctrl+i=inspector:toggle"
                "ctrl+space=ignore"
                "ctrl+b>c=new_tab"
                "ctrl+b>n=new_window"
                "ctrl+b>1=goto_tab:1"
                "ctrl+b>2=goto_tab:2"
                "ctrl+b>3=goto_tab:3"
                "ctrl+b>4=goto_tab:4"
                "ctrl+b>5=goto_tab:5"
                "ctrl+b>6=goto_tab:6"
                "ctrl+b>7=goto_tab:7"
                "ctrl+b>8=goto_tab:8"
                "ctrl+b>9=goto_tab:9"
                "ctrl+b>\=new_split:right"
                "ctrl+b>-=new_split:down"
                "ctrl+b>e=equalize_splits"
                "ctrl+b>h=goto_split:left"
                "ctrl+b>j=goto_split:bottom"
                "ctrl+b>k=goto_split:top"
                "ctrl+b>l=goto_split:right"
            ];
        };
    };
}
