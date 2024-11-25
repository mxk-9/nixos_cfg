{ pkgs, ... }:
{
  environment.packages = [ pkgs.neovim ];
  system.stateVersion = "24.05";

  home-manager.config = {pkgs, ...}: let
    helix = {
      programs.helix = {
        enable = true;
        extraPackages = with pkgs; [ dprint nil ];
        languages = {
          language = [
            { name = "markdown"
            ; formatter = {
              command = "dprint";
              args = [ "fmt" "--stding" "md" ];
              }
            ;}
      
            { name = "cpp"
            ; auto-format = false
            ; file-types = [ "cpp" "h" "hpp" "cxx" ]
            ; language-servers = [ "clangd" ]
            ; indent = { tab-width = 2; unit = "  ";}
            ;}
      
            { name = "lua"
            ; indent = { tab-width = 4; unit = "    "; }
            ;}
          ];
        };
      
        settings = {
          theme = "bogster";
          keys.normal = {
            backspace = { t = ":lsp-restart"; s = ":lsp-stop"; };
            F1 = {
              n = ":set soft-wrap.enable false";
              N = ":set soft-wrap.enable true";
              t = ":set smart-tab.enable false";
              T = ":set smart-tab.enable true";
            };
      
            F2 = {
              b = ":buffer-close";
              B = ":buffer-close!";
              a = ":buffer-close-all";
              A = ":buffer-close-all!";
            };
      
            esc = [ "collapse_selection" "keep_primary_selection" ];
          };
      
          editor = {
            scrolloff = 1;
            scroll-lines = 5;
            shell = [ "zsh" "-c" ];
            soft-wrap.enable = true;
            bufferline = "multiple";
            line-number= "relative";
            cursorline = true;
      
            cursor-shape = {
              insert = "bar";
              select = "underline";
            };
      
            lsp = {
              display-messages = true;
            };
          };
        };
      };
    };
  in {
    home.stateVersion = "24.05";

    imports = [ helix ];
  };
}
