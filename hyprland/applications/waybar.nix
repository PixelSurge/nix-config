{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "9 13 -10 18";

        modules-left = ["custom/launcher" "hyprland/workspaces"];
        modules-center = ["clock"];
        modules-right = [
          "pulseaudio"
          "custom/mem"
          "cpu"
          "backlight"
          "network"
          "custom/powermenu"
          "tray"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
        };

        "custom/launcher" = {
          "format" = " ";
          "on-click" = "pkill rofi || rofi";
          "on-click-middle" = "exec default_wall";
          "on-click-right" = "exec wallpaper_random";
          "tooltip" = false;
        };

        "clock" = {
          # timezone = "America/New_York";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%a; %d %b, %I:%M %p}";
        };

        "pulseaudio" = {
          # scroll-step = 1; # %, can be a float
          reverse-scrolling = 1;
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
          min-length = 13;
        };

        "custom/mem" = {
          format = "{} ";
          interval = 3;
          exec = "free -h | awk '/Mem:/{printf $3}'";
          tooltip = false;
        };

        "cpu" = {
          interval = 2;
          format = "{usage}% ";
          min-length = 6;
        };

        "backlight" = {
          device = "intel_backlight";
          format = "{percent}% {icon}";
          format-icons = [""];
          min-length = 7;
        };

        "network" = {
          "format-disconnected" = "󰯡 Disconnected";
          "format-ethernet" = "󰒢 Connected!";
          "format-linked" = "󰖪 {essid} (No IP)";
          "format-wifi" = "󰖩 {essid}";
          "interval" = 1;
          "tooltip" = false;
          on-click = "pavucontrol";
        };

        "custom/powermenu" = {
          "format" = "";
          "on-click" = "pkill rofi || ~/nix-config/hyprland/scripts/powermenu.sh";
          "tooltip" = false;
        };

        tray = {
          icon-size = 16;
          spacing = 0;
        };
      };
    };

    style = ''
      * {
          border: none;
          border-radius: 0;
          /* `otf-font-awesome` is required to be installed for icons */
          font-family: JetBrains Mono;
          font-weight: bold;
          min-height: 20px;
      }

      window#waybar {
          background: transparent;
      }

      window#waybar.hidden {
          opacity: 0.2;
      }

      #workspaces {
          margin-right: 8px;
          border-radius: 10px;
          transition: none;
          background: #383c4a;
      }

      #workspaces button {
          transition: none;
          color: #7c818c;
          background: transparent;
          padding: 5px;
          font-size: 18px;
      }

      #workspaces button.persistent {
          color: #7c818c;
          font-size: 12px;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      #workspaces button:hover {
          transition: none;
          box-shadow: inherit;
          text-shadow: inherit;
          border-radius: inherit;
          color: #383c4a;
          background: #7c818c;
      }

      #workspaces button.active {
          background: #4e5263;
          color: white;
          border-radius: inherit;
      }


      #custom-pacman {
          padding-left: 16px;
          padding-right: 8px;
          border-radius: 10px 0px 0px 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }


      #submap {
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #clock {
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #pulseaudio {
          margin-right: 8px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #pulseaudio.muted {
          background-color: #90b1b1;
          color: #2a5c45;
      }

      #custom-mem {
          margin-right: 8px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #cpu {
          margin-right: 8px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #network{
          margin-right: 8px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #backlight {
          margin-right: 8px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #tray {
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      @keyframes blink {
          to {
              background-color: #ffffff;
              color: #000000;
          }
      }
    '';
  };
}
