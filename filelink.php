<?php
require_once __DIR__ . '/vendor/autoload.php';

use booosta\Framework as b;
b::load();

class App extends booosta\usersystem\Webappadmin
{
  protected $fields = 'filename,view,edit,delete';
  protected $header = 'Dateiname,Ansehen,Edit,Delete';
  protected $use_subtablelink = false;
  #protected $urlhandler_action_paramlist = ['test' => 'action/id'];
  #protected $checkbox_fields = '';
  
  
  protected function in_default_makelist($list)
  {
    $list->add_replaces('view', '<i class="fa fa-eye"></i>');
    $list->add_link('view', 'upload/{file}');
  }

  protected function before_add_($data, $obj)
  {
    $file = $this->uploaded_file_origname('file', 'upload/');
    $obj->set('file', $file['file']);
    $obj->set('filename', $data['filename'] ?: $file['origname']);
  }

  protected function before_edit_($id, $data, $obj)
  {
    $file = $this->uploaded_file_origname('file', 'upload/');

    if($file['file']):
      $obj->set('file', $file['file']);
      $obj->set('filename', $data['filename'] ?: $file['origname']);
    endif;
  }
}
  
$app = new App('filelink');
$app->auth_user();
$app();
