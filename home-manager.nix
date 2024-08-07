{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./applications/alacritty.nix
    ./applications/fish.nix
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.

  home.packages = with pkgs; [
    alacritty
    vscode
    #direnv
    ark
    gwenview
    zoom-us
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
    anki
    plasma-browser-integration
    gparted
    git
  ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.05";
  #   home.username = "sahan";
  home.homeDirectory = "/home/sahan";
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.git = {
    enable = true;
    userEmail = "sahan.user@gmail.com";
    userName = "pixelsurge";
    extraConfig.init.defaultBranch = "main";
    signing.key = "BECE3A9020A1E70BD3EABDBC250D317D2A737B31";
  };

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableFishIntegration = true;
    enableSshSupport = true;
  };
}
