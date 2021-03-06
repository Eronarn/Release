<?php

// This installation profile is based on the work of Fuse Interactive.
// http://fuseinteractive.ca/blog/getting-started-drupal-install-profiles

// It also draws upon Open Atrium's profile.

function release_profile_details() {
    return array(
        'name' => 'Release',
        'description' => 'Installation profile for Release.',
    );
}
 
/**
 * Return an array of the modules to be enabled when this profile is installed.
 *
 * @return
 *  An array of modules to be enabled.
 */
function release_profile_modules() {
  return array(
    // Enable required core modules first.
    'block',
    'filter',
    'node',
    'system',
    'user',

    // Enable optional core modules next.
//    'comment',
    'contact',
    'dblog',
    'help',
    'menu',
    'path',
//    'search',
    'taxonomy',
  
    // The rest are contrib modules, sorted by makefile:

    // admin.make
    'backup_migrate',
    'backup_migrate_files',
    'devel',
    'devel_generate',
//    'performance',
//    'googleanalytics', Temporarily disabled.
    'node_import',
// Installed later because it depends on Ctools.
//    'strongarm',

    // basic.make
    'content_profile',
    'content_profile_registration',
    'content_profile_tokens',
// Installed later because they depend on Ctools.
//    'context',
//    'context_layouts',
//    'context_ui',
    'ctools',
    'page_manager',
    
    'date',
    'date_api',
    'date_popup',
    'date_repeat',
    'date_timezone',
    'features',
//    'modalframe', // Installed later because it depends on Jquery.
    'node_tools',
    'rules',
    'rules_admin',
    'token',
    'transliteration',
    'imageapi',
    'imageapi_gd',
    'imagecache',
    'imagecache_ui',
    'nodequeue',

    // cck.make
    'conditional_fields',
    'content',
    'content_copy',
    'content_taxonomy',
    'content_taxonomy_autocomplete',
    'content_taxonomy_options',
    'content_taxonomy_tree',
    'email',
    'emfield',
    'emvideo',
    'fieldgroup',
    'filefield',
    'imagefield',
    'link',
    'media_youtube',
    'media_vimeo',
    'nodereference',
    'noderelationships',
    'number',
    'optionwidgets',
    'phone',

//    'reverse_node_reference', // Installed later because it depends on db_version.
    'text',
    'userreference',
 
    // interaction.make
    'autoload',
//    'messaging',
//    'messaging_mail',
//    'messaging_mime_mail',
//    'messaging_template',
      'mimemail',
//    'notifications_anonymous',
//    'notifications_content',
//    'notifications_nodetype',
//    'notifications_digest',
//    'notifications',
//    'notifications_ui',

    // panels.make
    'panels',

    // seo.make
//    'nodewords_admin',
//    'nodewords_basic',
//    'nodewords',
    'pathauto',
    'pathauto_persist',
//    'page_title',
//    These two are enabled later due to hanging during install.
//    'subpath_alias',
//    'url_alter',
//    'xmlsitemap',

    // ui.make
    'blocks404',
    'admin',
    'admin_menu',
    'advanced_help',
    'better_formats',
    'cmf',
    'hierarchical_select',
    'hs_content_taxonomy',
    'hs_taxonomy',
    'hs_taxonomy_views',
    'hs_menu',
    'ie_css_optimizer',
    'lightbox2',
    'logintoboggan',
    'pagination',
    'quicktabs',
    'taxonomy_manager',
    'vertical_tabs',
    'vt_default',

    'jquery_ui',
    'jquery_ui_dialog',
    'jquery_update',

    // views.make
    'views',
    'views_customfield',
    'views_export',
    'views_or',
    'views_rss',
    'views_slideshow',
    'views_slideshow_singleframe',
    'views_ui',

    // workflow.make
    'diff',
    'override_node_options',
    'revisioning',

    // (STUB) wysiwyg.make

    // Bundled modules
    'release_feature'
  );
}
 
/**
 * Reimplementation of system_theme_data(). The core function's static cache
 * is populated during install prior to active install profile awareness.
 * This workaround makes enabling themes in profiles/[profile]/themes possible.
 */
function _release_system_theme_data() {
  global $profile;
  $profile = 'release';
 
  $themes = drupal_system_listing('\.info$', 'themes');
  $engines = drupal_system_listing('\.engine$', 'themes/engines');
 
  $defaults = system_theme_default();
 
  $sub_themes = array();
  foreach ($themes as $key => $theme) {
    $themes[$key]->info = drupal_parse_info_file($theme->filename) + $defaults;
 
    if (!empty($themes[$key]->info['base theme'])) {
      $sub_themes[] = $key;
    }
 
    $engine = $themes[$key]->info['engine'];
    if (isset($engines[$engine])) {
      $themes[$key]->owner = $engines[$engine]->filename;
      $themes[$key]->prefix = $engines[$engine]->name;
      $themes[$key]->template = TRUE;
    }
 
    // Give the stylesheets proper path information.
    $pathed_stylesheets = array();
    foreach ($themes[$key]->info['stylesheets'] as $media => $stylesheets) {
      foreach ($stylesheets as $stylesheet) {
        $pathed_stylesheets[$media][$stylesheet] = dirname($themes[$key]->filename) .'/'. $stylesheet;
      }
    }
    $themes[$key]->info['stylesheets'] = $pathed_stylesheets;
 
    // Give the scripts proper path information.
    $scripts = array();
    foreach ($themes[$key]->info['scripts'] as $script) {
      $scripts[$script] = dirname($themes[$key]->filename) .'/'. $script;
    }
    $themes[$key]->info['scripts'] = $scripts;
 
    // Give the screenshot proper path information.
    if (!empty($themes[$key]->info['screenshot'])) {
      $themes[$key]->info['screenshot'] = dirname($themes[$key]->filename) .'/'. $themes[$key]->info['screenshot'];
    }
  }
 
  foreach ($sub_themes as $key) {
    $themes[$key]->base_themes = system_find_base_themes($themes, $key);
    // Don't proceed if there was a problem with the root base theme.
    if (!current($themes[$key]->base_themes)) {
      continue;
    }
    $base_key = key($themes[$key]->base_themes);
    foreach (array_keys($themes[$key]->base_themes) as $base_theme) {
      $themes[$base_theme]->sub_themes[$key] = $themes[$key]->info['name'];
    }
    // Copy the 'owner' and 'engine' over if the top level theme uses a
    // theme engine.
    if (isset($themes[$base_key]->owner)) {
      if (isset($themes[$base_key]->info['engine'])) {
        $themes[$key]->info['engine'] = $themes[$base_key]->info['engine'];
        $themes[$key]->owner = $themes[$base_key]->owner;
        $themes[$key]->prefix = $themes[$base_key]->prefix;
      }
      else {
        $themes[$key]->prefix = $key;
      }
    }
  }
 
  // Extract current files from database.
  system_get_files_database($themes, 'theme');
  db_query("DELETE FROM {system} WHERE type = 'theme'");
  foreach ($themes as $theme) {
    $theme->owner = !isset($theme->owner) ? '' : $theme->owner;
    db_query("INSERT INTO {system} (name, owner, info, type, filename, status, throttle, bootstrap) VALUES ('%s', '%s', '%s', '%s', '%s', %d, %d, %d)", $theme->name, $theme->owner, serialize($theme->info), 'theme', $theme->filename, isset($theme->status) ? $theme->status : 0, 0, 0);
  }
}
 
 
/**
 * Implementation of hook_profile_tasks().
 */
function release_profile_tasks(&$task, $url) {

    // First, we need to install some modules that would break the normal install hook.
    module_rebuild_cache();
    drupal_install_modules(array('strongarm', 'modalframe', 'reverse_node_reference', 'context', 'context_layouts', 'context_ui', 'subpath_alias', 'url_alter'));
    module_rebuild_cache();
    drupal_install_modules(array('messaging', 'messaging_mail', 'messaging_mime_mail', 'messaging_template'));
    module_rebuild_cache();
    drupal_install_modules(array('notifications'));
    module_rebuild_cache();
    drupal_install_modules(array('notifications_anonymous', 'notifications_content', 'notifications_nodetype', 'notifications_digest', 'notifications_ui'));

    // By now, all modules are installed.

    // Other tasks are broken out into includes for readability:
    set_include_path(dirname(__FILE__) . DIRECTORY_SEPARATOR . '/includes');

    // Theme installation and configuring.
    require("theme.inc");

    // Set various site variables, options, and settings.
    require("variable.inc");

    // Notifications settings
    require("notifications.inc");

    // Lightbox settings
    require("lightbox2.inc");

    // Set up content types.
    require("content_type.inc");

    // Users that should be created at install.
    require("user.inc");

    // We're done! Clear caches again, just to be safe.
    drupal_flush_all_caches();
}

function release_profile_final() {
    // Nothing to do here, yet!
    return;
}
?>
