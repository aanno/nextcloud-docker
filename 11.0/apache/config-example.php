<?php
$CONFIG = array (
  'htaccess.RewriteBase' => '/nextcloud',
  'memcache.local' => '\\OC\\Memcache\\APCu',
  'apps_paths' =>
  array (
    0 =>
    array (
      'path' => '/var/www/html/nextcloud/apps',
      'url' => '/apps',
      'writable' => false,
    ),
    1 =>
    array (
      'path' => '/var/www/html/nextcloud/custom_apps',
      'url' => '/custom_apps',
      'writable' => true,
    ),
  ),
  'instanceid' => 'ocjlz5qiwx82',
  'passwordsalt' => 'x3rCQl18QDnaiStaXIa/OWyatTQBA0',
  'secret' => 'CHv01rd8DRUgQxjhJCrm3whIwnNEkKumsf7axNjvQ3olxgrL',
  'trusted_domains' =>
  array (
    0 => 'localhost',
  ),
  'datadirectory' => '/var/www/html/nextcloud/data',
  'overwrite.cli.url' => 'http://localhost/nextcloud',
  'dbtype' => 'sqlite3',
  'version' => '11.0.5.1',
  'logtimezone' => 'UTC',
  'installed' => true,
);
