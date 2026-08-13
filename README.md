# NixOS Configuration

Personal NixOS configuration built with **Nix Flakes**, **Home Manager**, and a modular structure. I was heavily inspired by vimjoyer [video](https://www.youtube.com/watch?v=aNgujRXDTdE) for the structure of this configuration.

> This configuration is tailored to my hardware and personal setup. It is mainly intended as a reference rather than a plug-and-play configuration.

## Features

* NixOS + Nix Flakes
* Home Manager
* Modular configuration with `flake-parts` and `import-tree`
* Wayland
* Niri
* Noctalia
* Lenovo laptop configuration
* Development, gaming, shell, browser and media modules

## Structure

```text
.
├── flake.nix
├── flake.lock
└── modules/
    ├── home/
    ├── hosts/
    ├── services/
    ├── wayland/
    ├── user/
    ├── localisation/
    └── ...
```

## Usage

Clone the repository:

```bash
git clone https://github.com/Maxxavec2x/nixos-conf.git
cd nixos-conf
```

Check the flake:

```bash
nix flake check
```

Apply the configuration:

```bash
sudo nixos-rebuild switch --flake .
```

Update dependencies:

```bash
nix flake update
```

## Notes

The configuration contains hardware-specific settings, particularly for my Lenovo laptop. Make sure to review and adapt the relevant modules before using it on another machine.


