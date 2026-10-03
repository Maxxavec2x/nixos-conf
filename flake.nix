{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    # Documentation très bien :https://birdeehub.github.io/nix-wrapper-modules/
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Niri: Wayland compositor avec scrolling infini
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # umbriel : même chose mais fait par les dev de noctalia, meilleure intégration ?
    umbriel.url = "git+https://github.com/noctalia-dev/umbriel";
    xwayland-satellite = {
      url = "github:Supreeeme/xwayland-satellite/v0.8.3"; # Je récupère xwayland-satellite ici et pas dans nixpkgs car je veux la version 8.0.3 minimum
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.rust-overlay.inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    linux-wallpaperengine-gui = {
      url = "github:Maxxavec2x/linux-wallpaperengine-gui-flake";
    };
    capev2 = {
      url = "path:/home/maxx/projects/CAPEv2";
    };

  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
