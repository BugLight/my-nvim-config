{
  description = "My Neovim configuration files and dependencies";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ {
    flake-parts,
    nixpkgs,
    ...
  }: let
    my-nvim-config = {
      stdenv,
      pkgs,
    }: let
      lib = nixpkgs.lib;
      tsParsers = with pkgs; [
        tree-sitter-grammars.tree-sitter-cmake
        tree-sitter-grammars.tree-sitter-cpp
        tree-sitter-grammars.tree-sitter-nix
        tree-sitter-grammars.tree-sitter-python
        tree-sitter-grammars.tree-sitter-rust
      ];
      installTsParser = outPath: parserPkg: let
        parserName = (lib.parseDrvName parserPkg.pname).name;
        parserLang = lib.strings.removePrefix "tree-sitter-" parserName;
      in ''
        mkdir -p ${outPath}/parser
        mkdir -p ${outPath}/after
        mkdir -p ${outPath}/after/queries
        cp -v ${parserPkg}/parser ${outPath}/parser/${parserLang}.so
        cp -nrv ${parserPkg}/queries ${outPath}/after/queries/${parserLang}
      '';
      binaries = with pkgs; [
        python3
        nodejs
        git
        fzf
        ripgrep
      ];
    in
      stdenv.mkDerivation rec {
        name = "my-nvim-config";
        meta.mainProgram = "nvim";

        src = ./.;

        buildInputs = [pkgs.neovim] ++ binaries ++ tsParsers;

        nativeBuildInputs = [pkgs.makeWrapper];

        installPhase =
          ''
            mkdir -p $out/${name}
            cp -rv $src/* $out/${name}

          ''
          + (lib.concatMapStrings (installTsParser "$out/${name}") tsParsers)
          + ''
            makeWrapper ${pkgs.neovim}/bin/nvim $out/bin/nvim \
                --prefix-each PATH : '
          ''
          + (lib.concatMapStrings (binary: "${binary}/bin\n") binaries)
          + ''
            ' \
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
