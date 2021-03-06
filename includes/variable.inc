<?php

// Note that this stuff can override what was set in the installation process!

// Basic site information:
variable_set('site_footer', 'Copyright © 2011, <a href="http://www.ccsu.edu/imrp">Institute for Municipal and Regional Policy</a> at <a href="http://www.ccsu.edu">Central Connecticut State University</a>.');
variable_set('site_mail', 'imrp@ccsu.edu');
variable_set('site_name', 'Release');
variable_set('site_offline_message', "The Release website is currently offline for maintenance. Our apologies for the interruption.");
variable_set('site_slogan', 'News related to Connecticut\'s formerly incarcerated citizens and the organizations that serve them');
variable_set('site_mission', '');

// Core notification settings.
variable_set('update_check_frequency', "1");
variable_set('update_notification_threshold', "all");
variable_set('update_notify_emails', array(0 => "imrp@ccsu.edu"));

// Core node settings.
// Don't have anything here yet.
variable_set('site_frontpage', 'frontpage');
variable_set('default_nodes_main', "5");
variable_set('node_preview', "0");
variable_set('teaser_length', "200");

// Disable core blocks
variable_set('context_reaction_block_disable_core', "1");

// Filter settings.
variable_set('allowed_html_1', "<a> <i> <em> <b> <strong> <cite> <code> <ul> <ol> <li> <dl> <dt> <dd>");
variable_set('filter_html_1', "1");
variable_set('filter_html_help_1', 1);
variable_set('filter_html_nofollow_1', 0);
variable_set('filter_url_length_1', "72");
variable_set('format', "1");

// Theme settings.

variable_set('theme_settings', array(
    'toggle_logo' => 1,
    'toggle_name' => 1,
    'toggle_slogan' => 1,
    'toggle_mission' => 0,
    'toggle_node_user_picture' => 0,
    'toggle_comment_user_picture' => 0,
    'toggle_search' => 0,
    'toggle_favicon' => 1,
    'toggle_primary_links' => 1,
    'toggle_secondary_links' => 0,
    'toggle_node_info_release_article' => 1,
    'default_logo' => 1,
    'logo_path' => '',
    'logo_upload' => '',
    'default_favicon' => 1,
    'favicon_path' => '',
    'favicon_upload' => '',
));

// Use admin theme for editing nodes
variable_set('node_admin_theme', 1);

// Performance settings
variable_set('preprocess_css', "theme");

// Nodequeue settings
variable_set('nodequeue_links', 0);

// Date settings
variable_set('date_db_tz_support', 0);
variable_set('date_default_timezone', -14400);
variable_set('date_default_timezone_name', "America/New_York");
variable_set('date_first_day', 0);
variable_set('date_format_long', "l, F j, Y - H:i");
variable_set('date_format_medium', "D, Y-m-d H:i");
variable_set('date_format_short', "Y-m-d H:i");

// Image settings.
variable_set('imageapi_image_toolkit', "imageapi_gd");
variable_set('image_toolkit', "gd");

// Messaging settings.
variable_set('messaging_default_method', "mimemail");
variable_set('messaging_filters_mail', array("body_format" => "2", "filter" => "messaging_html"));
variable_set('messaging_filters_mimemail', array("body_format" => "2", "filter" => "messaging_html"));
variable_set('messaging_mail_default_from', "newsletter@releasenews.org");
variable_set('messaging_mail_returnpath', "imrp@ccsu.edu");
variable_set('messaging_mail_sender_format', "Release <newsletter@releasenews.org>");
variable_set('messaging_method_enabled', array("mail" => "mail", "mimemail" => "mimemail"));
variable_set('messaging_method_mail', array("name" => "Mail", "queue" => 0, "log" => 0));
variable_set('messaging_method_mimemail', array("name" => "Mail", "queue" => 0, "log" => 0));

// Mimemail settings

variable_set('mimemail_engine', "mimemail");
variable_set('mimemail_name', "Release");
variable_set('mimemail_mail', "imrp@ccsu.edu");
variable_set('mimemail_alter', 0);
variable_set('mimemail_simple_address', 0);
variable_set('mimemail_sitestyle', 0);
variable_set('mimemail_format', "2");
variable_set('mimemail_textonly', 0);

// Admin settings
  variable_set('admin_toolbar', array(
    'layout' => "horizontal",
    'position' => "sw",
    'behavior' => "df",
    'blocks' => array
        (
            'context_ui-editor' => -1,
            'context_ui-devel' => -1,
            'admin-create' => -1,
            'admin-theme' => 1,
            'admin-account' => -1,
            'admin-menu' => 1,
            'admin-devel' => -1
        )

  ));

// Admin Menu settings
variable_set('admin_menu_margin_top', 1);
variable_set('admin_menu_position_fixed', 1);
variable_set('admin_menu_tweak_modules', 1);
variable_set('admin_menu_tweak_tabs', 0);

// Vertical Tabs settings
variable_set('vertical_tabs_default', 1);
variable_set('vertical_tabs_minimum', 1);
variable_set('vertical_tabs_node_type_settings', 0);

// Quicktabs settings
variable_set('quicktabs_tabstyle', "Sky");

// Pathauto settings
variable_set('pathauto_node_release_article_pattern', 'article/[mm]-[dd]-[yyyy]/[title-raw]');
variable_set('pathauto_reduce_ascii', 1);
variable_set('pathauto_update_action', "1");
variable_set('pathauto_max_bulk_update', "100");

// Pagination settings

variable_set('pagination_collapsed', 1);
variable_set('pagination_filter', 1);
variable_set('pagination_header', 3);
variable_set('pagination_ignore', "");
variable_set('pagination_list_type', "ul");
variable_set('pagination_onebased', 1);
variable_set('pagination_showall', 0);

// Contact form settings.
variable_set('contact_default_status', 0);
variable_set('contact_form_information', "Run into a bug on our site? Spot inaccurate information? Just plain don't like something and want us to know? Leave a message for the site webmaster using the contact form below.");
variable_set('contact_hourly_threshold', 3);

$contact_info = array (
    array("cid" => 1, "category" => "Feedback about site", "recipients" => "imrp@ccsu.edu", "reply" => '', "weight" => 0, "selected" => 1),
    array("cid" => 2, "category" => "Help with using the site", "recipients" => "imrp@ccsu.edu", "reply" => '', "weight" => 0, "selected" => 0),
    array("cid" => 3, "category" => "Wrong information on site", "recipients" => "imrp@ccsu.edu", "reply" => '', "weight" => 0, "selected" => 0),
    array("cid" => 4, "category" => "Request for further information", "recipients" => "imrp@ccsu.edu", "reply" => '', "weight" => 0, "selected" => 0),
);

foreach ($contact_info as $values) {
    db_query("INSERT INTO {contact} (cid, category, recipients, reply, weight, selected) VALUES ('%s', '%s', '%s', '%s', '%s', '%s')", $values);
}
?>
