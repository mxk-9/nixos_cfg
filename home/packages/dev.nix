{ pkgs, ... }:
let
	gcc_base = {
		home.packages = with pkgs; [ gcc clang-tools ];
	};

	go_setup = {
		imports = [ gcc_base ]; # For CGO
		home.packages = with pkgs; [ go gopls delve revive ];
		home.sessionVariables = {
			GOTELEMETRY = "off";
		};
	};

	lua_setup = {
		home.packages = with pkgs; [ lua-language-server lua51Packages.lua-lsp lua ];
	};

	rust_setup = {
		home.packages = with pkgs; [ cargo rustc rustfmt rust-analyzer ];
	};

	cpp_gcc_setup = {
		home.packages = with pkgs; [ gdb vscode-extensions.llvm-org.lldb-vscode cpplint ];
		imports = [ gcc_base ];
	};

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
		# cpp_setup
		# rust_setup

		# Editors
		# emacs
		neovim
		hx
	];
}

