{
  hyprland,
  pkgs,
  ...
}: {
  home.packages =
    (with pkgs; [
      ranger
      wlr-randr
      git
      rustup
      gnumake
      catimg
      curl
      appimage-run
      xflux
      dunst
      pavucontrol
      sqlite

      #misc
      cava
      neovim
      nano
      rofi
      nitch
      wget
      grim
      slurp
      wl-clipboard
      pamixer
      mpc-cli
      tty-clock
      exa
      btop
      tokyo-night-gtk
    ])
    ++ (with pkgs.gnome; [
      nautilus
      zenity
      gnome-tweaks
      eog
      gedit
    ]);

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Tokyonight-Dark-B-LB";
    };
  };
}
