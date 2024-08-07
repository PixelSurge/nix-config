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
    };
    interactiveShellInit = ''
      set -U fish_greeting ""
      source (/home/sahan/.nix-profile/bin/starship init fish --print-full-init | psub)
      zoxide init fish | source
    '';
  };
}
