<?php
require_once __DIR__ . '/vendor/autoload.php';

use booosta\Framework as b;
b::load();

class App extends booosta\usersystem\Webappadmin
{
  protected $use_subtablelink = false;
  protected $supername = 'category';
  
  protected $checkbox_fields = 'attach';
  protected $null_fields = ['file','filelink','rtext','video','question'];
  protected $urlhandler_action_paramlist = ['new' => 'action/category'];
  protected $foreign_keys = ['question' => ['showfield' => 'qtext'], 'filelink' => ['showfield' => 'filename']];


  protected function before_add_($data, $obj)
  {
    $file = $this->uploaded_file_origname('file', 'upload/');
    $obj->set('file', $file['file']);
    $obj->set('filename', $file['origname']);
  }

  protected function before_edit_($id, $data, $obj)
  {
    $file = $this->uploaded_file_origname('file', 'upload/');

    if($file['file']):
      $obj->set('file', $file['file']);
      $obj->set('filename', $file['origname']);
    endif;
  }
}

$app = new App('result');
$app->auth_user();
$app();
