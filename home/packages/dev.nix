{ pkgs, ... }:
let
  gcc_base = {
    home.packages = with pkgs; [ gcc clang-tools ];
  };

  cpp_gcc_setup = {
    home.packages = with pkgs; [ gdb vscode-extensions.llvm-org.lldb-vscode ];
    imports = [ gcc_base ];
  };

  cpp_setup = cpp_gcc_setup;

  go_setup = {
    imports = [ gcc_base ]; # For CGO
    home = {
      packages = with pkgs; [ go gopls golint delve ];
      sessionVariables.GOTELEMETRY = "off";
    };
  };

  lua_setup = {
    home.packages = with pkgs; [ lua-language-server lua51Packages.lua-lsp lua ];
  };

  rust_setup = {
    home.packages = with pkgs; [ cargo rustc rustfmt rust-analyzer ];
  };

in {
  imports = [
    # Languages
    rust_setup
    cpp_setup
    go_setup
    lua_setup
  ];


  home.packages = with pkgs; [
    emacs
  ];
}

