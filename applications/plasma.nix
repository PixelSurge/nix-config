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
      lookAndFeel = "org.kde.breezedark.desktop";
      wallpaper = "/home/sahan/nix-config/img.jpg";
    };
  };
}
