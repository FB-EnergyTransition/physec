<?php
require_once __DIR__ . '/vendor/autoload.php';

use booosta\Framework as b;
b::load();

class App extends booosta\usersystem\Webappuser
{
  protected $fields = 'filename,view,edit,delete';
  protected $header = 'Datei,Ansehen,Edit,Delete';
  protected $sub_fields = 'dtime,filename,id';
  protected $sub_header = 'Versionierungszeitpunkt,Datei,Ansehen';
  #protected $use_datatable = true;
  protected $use_subtablelink = false;
  protected $subname = 'ahistory';


  protected $foreign_keys = ['user' => ['table' => 'user', 'showfield' => 'username'],];
  #protected $checkbox_fields = '';
  

  #protected $auth_actions = true;
  protected $use_userfield = true;
  
  
  protected function in_default_makelist($list)
  {
    $list->add_replaces('view', '<i class="fa fa-eye"></i>');
    $list->add_link('view', 'upload/{file}');
  }
  
  protected function in_sub_makelist($list, $index = 0)
  {
    #b::debug("in sub makelist $index");
    $list->add_replaces('id', '<i class="fa fa-eye"></i>');
    $list->add_link('id', 'upload/{file}');
  }
  
  protected function before_add_($data, $obj)
  {
    $file = $this->uploaded_file_origname('file', 'upload/');
    if($file === null) $this->raise_error('Dateiupload gescheitert');

    $obj->set('file', $file['file']);
    $obj->set('filename', $file['origname']);
  }
  
  protected function before_edit_($id, $data, $obj)
  {
    $file = $this->uploaded_file_origname('file', 'upload/');

    if($file['file']):
      $obj->set('file', $file['file']);
      $obj->set('filename', $file['origname']);

      if($data['keep']):
        $ahistory = $this->makeDataobject('ahistory');
        $ahistory->set('attachment', $id);
        $ahistory->set('dtime', date('Y-m-d H:i:s'));
        $ahistory->set('file', $this->old_data('file'));
        $ahistory->set('filename', $this->old_data('filename'));

        $ahistory->insert();
      endif;
    endif;
  }
}

$app = new App('attachment');
$app->auth_user();
$app();
