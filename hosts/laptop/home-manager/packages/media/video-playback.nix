{ lib, ... }:

{
  programs.mpv.config.ytdl-format = lib.mkForce "bestvideo[height<=?1080][vcodec!~='vp0?9']+bestaudio/best";
}
