{
    programs.yazi.keymap = {
        input.prepend_keymap = [
            {
                on = "escape";
                run = "close";
                desc = "cancel input";
            }
        ];
        manager.prepend_keymap = [
            {
                on = "<C-y>";
                run = ["plugin wl-clipboard"];
            }
            {
                on = "E";
                run = "plugin eza-preview";
                desc = "Toggle tree/list dir preview";
            }
            {
                on = [ "c" "a" ];
                run = "plugin compress";
                desc = "Archive selected files";
            }
            {
                on = "M";
                run = "plugin mount";
                desc = "Mount devices";
            }
            {
                on = "F";
                run = "plugin smart-filter";
                desc = "Smart filter";
            }
            {
                on = [ "c" "m" ];
                run = "plugin chmod";
                desc = "Chmod on selected files";
            }
            {
                on = [ "R" "p" "p" ];
                run = "plugin sudo -- paste";
                desc = "sudo paste";
            }
            {
                on = [ "R" "P" ];
                run = "plugin sudo -- paste --force";
                desc = "sudo paste";
            }
            {
                on = [ "R" "r" ];
                run = "plugin sudo -- rename";
                desc = "sudo rename";
            }
            {
                on = [ "R" "p" "l" ];
                run = "plugin sudo -- link";
                desc = "sudo link";
            }
            {
                on = [ "R" "p" "r" ];
                run = "plugin sudo -- link --relative";
                desc = "sudo link relative path";
            }
            {
                on = [ "R" "p" "L" ];
                run = "plugin sudo -- hardlink";
                desc = "sudo hardlink";
            }
            {
                on = [ "R" "a" ];
                run = "plugin sudo -- create";
                desc = "sudo create";
            }
            {
                on = [ "R" "d" ];
                run = "plugin sudo -- remove";
                desc = "sudo trash";
            }
            {
                on = "<C-s>";
                run  = "plugin what-size";
                desc = "Calc size of selection or cwd";
            }
            {
                on = "<C-d>";
                run = "plugin diff";
                desc = "Diff the selected with the hovered file";
            }
            {
                on = "<C-n>";
                run = ''shell 'dragon-drop -x -i -T "$1"' --confirm'';
                desc = "Drag-n-drop";
            }
            {
                on = "<C-p>";
                run = ''shell "kdeconnect-cli -d fc2c2049_dfc5_48de_8bad_df0d64a2a99a --share '$@'"'';
                desc = "Send to Pixel 7";
            }
        ];
    };
}
