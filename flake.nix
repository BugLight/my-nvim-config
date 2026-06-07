{
  description = "My Neovim configuration files and dependencies";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ {flake-parts, ...}: let
    my-nvim-config = {
      stdenv,
      pkgs,
    }:
      stdenv.mkDerivation rec {
        name = "my-nvim-config";
        meta.mainProgram = "nvim";

        src = ./.;

        buildInputs = with pkgs; [
          git
          python3
          nodejs
          neovim
        ];

        nativeBuildInputs = [pkgs.makeWrapper];

        installPhase = ''
          mkdir -p $out/${name}
          cp -rv $src/* $out/${name}
          makeWrapper ${pkgs.neovim}/bin/nvim $out/bin/nvim \
              --prefix-each PATH : '${pkgs.python3}/bin ${pkgs.nodejs}/bin' \
              --set XDG_CONFIG_HOME $out \
              --set NVIM_APPNAME ${name}
        '';
      };
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
      ];
      systems = ["x86_64-linux" "aarch64-darwin"];
      perSystem = {pkgs, ...}: {
        packages.default = pkgs.callPackage my-nvim-config {};
      };
    };
}
