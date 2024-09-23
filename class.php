<?php
require_once __DIR__ . '/vendor/autoload.php';

use booosta\Framework as b;
b::load();

class App extends booosta\usersystem\Webappadmin
{
  protected $use_subtablelink = false;
  protected $supername = 'collection';

  protected $urlhandler_action_paramlist = ['new' => 'action/collection'];


  protected function before_add_($data, $obj)
  {
    $newordernum = $this->DB->query_value('select coalesce(max(ordernum), 0)+1 from class');
    $obj->set('ordernum', $newordernum);
  }
}

$app = new App('class');
$app->auth_user();
$app();
