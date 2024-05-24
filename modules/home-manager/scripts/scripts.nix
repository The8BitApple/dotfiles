{ config, lib, pkgs, ... }:

{
  options.scripts.enable = lib.mkEnableOption ''
    Enable the use of scripts.
  '';
  imports = [
    ./modules/batteries.nix
    ./modules/change-volume.nix
    ./modules/change-brightness.nix
    ./modules/change-wallpaper.nix
    ./modules/system-actions.nix
    ./modules/screenshot.nix
    ./modules/image-edit.nix
  ];

  config = lib.mkIf config.scripts.enable {
    battery.enable = lib.mkDefault true;
    changeVolume.enable = lib.mkDefault true;
    changeBrightness.enable = lib.mkDefault true;
    changeWallpaper.enable = lib.mkDefault true;
    systemActions.enable = lib.mkDefault true;
    screenshot.enable = lib.mkDefault true;
    imageEdit.enable = lib.mkDefault true;
  };
}
