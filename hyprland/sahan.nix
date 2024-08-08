{
  config,
  pkgs,
  ...
}: {
  # define users
  users.users.sahan = {
    isNormalUser = true;
    description = "Sahan";
    extraGroups = ["networkmanager" "video" "wheel" "dialout"];
    packages = with pkgs; [
      #kdePackages.kate
      eza
      zoxide
      whois
      alejandra
      gnupg
      pinentry-curses # gnupg dependince
      libnotify
    ];
  };
}
