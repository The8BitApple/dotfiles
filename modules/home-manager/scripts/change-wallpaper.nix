{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellApplication {
      name = "change-wallpaper";
      runtimeInputs = [
        libnotify
        sxiv
      ];
      text = ''
        case "$1" in
        -d)
            arg="-d"
            lockscreen_prompt_msg=""
            ;;
        -l)
            arg="-l"
            lockscreen_prompt_msg=" lockscreen"
            ;;
        *)
            printf "No argument specified...\n"
            exit 1
            ;;
        esac

        wall_dir="$(xdg-user-dir PICTURES)/wallpapers"

        cd "$wall_dir" || exit

        while true; do
            choice=$(find -- * -type d | wofi --lines 6 -i -p "󰉏  select$lockscreen_prompt_msg wallpaper type" --dmenu)
            [ ! "$choice" ] && exit 1

            selected_wallpaper=$(sxiv -tor "$wall_dir"/"$choice" | tail -n 1)
            [ "$selected_wallpaper" != "" ] && break
        done

        if [ "$arg" = "-d" ]; then
            pkill swaybg
            swaybg -m fill -i "$selected_wallpaper" &
            wallpaper_link_name="current-wallpaper"
        else
            wallpaper_link_name="current-wallpaper-lockscreen"
            notify-send -t 2000 -i "$selected_wallpaper" "Lockscreen wallpaper changed."
        fi

        ln -sf "$selected_wallpaper" ~/.local/share/"$wallpaper_link_name"
      '';
    })
  ];
}
