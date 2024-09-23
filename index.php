<?php 
require_once __DIR__ . '/vendor/autoload.php';

use booosta\Framework as b;
b::load();


class App extends booosta\usersystem\Webappuser
{
  protected function action_default()
  {
    if($this->get_user()?->get_user_type() == 'adminuser') header('Location: /admin');
    else header('Location: /user');
  }
}

$app = new App();
$app();
