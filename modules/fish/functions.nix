{
    programs.fish.functions = {
        fish_greeting = ''
            fastfetch
        '';
        __history_previous_command = ''
            switch (commandline -t)
            case "!"
                commandline -t $history[1]; commandline -f repaint
            case "*"
                commandline -i !
            end
        '';
        __history_previous_command_arguments = ''
            switch (commandline -t)
            case "!"
                commandline -t ""
                commandline -f history-token-search-backward
            case "*"
                commandline -i '$'
            end
        '';
        history = ''
            builtin history --show-time='%F %T '
        '';
        backup = ''
            cp $argv[1] $argv[1].bak
        '';
        copy = ''
            set count (count $argv | tr -d \n)
            if test "$count" = 2; and test -d "$argv[1]"
                set from (echo $argv[1] | trim-right /)
                set to (echo $argv[2])
                command cp -r $from $to
            else
                command cp $argv
            end
        '';
        y = ''
            set tmp (mktemp -t "yazi-cwd.XXXXXX")
            yazi $argv --cwd-file="$tmp"
            if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
                builtin cd -- "$cwd"
            end
            rm -f -- "$tmp"
        '';
    };
}
