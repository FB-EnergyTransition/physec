<?php
require_once __DIR__ . '/vendor/autoload.php';

use booosta\Framework as b;
b::load();

class App extends booosta\usersystem\Webappadmin
{
  protected $fields = 'user,filename,delete';
  protected $header = 'User,Name,Delete';
  protected $use_subtablelink = false;
  #protected $urlhandler_action_paramlist = ['test' => 'action/id'];

  protected $foreign_keys = ['user' => ['table' => 'user', 'showfield' => 'username'],];
  #protected $checkbox_fields = '';
  
  
  protected function before_add_($data, $obj)
  {
    $file = $this->uploaded_file_origname('file', 'upload/');
    if($file === null) $this->raise_error('Dateiupload gescheitert');

    $obj->set('file', $file['file']);
    $obj->set('filename', $file['origname']);
  }
  
  
  
}

$app = new App('attachment');
$app->auth_user();
$app();
