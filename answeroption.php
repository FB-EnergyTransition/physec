<?php
require_once __DIR__ . '/vendor/autoload.php';

use booosta\Framework as b;
b::load();

include_once 'incl/classes.php';


class App extends booosta\usersystem\Webappadmin
{
  protected $fields = 'answertext,edit,delete';
  protected $header = 'Text,Edit,Delete';
  protected $sub_fields = 'name,edit,delete';
  protected $sub_header = 'Name,Edit,Delete';
  protected $use_subtablelink = false;
  protected $supername = 'question';
  protected $subname = 'category';
  protected $sortclause = 'question={id}';
  protected $urlhandler_action_paramlist = ['new' => 'action/question'];


  protected function before_add_($data, $obj)
  {
    $obj->set('ordernum', $this->DB->query_value('select coalesce(max(ordernum)+1, 1) from answeroption where question=?', $data['question']));
  }

  protected function after_add_($data, $newid)
  {
    if($data['newcategory']):
      // add new category
      $question_id = $data['question'];
      $name = substr($data['newcategory'], 0, 80);
      $ordernum = $this->DB->query_value('select coalesce(max(ordernum)+1, 1) from category where answeroption=?', $newid);

      $category = $this->makeDataobject('category');
      $category->set('answeroption', $newid);
      $category->set('name', $name);
      $category->set('ordernum', $ordernum);
      $category_id = $category->insert();

      // add new result in this category
      $result = $this->makeDataobject('result');
      $result->set('category', $category_id);
      $result->set('question', $question_id);
      $result->set('rtext', $data['newcategory']);
      $result->set('ordernum', $this->DB->query_value('select coalesce(max(ordernum)+1, 1) from result where category=?', $category_id));
      $result->insert();
    endif;
  }
}

$app = new App('answeroption');
$app->auth_user();
$app();
