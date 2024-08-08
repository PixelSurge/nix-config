{
  config,
  pkgs,
  plasma-manager,
  username,
  ...
}: {
  programs.plasma = {
    enable = true;
    workspace = {
      clickItemTo = "open"; # If you liked the click-to-open default from plasma 5
      lookAndFeel = "org.kde.breezedark.desktop";
      iconTheme = "Breeze";
      wallpaper = "/home/sahan/nix-config/img.jpg";
    };
  };
}
