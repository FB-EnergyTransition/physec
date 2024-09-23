<?php
require_once __DIR__ . '/vendor/autoload.php';

use booosta\Framework as b;
b::load();


class App extends booosta\usersystem\Webappuser
{
  protected function action_default()
  {
    $this->hide_menu = true;

    $this->maintpl = "user_accept.tpl";
  }

  protected function action_accept()
  {
    $this->DB->query('update user set accepted=1 where id=?', $this->user_id);
    $this->redirect('/user');
  }
}

$app = new App();
$app->auth_user();
$app();
