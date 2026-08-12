{ pkgs, userSettings, ... }:

{
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      mpv-playlistmanager
      quality-menu
      sponsorblock-minimal
    ];

    scriptOpts = {
      "sponsorblock_minimal" = {
        categories = "sponsor;selfpromo;interaction";
        hash = "";
        server = "https://sponsor.ajay.app/api/skipSegments";
      };
    };

    bindings = {
      # seeking
      l = "seek 5";
      h = "seek -5";
      j = "seek -60";
      k = "seek 60";
      S = "cycle sub";

      ENTER = "cycle pause";

      # video reload
      p = "write-watch-later-config ; loadfile '\${path}'";

      # quality menu
      F = "script-binding quality_menu/video_formats_toggle";
      "Alt+f" = "script-binding quality_menu/audio_formats_toggle";
    };

    config = {
      vo = "gpu-next";
      hwdec = "auto";
      gpu-api = "opengl";
      keep-open = "yes";

      video-sync = "display-resample";
      interpolation = "yes";


      ytdl-format = "((bestvideo[height<=?1440][vcodec^=vp9]/bestvideo)+(bestaudio[acodec=opus]/bestaudio[acodec=vorbis]/bestaudio[acodec=aac]/bestaudio))/best";
      sub-border-style = "opaque-box";
    };
  };
  home.packages = with pkgs; [
    freetube
    yt-dlp

    (writeShellApplication {
      name = "mpvl";
      runtimeInputs = with pkgs; [ wl-clipboard ];
      text = ''
        ${userSettings.terminal.name} --hold -e mpv "$(wl-paste)"
      '';
    })
  ];
}
