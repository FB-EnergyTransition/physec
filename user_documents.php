<?php
require_once __DIR__ . '/vendor/autoload.php';

use booosta\Framework as b;
b::load();


class App extends booosta\usersystem\Webappuser
{
  protected $fields = 'filename,view';
  protected $header = 'Name,Ansehen';

  protected $default_clause = "filename is not null and filename<>''";


  protected function in_default_makelist($list)
  {
    $list->add_replaces('view', '<i class="fa fa-eye"></i>');
    $list->add_link('view', 'upload/{file}');
  }

  protected function after_action_default()
  {
    $this->maintpl = 'documents.tpl';
  }
}

$app = new App('filelink');
$app->auth_user();
$app();