{ pkgs, lib }:

pkgs.appimageTools.wrapType2 rec {
    pname = "ktalk";
    version = "3.5.1";

    src = builtins.fetchurl {
        url = "https://st.ktalk.host/ktalk-app/linux/${pname}${version}x86_64.AppImage";
        sha256 = "13lmn8g6w2477hnk0sdidqy6fmq8m9ayg7cgq2hg2jdw8jw8k605";
    };

    extraInstallCommands = ''
        source "${pkgs.makeWrapper}/nix-support/setup-hook"

        wrapProgram $out/bin/${pname} \
        --run "setsid $out/bin/.${pname}-wrapped \"\$@\" >/dev/null 2>&1 </dev/null &" \
        --run "exit 0"

        mkdir -p $out/share/applications/
        cp ${desktopItem}/share/applications/*.desktop $out/share/applications/
        cp -r ${ pkgs.appimageTools.extractType2 { inherit pname version src meta; }
        }/usr/share/icons/ $out/share/icons/

        runHook postInstall
    '';
    desktopItem = pkgs.makeDesktopItem {
        name = "ktalk";
        desktopName = "ktalk";
        comment = "Kontur.Talk";
        icon = "ktalk";
        exec = "ktalk %U";
        categories = [ "VideoConference" ];
        mimeTypes = [ "x-scheme-handler/ktalk" ];
    };
    meta = with lib; {
        description = ''Kontur talk, communication platform'';
        longDescription = ''
            A space for communication and teamwork
            It combines hangouts, chat rooms, webinars, online whiteboards and an
            application for meeting rooms. Allows you to capture and save the result of
            communications.
        '';
        homepage = "https://kontur.ru/talk";
        license = licenses.unfree;
        maintainers = with maintainers; [ sbulav ];
        platforms = [
            "x86_64-linux"
            "x86_64-darwin"
            "aarch64-darwin"
        ];
    };
}
