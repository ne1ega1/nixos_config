{
  imports = [
    ./aliases.nix
    ./plugins.nix
    ./functions.nix
  ];

  programs = {
    starship = {
      enable = true;
      enableFishIntegration = true;
      settings = { };
    };
    fish = {
      enable = true;
      preferAbbrs = true;
      loginShellInit = "starship init fish | source";
      interactiveShellInit = ''
        set fish_greeting

        set -x MANROFFOPT "-c"
        set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

        # Set settings for https://github.com/franciscolourenco/done
        set -U __done_min_cmd_duration 10000
        set -U __done_notification_urgency_level low

        set -gx activate .venv/bin/activate.fish

        if [ "$XDG_SESSION_TYPE" = "wayland" ]
            set -gx WAYLAND 1
            set -gx QT_QPA_PLATFORM 'wayland;xcb'
            set -gx GDK_BACKEND 'wayland,x11'
            set -gx MOZ_DBUS_REMOTE 1
            set -gx MOZ_ENABLE_WAYLAND 1
            set -gx _JAVA_AWT_WM_NONREPARENTING 1
            set -gx BEMENU_BACKEND wayland
            set -gx CLUTTER_BACKEND wayland
            set -gx ECORE_EVAS_ENGINE wayland_egl
            set -gx ELM_ENGINE wayland_egl
        end

        set --export BUN_INSTALL "$HOME/.bun"
        set --export PATH $BUN_INSTALL/bin $PATH

        bind ! __history_previous_command
        bind '$' __history_previous_command_arguments
      '';
      shellInit = ''
        if test -d ~/.local/bin
            if not contains -- ~/.local/bin $PATH
                set -p PATH ~/.local/bin
            end
        end

        [ "$(tty)" = "/dev/tty1" ] && exec start-hyprland
      '';
    };
  };
}
