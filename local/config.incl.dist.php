<?php
namespace booosta;

Framework::$CONFIG = [
'site_name'              => '{sitename}',
'page_title'             => '{sitename}',
'page_title_short'       => '{sitename_short}',
'allow_registration'     => true,
'confirm_registration'   => true,
'aes256_keyfile'         => 'local/key.php',
'language'               => 'de',
'template_module'        => 'adminlte',
  
'db_module'              => '{db_module}',
'db_hostname'            => '{db_hostname}',
'db_user'                => '{db_user}',
'db_password'            => '{db_password}',
'db_database'            => '{db_database}',

'mail_sender'            => '{mail_sender}',
'mail_backend'           => '{mail_backend}',
'mail_smtp_params'       => [ 'host' => '{smtp_host}', 'auth' => true, 'username' => '{smtp_username}', 'password' => '{smtp_password}' ],

'use_edit_delete_pics'   => true,
'use_encrypted_ids'      => true,

'jquery_loaded'          => true,
'bootstrap_loaded'       => true,
'datatables_loaded'      => true,
'always_load_jquery'     => false,
'use_bootstrap_select'   => true,
'templateparser_defaultvars' => ['boxsize' => '12,12,12,12'],

'index_user'             => 'user_questions/start',

# usually you do not need to change anything beyond this line

'DEBUG_MODE'             => false,
'LOG_MODE'               => false,
'BACKUPMODE'             => false,

'serial_field'           => ['usersettings', 'conditions', 'categorizers', 'implemented'],
'ESCAPE_CURL'            => false,
'NO_DBCONNECT'           => false,

];
