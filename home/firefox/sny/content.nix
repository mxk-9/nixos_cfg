let 
  colors = import ../colors.nix;
in with colors.dark; ''
      :root {
        scrollbar-width: none !important;

        --tridactyl-hint-active-fg: var(--tridactyl-hint-fg) !important;
        --tridactyl-hint-active-bg: var(--tridactyl-hint-bg) !important;
        --tridactyl-hint-active-outline: var(--tridactyl-hint-outline) !important;
        --tridactyl-hintspan-font-family: CartographCF Nerd Font !important;
      }
      @-moz-document url(about:privatebrowsing) {
        :root {
          scrollbar-width: none !important;
        }
      }
       @-moz-document url-prefix("about:newtab"), url-prefix("about:home"), url-prefix("about:privatebrowsing") {
        body {
          background-color: #${base} !important;
        }
        .icon-settings,
        .body-wrapper,
        .SnippetBaseContainer,
        .search-handoff-button,
        .search-wrapper .logo-and-wordmark .wordmark,
        .search-wrapper .search-inner-wrapper,
        .search-wrapper input {
          display: none !important;
        }
      }
      @-moz-document url-prefix("about:neterror") {
        :root {
          background-color: #${base} !important;
          color: #${text} !important;
        }
        h1 {
          color: #${text} !important;
        }
        #errorLongDesc {
          display: none;
        }
        #neterrorTryAgainButton {
          display: none;
        }
        #learnMoreLink {
          display: none;
        }
      }
      @-moz-document url-prefix("about:httpsonlyerror"), url-prefix("about:certerror") {
        :root {
          background-color: #${base} !important;
          color: #${text} !important;
        }
        .title {
          background-image: none !important;
        }
        ul, p, b, h2, #goBack {
          display: none !important;
        }
      }
      @-moz-document url-prefix("about:sessionrestore") {
        :root {
          background-color: #${base} !important;
          color: #${text} !important;
        }
        .description {
          display: none;
        }
        #tabsToggle {
          display: none;
        }
        button.primary {
          background-color: #${mauve} !important;
        }
      }
      @-moz-document url-prefix("about:preferences"), 
      url-prefix("about:networking"),
      url-prefix("about:config"),
      url-prefix("about:about"),
      url-prefix("about:addons"), 
      url-prefix("about:profiles"), 
      url-prefix("about:webrtc"), 
      url-prefix("about:policies"), 
      url-prefix("about:cache"),
      url-prefix("about:studies"),
      url-prefix("about:support"),
      url-prefix("about:serviceworkers"),
      url-prefix("about:rights"),
      url-prefix("about:protections"), 
      url-prefix("about:telemetry"), 
      url-prefix("about:compat"), 
      url-prefix("about:certificate"), 
      url-prefix("about:crashes"), 
      url-prefix("about:downloads"), 
      url-prefix("about:logging"), 
      url-prefix("about:processes"), 
      url-prefix("about:profiling"), 
      url-prefix("about:robots"), 
      url-prefix("about:unloads"), 
      url-prefix("about:url-classifier"), 
      url-prefix("about:webauthn"),
      url-prefix("about:logins"),
      url-prefix("about:loginsimportreport"),
      url-prefix("about:httpsonlyerror"), 
      url-prefix("about:certerror"),
      url-prefix("about:neterror"),
      url-prefix("about:sessionrestore")
      {
        :root {
          background-color: #${base} !important;
          color: #${text} !important;
          --in-content-page-background: #${base} !important;
          --in-content-box-background: #${base} !important;
          --in-content-table-background: #${base} !important;
          --in-content-box-border-color: #${base} !important;
          --in-content-primary-button-background: #${mauve} !important;
          --in-content-primary-button-background-hover: #d6bdff !important;
          --in-content-primary-button-background-active: #ad7aff !important;
          --link-color: #${mauve} !important;
          --link-color-hover: #d6bdff !important;
          --link-color-active: #ad7aff !important;
          --color-accent-primary: #${mauve} !important;
          --color-accent-primary-hover: #d6bdff !important;
          --color-accent-primary-active: #ad7aff !important;
        }
      }
      @-moz-document regexp("^(?!.*.pdf?normal).*") {
          :root {
            --body-bg-color: #${base} !important;
            --main-color: #${text} !important;
            --toolbar-bg-color: #${base} !important;
            --field-color: #${text} !important;
            --field-bg-color: #${mantle} !important;
            --field-border-color: #${surface0} !important;
            --sidebar-toolbar-bg-color: #${base} !important;
            --toolbar-icon-bg-color: #${overlay2} !important;
            --toolbar-icon-hover-bg-color: #${subtext0} !important;
            --toolbar-border-color: #${crust}00 !important;
            --dropdown-btn-bg-color: #${mantle} !important;
            --button-hover-color: #${surface0} !important;
            --separator-color: #${base} !important;
            --doorhanger-bg-color: #${mantle} !important;
            --doorhanger-border-color: #${crust}00 !important;
            --doorhanger-hover-color: #${text} !important;
            --doorhanger-hover-bg-color: #${surface0} !important;
            --doorhanger-separator-color: #${surface0} !important;
            --progressBar-color: #${mauve} !important;
            --progressBar-bg-color: #${base} !important;
            --progressBar-blend-color: #${mauve}70 !important;
            --toggled-btn-color: #${text} !important;
            --toggled-btn-bg-color: #${surface0}70 !important;
            --toggled-hover-active-btn-color: #${surface0} !important;
            --scrollbar-color: #${crust}00 !important;
            --scrollbar-bg-color: #${crust}00 !important;
          }
          .editorParamsToolbarContainer .editorParamsSlider::-moz-range-progress {
            background-color: #${mauve} !important;
          }
          :is(.toolbarButton, .secondaryToolbarButton).toggled, .splitToolbarButton.toggled > .toolbarButton.toggled {
            background-color: #${crust} !important;
          }
          .dropdownToolbarButton > select {
            height: 26px !important;
            font-size: 13px !important;
          }
          .toolbarField {
            border: 0px !important;
            border-radius: 0px !important;
            padding: 3px 8px !important;
            margin: 3px !important;
            border: 0px !important;
            color: #${text} !important;
            font-size: 13px !important;
          }
          #zoomOut, #zoomIn, #next, #previous {
            display: none !important;
          }
      }
      @-moz-document url-prefix(about:devtools), url-prefix(chrome:) {
        :root {
           --theme-body-background: #${base} !important;
           --theme-body-emphasized-background: #${base} !important;
           --theme-body-alternate-emphasized-background: #${base} !important;
           --theme-sidebar-background: #${base} !important;
           --theme-tab-toolbar-background: #${mantle} !important;
           --theme-focus-outline-color: #${mauve} !important;
           --theme-toolbar-background: #${base} !important;
           --theme-toolbar-color: #${overlay0} !important;
           --theme-toolbar-selected-color: #${mauve} !important;
           --theme-toolbar-highlighted-color: #${green} !important;
           --theme-toolbar-background-hover: #${surface0} !important;
           --theme-toolbar-background-alt: #${base} !important;
           --theme-toolbar-background-highlighted: #${mauve} !important;
           --theme-toolbar-error-background: #${red} !important;
           --theme-toolbar-hover: #${surface0} !important;
           --theme-toolbar-hover-active: #${surface0} !important;
           --theme-toolbar-separator: #${surface0} !important;
           --toolbarbutton-background: #${surface1} !important;
           --toolbarbutton-hover-background: #${surface1} !important;
           --toolbarbutton-focus-background: #${surface0} !important;
           --toolbarbutton-focus-color: #${subtext0} !important;
           --toolbarbutton-checked-background: #${mauve} !important;
           --toolbarbutton-checked-focus-background: #${mauve} !important;
           --toolbarbutton-checked-color: #${text} !important;
           --theme-accordion-header-background: #${surface0} !important;
           --theme-accordion-header-hover: #${surface1} !important;
           --theme-selection-background: #${surface0} !important;
           --theme-selection-background-hover: #${surface0}80 !important;
           --theme-selection-focus-background: #${surface1} !important;
           --theme-selection-color: #${subtext0} !important;
           --theme-splitter-color: #${surface0};
           --theme-emphasized-splitter-color: #${surface0};
           --theme-emphasized-splitter-color-hover: #${surface1};
           --theme-icon-color: #${overlay0} !important;
           --theme-icon-dimmed-color: #${overlay0} !important;
           --theme-icon-checked-color: #${mauve} !important;
           --theme-icon-error-color: #${red} !important;
           --theme-icon-warning-color: #${yellow} !important;
           --theme-comment: #${overlay1} !important;
           --theme-body-color: #${overlay1} !important;
           --theme-link-color: #${mauve} !important;
           --theme-text-color-alt: #${overlay1} !important;
           --theme-text-color-inactive: #${overlay0} !important;
           --theme-text-color-error: #${subtext0} !important;
           --theme-text-color-strong: #${text} !important;
           --theme-stack-trace-text: #${red} !important; 
           --theme-highlight-green: #${green} !important;
           --theme-highlight-blue: #${mauve} !important;
           --theme-highlight-purple: #${green} !important;
           --theme-highlight-red: #${teal} !important;
           --theme-highlight-yellow: #${yellow} !important;
           --theme-highlight-bluegrey: #${blue} !important;
           --theme-highlight-lightorange: #${peach} !important;
           --theme-highlight-orange: #${peach} !important;
           --theme-highlight-pink: #${pink} !important;
           --theme-highlight-gray: #${subtext0} !important;
           --theme-graphs-purple: #${mauve} !important;
           --theme-graphs-yellow: #${yellow} !important;
           --theme-graphs-orange: #${peach} !important;
           --theme-graphs-grey: #${overlay0} !important;
           --theme-graphs-full-red: #${red} !important;
           --theme-popup-background: #${mantle} !important;
           --theme-popup-color: #${overlay2} !important;
           --theme-popup-border-color: #${crust}00 !important;
           --theme-toolbarbutton-background: #${base} !important;
           --theme-toolbarbutton-color: #${overlay0} !important;
           --theme-toolbarbutton-hover-background: #${surface0} !important;
           --theme-toolbarbutton-checked-background: #${surface1} !important;
           --theme-toolbarbutton-checked-color: #${subtext0} !important;
           --theme-toolbarbutton-checked-hover-background: #${surface2} !important;
           --theme-toolbarbutton-checked-hover-color: #${subtext0} !important;
           --theme-toolbarbutton-active-background: #${surface1} !important;
           --theme-toolbarbutton-active-color: #${subtext0} !important;
           --theme-select-background: #${surface0} !important;
           --theme-select-color: #${text} !important;
           --theme-select-hover-border-color: #${surface1} !important;
           --theme-contrast-background: #${yellow}40 !important;
           --theme-contrast-background-alpha: #${yellow}20 !important;
           --theme-contrast-color: #${subtext0} !important;
           --theme-contrast-border: #${yellow} !important;
           --table-selection-background-hover: #${surface0} !important;
           --tab-line-selected-color: #${crust}00 !important;
        }
        ::selection {
          background-color: #${surface2} !important;
        }
        .perf-photon-button-primary { background-color: #${surface0} !important; }
        .perf-photon-button-primary:hover { background-color: #${surface1} !important; }
        .devtools-tab-line { display: none !important; }
      }
    ''
