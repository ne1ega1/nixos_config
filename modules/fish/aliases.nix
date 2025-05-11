{
    programs.fish.shellAliases = {
        nt = "cd ~/nixos_config/ && git add . && sudo nixos-rebuild test --flake ~/nixos_config";
        ns = "cd ~/nixos_config/ && git add . && sudo nixos-rebuild switch --flake ~/nixos_config";
        update = "nix flake update --flake ~/nixos_config";

        unset = "set --erase";
        grubup = "sudo grub-mkconfig -o /boot/grub/grub.cfg";
        tarnow = "tar -acf";
        untar = "tar -zxvf";
        wget = "wget -c";
        psmem = "ps auxf | sort -nr -k 4";
        psmem10 = "ps auxf | sort -nr -k 4 | head -10";

        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        "....." = "cd ../../../..";
        "......" = "cd ../../../../..";
        ls = "eza -al --color=always --group-directories-first --icons";
        la = "eza -a --color=always --group-directories-first --icons";
        ll = "eza -l --color=always --group-directories-first --icons";
        lt = "eza -aT --color=always --group-directories-first --icons";
        "l." = "eza -a | grep -e '^\\.'";

        dir = "dir --color=auto";
        vdir = "vdir --color=auto";
        grep = "grep --color=auto";
        fgrep = "fgrep --color=auto";
        egrep = "egrep --color=auto";
        hw = "hwinfo --short";
        big = "expac -H M '%m\t%n' | sort -h | nl";
        jctl = "journalctl -p 3 -xb";

        lg = "lazygit";
        gl = "git pull";
        gb = "git checkout";

        c = "cd ~/.config";
        d = "cd ~/Downloads";
        n = "cd ~/nixos_config";
        b = "cd ~/etlsrc && make build/airflow && make build/crawlers && make build/parsers/base && make build/normalizers/base";
        o = "cd ~/etlsrc && make build/xporters/couchdb && make build/operators";
        r = "cd ~/etlsrc && make down && make clean && make up";
        f = "b && n && make up";

        pixel = "scrcpy --render-driver=software --window-height=1240 --window-title=\"Pixel 7\" -e";
    };
}
