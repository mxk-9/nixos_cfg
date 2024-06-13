{ pkgs, inputs, ... }: let
in {
  id = 0;

  bookmarks = [
    { name = "0 2 Nix"
    ; tags = [ "nix" "dev" ]
    ; keyword = "nix"
    ; url = "https://zero-to-nix.com/"
    ; }

    { name = "Nix Pills"
    ; tags = [ "nix" "dev" "nixos" ]
    ; keyword = "pills"
    ; url = "https://nixos.org/guides/nix-pills/"
    ; }

    { name = "findanime"
    ; tags = [ "anime" ]
    ; keyword = "findanime"
    ; url = "https://findanime.net/"
    ; }

    { name = "Nix Manual"
    ; tags = [ "nix" "dev" ]
    ; url = "https://nix.dev/manual/nix/2.18/"
    ; }
  ];

  settings = {
    "browser.download.panel.shown" = true;
    "browser.newtabpage.enabled" = false;
    "browser.newtabpage.enhanced" = false;
    "browser.newtabpage.introShown" = true;
    "browser.safebrowsing.appRepURL" = "";
    "browser.safebrowsing.blockedURIs.enabled" = false;
    "browser.safebrowsing.downloads.enabled" = false;
    "browser.safebrowsing.downloads.remote.enabled" = false;
    "browser.safebrowsing.downloads.remote.url" = "";
    "browser.safebrowsing.enabled" = false;
    "browser.safebrowsing.malware.enabled" = false;
    "browser.safebrowsing.phishing.enabled" = false;
    "browser.safebrowsing.provider.google.updateURL" = "";
    "browser.safebrowsing.provider.google.gethashURL" = "";
    "browser.safebrowsing.provider.google4.updateURL" = "";
    "browser.safebrowsing.provider.google4.gethashURL" = "";
    "browser.safebrowsing.provider.mozilla.gethashURL" = "";
    "browser.safebrowsing.provider.mozilla.updateURL" = "";
    "browser.tabs.firefox-view" = false;
    "browser.toolbars.bookmarks.visibility" = "never";
    "browser.uiCustomization.state" = ''
      {"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["_af37054b-3ace-46a2-ac59-709e4412bec6_-browser-action","_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","_testpilot-containers-browser-action","jid1-bofifl9vbdl2zq_jetpack-browser-action","jid1-kkzogwgsw3ao4q_jetpack-browser-action","ublock0_raymondhill_net-browser-action","_74145f27-f039-47ce-a470-a662b129930a_-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action","_b7f9d2cd-d772-4302-8c3f-eb941af36f76_-browser-action"],"nav-bar":["back-button","forward-button","urlbar-container","save-to-pocket-button","unified-extensions-button","reset-pbm-toolbar-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","alltabs-button"],"PersonalToolbar":["personal-bookmarks"]},"seen":["_af37054b-3ace-46a2-ac59-709e4412bec6_-browser-action","_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","_testpilot-containers-browser-action","jid1-bofifl9vbdl2zq_jetpack-browser-action","jid1-kkzogwgsw3ao4q_jetpack-browser-action","ublock0_raymondhill_net-browser-action","_74145f27-f039-47ce-a470-a662b129930a_-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action","_b7f9d2cd-d772-4302-8c3f-eb941af36f76_-browser-action","developer-button"],"dirtyAreaCache":["unified-extensions-area","nav-bar","toolbar-menubar","TabsToolbar","PersonalToolbar"],"currentVersion":20,"newElementCount":5}
    '';
    "browser.search.hiddenOneOffs" = "Google,Amazon.com,Bing";
    "browser.gesture.swipe.right" = "";
    "browser.gesture.swipe.left" = "";
    "browser.translations.enable" = false;
    "browser.urlbar.showSearchSuggestionsFirst" = false;
    "browser.pocket.enabled" = false;
    "browser.onboarding.newtour" =
      "performance,private,addons,customize,default";
    "browser.onboarding.updatetour" =
      "performance,library,singlesearch,customize";
    "browser.onboarding.enabled" = false;

    "datareporting.healthreport.service.enabled" = false;
    "datareporting.healthreport.uploadEnabled" = false;
    "datareporting.policy.dataSubmissionEnabled" = false;
    "datareporting.healthreport.about.reportUrl" = "http://127.0.0.1/";
    "datareporting.healthreport.documentServerURI" = "http://127.0.0.1/";

    "device.sensors.ambientLight.enabled" = false;
    "device.sensors.enabled" = false;
    "device.sensors.motion.enabled" = false;
    "device.sensors.orientation.enabled" = false;
    "device.sensors.proximity.enabled" = false;

    "dom.battery.enabled" = false;
    "dom.security.https_only_mode" = true;
    "dom.security.https_only_mode_ever_enabled" = true;
    "dom.webnotifications.enabled" = false;
    "dom.webnotifications.serviceworker.enabled" = false;
    "dom.push.enabled" = false;

    "extensions.getAddons.cache.enabled" = false;
    "extensions.getAddons.showPane" = false;
    "extensions.pocket.enabled" = false;
    "extensions.screenshots.disabled" = true;
    "extensions.shield-recipe-client.api_url" = "";
    "extensions.shield-recipe-client.enabled" = false;
    "extensions.webservice.discoverURL" = "";

    "geo.enabled" = false;
    "geo.wifi.uri" = "";

    "identify.fxaccounts.enabled" = false;

    "media.autoplay.default" = 2;
    "media.autoplay.enabled" = false;

    "privacy.donottrackheader.enabled" = true;
    "privacy.donottrackheader.value" = 1;
    "privacy.query_stripping" = true;
    "privacy.trackingprotection.cryptomining.enabled" = true;
    "privacy.trackingprotection.enabled" = true;
    "privacy.trackingprotection.fingerprinting.enabled" = true;
    "privacy.trackingprotection.pbmode.enabled" = true;
    "privacy.usercontext.about_newtab_segregation.enabled" = true;
    "security.ssl.disable_session_identifiers" = true;
    "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSite" =
      false;
    "signon.autofillForms" = false;
    "toolkit.telemetry.archive.enabled" = false;
    "toolkit.telemetry.bhrPing.enabled" = false;
    "toolkit.telemetry.cachedClientID" = "";
    "toolkit.telemetry.enabled" = false;
    "toolkit.telemetry.firstShutdownPing.enabled" = false;
    "toolkit.telemetry.hybridContent.enabled" = false;
    "toolkit.telemetry.newProfilePing.enabled" = false;
    "toolkit.telemetry.prompted" = 2;
    "toolkit.telemetry.rejected" = true;
    "toolkit.telemetry.reportingpolicy.firstRun" = false;
    "toolkit.telemetry.server" = "";
    "toolkit.telemetry.shutdownPingSender.enabled" = false;
    "toolkit.telemetry.unified" = false;
    "toolkit.telemetry.unifiedIsOptIn" = false;
    "toolkit.telemetry.updatePing.enabled" = false;
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

  };

  search = {
    engines = {
      "Nix Packages" = {
        urls = [
          { template = "https://search.nixos.org/packages"
          ; params = [
              { name = "type"; value = "packages"; }
              { name = "query"; value = "{searchTerms}"; }
            ]
          ; }
        ];

        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = [ "@np" ];
      };
    };

    force = true;
  };

  userChrome = import ./chrome.nix;
  userContent = import ./content.nix;

  extensions = (with inputs.firefox-addons.packages.${pkgs.system}; [
    darkreader
    ublock-origin
    sponsorblock
    vimium-c
    keepassxc-browser
  ]);
}
