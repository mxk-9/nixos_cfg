let
  colors = import ../colors.nix;
in with colors.dark; ''
      :root {
        --srf-primary: #${base};
        --srf-secondary: #${mantle};
        --srf-text: #${text};
        --srf-accent: #${mauve};
      }
      window,
      #main-window,
      #toolbar-menubar,
      #TabsToolbar,
      #PersonalToolbar,
      #navigator-toolbox,
      #sidebar-box {
        background-color: #${base} !important;
        -moz-appearance: none !important;
        background-image: none !important;
        border: none !important;
        box-shadow: none !important;
      }
      ::selection {
        background-color: #${mauve};
        color: #${base};
      }
      :root {
        --tabs-border: transparent !important;
        --inactive-titlebar-opacity: 1 !important;
      }
      .tab-background {
        border: none !important;
        border-radius: 0!important;
        margin: 0!important;
        margin-left: -1.6px!important;
        padding: 0!important;
      }
      .tab-background[selected] {
        -moz-appearance: none !important;
        background-image: none !important;
        background-color: #${mantle}!important;
      }
      .tabbrowser-tabs {
        border: none !important;
        opacity: 0 !important;
      }
      .tabbrowser-tab::before, .tabbrowser-tab::after{
        opacity: 0 !important;
        border-left: none !important;
      }
      #tabbrowser-tabs {
        --tab-loading-fill: unset !important;
      }
      .titlebar-placeholder {
        border: none !important;
      }
      .tab-line {
        display: none !important;
      }
      #back-button,
      #forward-button,
      #whats-new-menu-button,
      #star-button,
      #pocket-button,
      #save-to-pocket-button
      #pageActionSeparator,
      #pageActionButton,
      #reader-mode-button,
      #urlbar-zoom-button,
      #identity-box,
      #PanelUI-button,
      #tracking-protection-icon-container {
        display: none !important;
      }
      #context-navigation,
      #context-savepage,
      #context-pocket,
      #context-sendpagetodevice,
      #context-selectall,
      #context-viewsource,
      #context-inspect-a11y,
      #context-sendlinktodevice,
      #context-openlinkinusercontext-menu,
      #context-bookmarklink,
      #context-savelink,
      #context-savelinktopocket,
      #context-sendlinktodevice,
      #context-searchselect,
      #context-sendimage,
      #context-print-selection,
      #context_bookmarkTab,
      #context_moveTabOptions,
      #context_sendTabToDevice,
      #context_reopenInContainer,
      #context_selectAllTabs,
      #context_closeTabOptions {
        display: none !important;
      }
      #save-to-pocket-button {
        visibility: hidden !important;
      }
      .titlebar-spacer {
        display: none !important;
      }
      .tabbrowser-tab:not([pinned]) .tab-close-button {
        display: none !important;
      }
      .tabbrowser-tab:not([pinned]) .tab-icon-image {
        display: none !important;
      }
      .tabbrowser-tab
        >.tab-stack
        > .tab-background { box-shadow: none !important;  }

      #navigator-toolbox::after {
        border-bottom: 0px !important;
        border-top: 0px !important;
      }
      #nav-bar {
        background: #${mantle} !important;
        border: none !important;
        box-shadow: none !important;
        margin-top: 0px !important;
        border-top-width: 0px !important;
        margin-bottom: 0px !important;
        border-bottom-width: 0px !important;
      }
      #history-panel,
      #sidebar-search-container,
      #bookmarksPanel {
        background: #${base} !important;
      }
      #search-box {
        -moz-appearance: none !important;
        background: #${base} !important;
        border-radius: 6px !important;
      }
      #sidebar-search-container {
        background-color: #${base} !important;
      }
      #sidebar-icon {
        display: none !important;
      }
      .sidebar-placesTree {
        color: #${text} !important;
      }
      #sidebar-switcher-target {
        color: #${text} !important;
      }
      #sidebar-header {
        background: #${base} !important;
      }
      #sidebar-box {
        --sidebar-background-color: #${base} !important;
      }
      #sidebar-splitter {
        border: none !important;
        opacity: 1 !important;
        background-color: #${base} !important;
      }
      .urlbarView {
        display: none !important;
      }
      #urlbar-input-container {
        background-color: #${mantle} !important;
        border: 1px solid rgba(0, 0, 0, 0) !important;
        border-radius: 0!important;
      }
      #urlbar-container {
        margin-left: 8px !important;
      }
      #urlbar[focused='true'] > #urlbar-background {
        box-shadow: none !important;
      }
      .urlbarView-url {
        color: #${text} !important;
      }
      .titlebar-buttonbox-container { 
        display: none !important;
      }
      #urlbar-go-button {
        display: none !important;
      }
      #alltabs-button {
        display: none !important;
      }
      #unified-extensions-button { 
        color: #${mantle} !important; 
      }
      .sidebar-placesTreechildren::-moz-tree-row {
        height: 2.2em !important; 
      }
      #context-navigation, #context-sep-navigation { 
        display: none !important 
      }
      #toolbar-menubar {
        display: none !important;
      }
      #browser vbox#appcontent tabbrowser,
      #content, #tabbrowser-tabpanels,
      browser[type=content-primary],
      browser[type=content] > html { 
        background: #${base} !important;
      }
      #star-button-box {
        display: none !important;
      }
      #pageAction-urlbar-_testpilot-containers {
        display: none !important;
      }
      .tab-secondary-label {
        font-size: .85em !important;
        text-transform: lowercase !important;
        opacity: 0.69 !important;
      }
      .tab-icon-overlay {
        fill-opacity: 0.69 !important;
      }
      .infobar {
        background-color: #${base} !important;
        margin: 0px !important;
        border-radius: 0px !important;
        border: none !important;
      }
      .infobar::before {
        display: none !important;
      }

''
