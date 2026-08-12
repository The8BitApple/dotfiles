{
  imports = [
    ../../modules/home-manager
    ../../overlays
    ./home-manager/packages/xdg-user-dirs.nix
  ];

  disabledModules = [
    ../../modules/home-manager/packages/utilities/network/nm-applet.nix
  ];
}
