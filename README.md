# ❄️ My NixOS Config

```bash
git clone https://github.com/sahanuser/nixos-config
cd nixos-config/
sudo nixos-rebuild switch --flake .
```


```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disk-config.nix
```
