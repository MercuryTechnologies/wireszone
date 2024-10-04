devShells."aarch64-linux".default = pkgs.mkShell {
  packages = with pkgs; [ elixir_1_17 mix2nix ];
};
