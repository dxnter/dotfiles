// disable about:config warning
user_pref('browser.aboutConfig.showWarning', false);

// disable default browser check
user_pref('browser.shell.checkDefaultBrowser', false);

// disable some Activity Stream items
// Activity Stream is the default homepage/newtab based on metadata and browsing behavior
user_pref('browser.newtabpage.activity-stream.feeds.telemetry', false);
user_pref('browser.newtabpage.activity-stream.telemetry', false);
user_pref('browser.newtabpage.activity-stream.feeds.snippets', false);
user_pref('browser.newtabpage.activity-stream.feeds.section.topstories', false);
user_pref(
  'browser.newtabpage.activity-stream.section.highlights.includePocket',
  false
);
user_pref('browser.newtabpage.activity-stream.showSponsored', false);
user_pref(
  'browser.newtabpage.activity-stream.feeds.discoverystreamfeed',
  false
);
user_pref('browser.newtabpage.activity-stream.showSponsoredTopSites', false);

// clear default topsites
user_pref('browser.newtabpage.activity-stream.default.sites', '');

// set preferred language for displaying pages
user_pref('intl.accept_languages', 'en-US, en');

// disable recommendation pane in about:addons (uses Google Analytics)
user_pref('extensions.getAddons.showPane', false);
// disable recommendations in about:addons' Extensions and Themes panes
user_pref('extensions.htmlaboutaddons.recommendations.enabled', false);

// TELEMETRY
// disable new data submission
user_pref('datareporting.policy.dataSubmissionEnabled', false);
// disable Health Reports
user_pref('datareporting.healthreport.uploadEnabled', false);
// disable telemetry
user_pref('toolkit.telemetry.unified', false);
user_pref('toolkit.telemetry.enabled', false);
user_pref('toolkit.telemetry.server', 'data:,');
user_pref('toolkit.telemetry.archive.enabled', false);
user_pref('toolkit.telemetry.newProfilePing.enabled', false);
user_pref('toolkit.telemetry.shutdownPingSender.enabled', false);
user_pref('toolkit.telemetry.updatePing.enabled', false);
user_pref('toolkit.telemetry.bhrPing.enabled', false);
user_pref('toolkit.telemetry.firstShutdownPing.enabled', false);
// disable Telemetry Coverage
user_pref('toolkit.telemetry.coverage.opt-out', true);
user_pref('toolkit.coverage.opt-out', true);
user_pref('toolkit.coverage.endpoint.base', '');
// disable PingCentre telemetry (used in several System Add-ons)
user_pref('browser.ping-centre.telemetry', false);
user_pref('browser.tabs.crashReporting.sendReport', false);
user_pref('devtools.onboarding.telemetry.logged', false);

// STUDIES
// disable Studies
user_pref('app.shield.optoutstudies.enabled', false);
// disable Normandy/Shield
user_pref('app.normandy.enabled', false);
user_pref('app.normandy.api_url', '');

// CRASH REPORTS
// disable Crash Reports
user_pref('breakpad.reportURL', '');
user_pref('browser.tabs.crashReporting.sendReport', false);
user_pref('browser.crashReports.unsubmittedCheck.enabled', false);
// enforce no submission of backlogged Crash Reports
user_pref('browser.crashReports.unsubmittedCheck.autoSubmit2', false);

// disable media cache from writing to disk in Private Browsing
user_pref('browser.privatebrowsing.forceMediaMemoryCache', true);
user_pref('media.memory_cache_max_size', 65536);

// don't recommend extensions as you browse
user_pref(
  'browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons',
  false
);
// don't recommend features as you browse
user_pref(
  'browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features',
  false
);

user_pref('extensions.pocket.enabled', false);
user_pref('browser.tabs.loadBookmarksInBackground', true);
user_pref('findbar.modalHighlight', true);
user_pref('findbar.highlightAll', true);
user_pref('browser.tabs.tabMinWidth', 5);
user_pref('dom.disable_beforeunload', true);
user_pref('narrate.enabled', false);

// prevents websites from blocking clipboard usage; helpful when pasting passwords from a password manager
user_pref('dom.event.clipboardevents.enabled', false);

// GRAPHICS
user_pref('gfx.webrender.all', true);
user_pref('gfx.webrender.enabled', true);
user_pref('layers.gpu-process.enabled', true);
user_pref('layers.acceleration.force-enabled', true);
user_pref('layers.offmainthreadcomposition.enabled', true);
user_pref('gfx.webrender.compositor', true);
user_pref('gfx.webrender.compositor.force-enabled', true);
