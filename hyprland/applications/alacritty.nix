{
  config,
  pkgs,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      font.normal.family = "FiraCode Nerd Font";

      colors = {
        primary = {
          background = "0x1c1c1c"; # Dark but neutral background
          foreground = "0xe6e6e6"; # Brighter foreground for better contrast
          bright_foreground = "0xe6efff"; # Pure white for a bright foreground
        };

        normal = {
          black = "0x1c1c1c"; # Deep black
          red = "0xff5555"; # Bright red
          green = "0x50fa7b"; # Bright green
          yellow = "0xf1fa8c"; # Vibrant yellow
          blue = "0x62b1ff"; # Bright blue
          magenta = "0xff79c6"; # Bright magenta
          cyan = "0x8be9fd"; # Bright cyan
          white = "0x828791"; # Light grayish white
        };

        bright = {
          black = "0x4d4d4d"; # Brighter black for visibility
          red = "0xff6e6e"; # Even brighter red
          green = "0x69ff94"; # Even brighter green
          yellow = "0xffffa5"; # Bright yellow
          blue = "0x79b9ff"; # Brighter blue
          magenta = "0xff92d0"; # Brighter magenta
          cyan = "0xa4ffff"; # Bright cyan
          white = "0xe6efff"; # Pure white
        };

        dim = {
          black = "0x2a2a2a"; # Slightly lighter black
          red = "0xcc444b"; # Dim red with a bright tone
          green = "0x45c16e"; # Dim green with a bright tone
          yellow = "0xd6d167"; # Dim yellow with a bright tone
          blue = "0x4a94d8"; # Dim blue with a bright tone
          magenta = "0xd06fae"; # Dim magenta with a bright tone
          cyan = "0x76c7d6"; # Dim cyan with a bright tone
          white = "0x828791"; # Dim white with a bright tone
        };
      };
    };
  };
}
