{ pkgs, inputs, ... }: {
  programs.firefox = {
    enable = true;
    profiles = {
      sny = import ./sny { inherit inputs pkgs; } ;

      work = import ./work { inherit inputs pkgs; };
    };

    # policies.ExtensionSettings = {
    #   "uBlock0@raymondhill.net" = {
    #     install_url = "https://addons.mozilla.org/firefox/downloads/file/4269685/2668061-0.0.1.64.xpi";
    #     installation_mode = "force_installed";
    #   };
    # };
  };
}
