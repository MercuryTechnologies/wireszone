{
  description = "Nix-ified Elixir/Phoenix app";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    devShells = {
      aarch64-darwin =
        let
          pkgs = import nixpkgs { system = "aarch64-darwin"; };
        in pkgs.mkShell {
          packages = with pkgs; [
            (pkgs.beam.packages.erlang_27.elixir_1_17)
            mix2nix
            nodejs
            postgresql
          ];

          shellHook = ''
            export MIX_ENV=dev
            echo "Starting up Phoenix dev environment on aarch64-darwin..."
          '';
        };
    };

    defaultPackage.aarch64-darwin = self.devShells.aarch64-darwin;
  };
}
