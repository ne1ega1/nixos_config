{ pkgs, ... }:

let
yaziCompressRep = pkgs.fetchFromGitHub {
    owner = "KKV9";
    repo = "compress.yazi";
    rev = "60b24af23d1050f1700953a367dd4a2990ee51aa";
    sha256 = "0cdb8m38n3i356lmq6i7jldx446w98m1bz59650w5s9dgzf53zk1";
};

yaziOfficeRep = pkgs.fetchFromGitHub {
    owner = "macydnah";
    repo = "office.yazi";
    rev = "d1e3e51857c109fbfc707ab0f9f383dc98b9795f";
    sha256 = "13a7wjsssnavwhq4x5lnfcgs8l0s3w1cscl23gxidvjzxp31w5rr";
};

yaziWlClipboardRep = pkgs.fetchFromGitHub {
    owner = "grappas";
    repo = "wl-clipboard.yazi";
    rev = "c4edc4f6adf088521f11d0acf2b70610c31924f0";
    sha256 = "0rszf0yizc82sycfr70xl8jj7kby7gwj3fvxxjzg53f7vlvn0mlf";
};

yaziWhatSizeRep = pkgs.fetchFromGitHub {
    owner = "pirafrank";
    repo = "what-size.yazi";
    rev = "f1c6b691363e602d0ddbee29384017d08b608f64";
    sha256 = "0n3j4qxx61jgz93kwzx11yfybqasqjl8mmj2cbawzmrpdam62nik";
};

in
{
    programs.yazi.plugins = with pkgs; {
        git = yaziPlugins.git;
        diff = yaziPlugins.diff;
        lsar = yaziPlugins.lsar;
        sudo = yaziPlugins.sudo;
        piper = yaziPlugins.piper;
        chmod = yaziPlugins.chmod;
        mount = yaziPlugins.mount;
        yatline = yaziPlugins.yatline;
        full-border = yaziPlugins.full-border;
        smart-filter = yaziPlugins.smart-filter;
        yatline-catppuccin = yaziPlugins.yatline-catppuccin;
        wl-clipboard = "${yaziWlClipboardRep}";
        what-size = "${yaziWhatSizeRep}";
        compress = "${yaziCompressRep}";
        office = "${yaziOfficeRep}";
    };
}
