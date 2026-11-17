{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    umbriel.url = "github:noctalia-dev/umbriel/cachix";

    noctalia.url = "github:noctalia-dev/noctalia/cachix";

    luciole = {
    	url = "github:noctalia-dev/luciole";
    	inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations.YOURHOSTNAMEHERE = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
        ];
      };
    };
}
