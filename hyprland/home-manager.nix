{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./applications/alacritty.nix
    ./applications/fish.nix
    ./applications/hyprland.nix
    ./applications/waybar.nix
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.

  home.packages = with pkgs; [
    alacritty
    vscode
    direnv
    ark
    gwenview
    ##zoom-us
    rustup
    virt-manager
    virt-viewer
    vlc
    qemu
    gparted
    kdeconnect
    arduino-ide
    appimage-run
    gotop
    ##anki
    plasma-browser-integration
    git
    starship
    waybar
    rofi
    
  ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.05";
  home.homeDirectory = "/home/sahan";
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  # kde theming
  ##qt.enable = true;
  ##qt.platformTheme.name = "kde";

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.git = {
    enable = true;
    userEmail = "sahan.user@gmail.com";
    userName = "pixelsurge";
    extraConfig.init.defaultBranch = "main";
    # signing.key = "BECE3A9020A1E70BD3EABDBC250D317D2A737B31";
  };

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableFishIntegration = true;
    enableSshSupport = true;
  };
}
