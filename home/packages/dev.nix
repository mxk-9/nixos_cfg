{ pkgs, ... }:
let
	go_setup = {
		home.packages = with pkgs; [ go gopls gcc delve revive ];
		home.sessionVariables = {
			GOTELEMETRY = "off";
		};
	};

	lua_setup = {
		home.packages = with pkgs; [ lua-language-server lua51Packages.lua-lsp ];
	};

	rust_setup = {
		home.packages = with pkgs; [ cargo rustc rustfmt rust-analyzer ];
	};

	cpp_clang_setup = {
		home.packages = with pkgs; [ clang-tools clang clang-analyzer cpplint gdb gnumake vscode-extensions.llvm-org.lldb-vscode ];
	};

	cpp_gcc_setup = {
		home.packages = with pkgs; [ gcc clang-tools gdb gnumake vscode-extensions.llvm-org.lldb-vscode ];
	};

	# cpp_setup = cpp_clang_setup;
	cpp_setup = cpp_gcc_setup;

	emacs = {
		programs.emacs = {
			enable = true;
			package = pkgs.emacs;
		};
	};

	neovim = {
		home.packages = with pkgs; [ ripgrep nixd ];
	};

  hx = {
    home.packages = with pkgs; [ helix dprint nil ];
  };
in {
	imports = [
		# Languages
		go_setup
		lua_setup
		cpp_setup
		# rust_setup

		# Editors
		# emacs
		neovim
		hx
	];
}

