{ pkgs, ... }:
let
  gcc_base = {
    home.packages = with pkgs; [ gcc clang-tools ];
  };

  cpp_gcc_setup = {
    home.packages = with pkgs; [ gdb vscode-extensions.llvm-org.lldb-vscode cpplint ];
    imports = [ gcc_base ];
  };

  cpp_setup = cpp_gcc_setup;

  go_setup = {
    imports = [ gcc_base ]; # For CGO
    home = {
      packages = with pkgs; [ go gopls delve revive ];
      sessionVariables.GOTELEMETRY = "off";
    };
  };

  lua_setup = {
    home.packages = with pkgs; [ lua-language-server lua51Packages.lua-lsp lua ];
  };

  rust_setup = {
    home.packages = with pkgs; [ cargo rustc rustfmt rust-analyzer ];
  };

  neovim = {
    home.packages = with pkgs; [ ripgrep nixd jsonnet-language-server ];
  };

  hx = {
    home = {
      packages = with pkgs; [ helix dprint nil ];
      file = let
        hxcfg = ".config/helix";
      in {
        "${hxcfg}/config.toml" = {
          source = ../cfg-files/helix/config.toml;
          recursive = true;
        };

        "${hxcfg}/languages.toml" = {
          source = ../cfg-files/helix/languages.toml;
          recursive = true;
        };
      };
    };
  };
in {
  imports = [
    # Languages
    # rust_setup
    cpp_setup
    go_setup
    lua_setup

    # Editors
    neovim
    # hx
  ];

}

