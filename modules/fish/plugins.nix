{ pkgs, ... }:

{
    programs.fish.plugins =
        let
            mk = n: p: {
                name = n;
                src = p.src;
            };
        in
            (
                with pkgs.fishPlugins; [
                    (mk "autopair-fish" autopair-fish)
                    (mk "fzf-fish" fzf-fish)
                    (mk "puffer" puffer)
                    (mk "grc" grc)
                ]
            );
}
