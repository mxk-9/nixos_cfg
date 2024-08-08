{ pkgs, inputs, ... }: {
  programs.firefox = {
    enable = true;
    profiles = {
      sny = import ./sny { inherit inputs pkgs; };
    };

    policies.ExtensionSettings = {
      "disable-html5-autoplay@afnankhan" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/file/4271494/disable_autoplay-2018.10.4resigned1.xpi";
        installation_mode = "force_installed";
      };
    };
  };
}
