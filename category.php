<?php
require_once __DIR__ . '/vendor/autoload.php';

use booosta\Framework as b;
b::load();

class App extends booosta\usersystem\Webappadmin
{
  protected $fields = 'name,answeroption,edit,delete';
  protected $header = 'Name,Antwortoption,Edit,Delete';
  protected $use_subtablelink = false;
  #protected $urlhandler_action_paramlist = ['test' => 'action/id'];
  protected $subname = 'result';
  protected $supername = 'answeroption';

  protected $sub_fields = 'filelink,rtext,video,link,edit,delete';
  protected $sub_header = 'Datei,Text,Video,Link,edit,delete'; 
  protected $subtable_sortable = true;
  protected $sub_default_order = 'ordernum';
  protected $sub_foreign_keys = [['filelink' => ['showfield' => 'filename']]];
  
  
  protected function in_sub_makelist($list, $index = 0)
  {
    $list->add_replaces('rtext', [function($val) { return htmlentities(substr($val, 0, 100)); }]);
  }
  
  protected function after_add_($data, $newid)
  {
    b::debug($data);
    $file = $this->uploaded_file_origname('file', 'upload/');

    if($file['file'] || $data['rtext'] || $data['video'] || $data['link']):
      $result = $this->makeDataobject('result', $data);
      $result->set('file', $file['file']);
      $result->set('filename', $file['origname']);

      $result->set('category', $newid);
      $question = $this->DB->query_value('select o.question from answeroption o, category c where c.answeroption=o.id and c.id=?', $newid);
      #b::debug("id: $newid, question: $question"); b::debug($this->DB->query_list('select * from category where id=?', $newid));
      $result->set('question', $question);

      $result->insert();
    endif;
  }
  
  protected function after_action_newdo()
  {
    $answeroption = $this->VAR['answeroption'];
    $this->backpage = "/answeroption/edit/$answeroption";
  }

  #protected function after_action_newdo() { $this->backpage = 'category'; }
  protected function after_action_editdo() { $this->backpage = 'category'; }
  protected function after_action_deleteyes() { $this->backpage = 'category'; }
}

#b::debug($_POST);
$app = new App('category');
$app->auth_user();
$app();
