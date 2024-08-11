{
  config,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;

    shellAliases = {
      ".." = "cd ..";
      "ls" = "eza -al --color=always --group-directories-first";
      "la" = "eza -a --color=always --group-directories-first"; # all files and dirs
      "ll" = "eza -l --color=always --group-directories-first"; # long format
      "lt" = "eza -aT --color=always --group-directories-first";
      "rebuild-test" = "nixos-rebuild test --flake ~/nix-config/hyprland";
      "rebuild" = "nixos-rebuild test --flake ~/nix-config/hyprland";
    };
    interactiveShellInit = ''
      set -U fish_greeting ""
      source (starship init fish --print-full-init | psub)
      zoxide init fish | source
    '';
  };
}
