<?php
$menu = [
         'Konfiguration' => [
                'Fragebogen' => 'collection',
                'Empfehlungen' => 'category',
                'Attachment' => 'attachment',
                'Vorlagen' => 'filelink',
         ],

         'User Administration' => [
                                    'Privileges' => '/admin_privilege',
                                    'Roles' => '/admin_role',
                                    'Adminuser' => '/admin_adminuser',
                                    'User' => '/admin_user',
                                    #'Privileges' => '{%base_dir}{%privileges_dir}exec/admin_privilege.php',
                                    #'Roles' => '{%base_dir}{%privileges_dir}exec/admin_role.php',
                                    #'Adminuser' => '{%base_dir}{%usersystem_dir}exec/admin_adminuser.php',
                                    #'User' => '{%base_dir}{%usersystem_dir}exec/admin_user.php',
                                  ],

         'Logout' => '/logout_adminuser',
         #'Logout' => '{%base_dir}{%usersystem_dir}exec/logout_adminuser.php',
        ];

$menuicons = [
        'Management' => '<i class="fas fa-pencil-alt"></i>',
        'User Administration' => '<i class="fa fa-user"></i>',
        'Konfiguration' => '<i class="fas fa-cogs"></i>',
        'Logout' => '<i class="fas fa-sign-out-alt"></i>',
            ];

$menu_always_open = ['Konfiguration', 'User Administration'];
