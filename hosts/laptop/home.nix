{
  imports = [
    ../../modules/home-manager
    ../../overlays
   ./home-manager/packages/media/video-playback.nix
  ];

  disabledModules = [
    ../../modules/home-manager/packages/gaming/emulators.nix
    ../../modules/home-manager/packages/gaming/mangohud.nix
    ../../modules/home-manager/packages/gaming/sourceports/dsda-doom.nix
    ../../modules/home-manager/packages/gaming/sourceports/ironwail.nix
    ../../modules/home-manager/packages/gaming/sourceports/uzdoom.nix
    ../../modules/home-manager/packages/media/obs-studio.nix
    ../../modules/home-manager/scripts/obs-clip.nix
  ];
}
