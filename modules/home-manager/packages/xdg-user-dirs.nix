{ config, ... }:

let
  home = "${config.home.homeDirectory}";
in

{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    setSessionVariables = true;

    documents = "${home}/documents";
    download = "${home}/downloads";
    videos = "${home}/videos";
    music = "${home}/music";
    pictures = "${home}/pictures";
    publicShare = "${home}/public";
    desktop = null;
    templates = null;

    extraConfig = {
      dotfiles = "${home}/dotfiles";
      misc = "${home}/misc";
      screenshots = "${home}/pictures/screenshots";
      wallpapers = "${home}/pictures/wallpapers";
      capture = "${home}/videos/captures";
      vm = "${home}/vm";
    };
  };
}
