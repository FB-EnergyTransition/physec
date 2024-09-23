<?php
require_once __DIR__ . '/vendor/autoload.php';

use booosta\Framework as b;
b::load();

include_once 'incl/classes.php';

#unset($_SESSION['last_ordernum']);

class App extends booosta\usersystem\Webappuser
{
  use Chart, Tools;

  protected function action_default()
  {
    $this->check_accepted();

    $collection_id = $this->DB->query_value('select id from collection where disabled=0');
    $collection = $this->makeInstance('Collection', $collection_id);

    $answerform_id = $this->DB->query_value('select id from answerform where user=? and collection=?', [$this->user_id, $collection_id]);
    $finished = $this->DB->query_value('select finished from answerform where id=?', $answerform_id);
    if($answerform_id) $answerform = $this->makeInstance('Answerform', $answerform_id);

    $questions = $collection->getQuestions($answerform);
    #b::debug(array_keys($questions));
    $last_ordernum = $_SESSION['last_ordernum'] ?? 0;
    #b::debug("last_ordernum: $last_ordernum");

    if($this->VAR['button'] == 'previous') $ordernum = $this->getPreviousKey($questions, $last_ordernum);
    else $ordernum = $this->getNextKey($questions, $last_ordernum);
    #b::debug("ordernum: $ordernum");

    if($ordernum !== null):
      $next_question = $questions[$ordernum];
      $this->TPL['question'] = $next_question->get_html($answerform);
      if($finished) $this->TPL['show_results'] = true;

      $this->maintpl = 'user_questions.tpl';
    else:  // all questions are answered
      unset($_SESSION['last_ordernum']);
      unset($_SESSION['filter_questions']);

      $this->DB->query("update answerform set finished='1' where id=?", $answerform_id);
      $this->redirect('/user_dashboard');
    endif;
  }

  protected function action_showresults()
  {
    $_SESSION['last_ordernum'] = -1;
    $this->action_default();
  }

  protected function action_start()
  {
    $this->check_accepted();

    $collection_id = $this->DB->query_value('select id from collection where disabled=0');
    $answerform_id = $this->DB->query_value('select id from answerform where user=? and collection=?', [$this->user_id, $collection_id]);
    $finished = $this->DB->query_value('select finished from answerform where id=?', $answerform_id);
    #b::debug("user: $this->user_id, collection: $collection_id, answerform: $answerform_id, finished: $finished");
    
    if($finished) $this->action_showresults(); else $this->action_default();
  }

  protected function action_saveresults()
  {
    $collection_id = $this->DB->query_value("select id from collection where disabled='0'");
    $obj = $this->getDataobject('answerform', "collection='$collection_id' and user='$this->user_id'");

    if(is_object($obj) && $obj->is_valid()):
      // if there are new implemented recommandations, redirect to the related questions
      $old_implemented = $obj->get('implemented') ?? [];
      $new_implemented = $this->VAR['implemented'] ?? [];
      $additonals = array_diff_key($new_implemented, $old_implemented);
      b::debug($additonals); b::debug($new_implemented); b::debug($old_implemented);
      $addional_questions = [];
      
      foreach($additonals as $result => $dummy):
        $ordernum = $this->DB->query_value('select q.ordernum from question q, result r where r.id=? and r.question=q.id', $result);
        $addional_questions[$ordernum] = $dummy;
      endforeach;

      $_SESSION['filter_questions'] = $addional_questions;

      $obj->set('implemented', $new_implemented ?? []);
      $obj->update();

      #b::debug($addional_questions);
      if(sizeof($_SESSION['filter_questions'])) $this->redirect('/user_questions');
      else $this->action_showresults();
    else:
      $this->action_showresults();
    endif;
  }

  protected function action_answer()
  {
    $this->check_accepted();

    $this->id = intval($this->VAR['question']);
    $obj = $this->getDataobject('question', $this->id);

    $collection_id = $this->DB->query_value('select collection from question where id=?', $this->id);

    $form = $this->getDataobject('answerform', "user='$this->user_id' and collection='$collection_id'", true);
    $form->set('user', $this->user_id);
    $form->set('collection', $collection_id);
    $form->set('dtime', date('Y-m-d H:i:s'));
    $form_id = $form->save();

    $type = $obj->get('type');

    if($type == 'check'):
      $answer = $this->getDataobject('answer', "question='$this->id' and answerform='$form_id'", true);
      $answer->set('question', $this->id);
      $answer->set('answerform', $form_id);
      $answer_id = $answer->save();

      $this->DB->query('delete from answer_option where answer=?', $answer_id);
      $answers = $this->VAR['answer'];
      if(!is_array($answers)) $answers = [$answers];

      foreach($answers as $ao_id => $a):
        if($a == '') continue;

        $aopt = $this->makeDataobject('answer_option');
        $aopt->set('answer', $answer_id);
        $aopt->set('answeroption', $ao_id);
        $aopt->insert();
      endforeach;
    elseif($type == 'radio'):
      $answer = $this->getDataobject('answer', "question='$this->id' and answerform='$form_id'", true);
      $answer->set('question', $this->id);
      $answer->set('answerform', $form_id);
      $answer->set('answeroption', $this->VAR['answer']);
      $answer->save();
    else:
      if($type == 'bool') $this->VAR['answer'] = $this->VAR['answer'] == 'on' ? 1 : 0;

      $answer = $this->getDataobject('answer', "question='$this->id' and answerform='$form_id'", true);
      $answer->set('question', $this->id);
      $answer->set('answerform', $form_id);
      $answer->set('atext', $this->VAR['answer']);
      $answer->save();
    endif;

    $_SESSION['last_ordernum'] = $obj->get('ordernum');
    $this->action_default();
  }

  protected function getNextKey($arr, $last_key)
  {
    #b::debug("last_key: $last_key");
    #b::debug(array_keys($arr));
    if($last_key === -1) return null;  // questions interrupted

    $filter = $_SESSION['filter_questions'] ?? [];
    if(sizeof($filter)) $arr = array_intersect_key($arr, $filter);
    #b::debug(array_keys($arr));

    $keys = array_keys($arr); 
    #b::debug($last_key);
    $index = array_search($last_key, $keys); 
    if($index === false) $index = -1;
    #b::debug($keys); b::debug($index); b::debug($keys[$index+1]);

    if(count($arr) <= $index + 1) return null; 
    return $keys[$index + 1];
  }

  protected function getPreviousKey($arr, $last_key)
  {
    if($last_key === -1) return null;  // questions interrupted

    $keys = array_keys($arr); 
    $index = array_search($last_key, $keys); 
    if($index === false) $index = -1;

    return $keys[$index - 1];
  }
}

$app = new App();
$app->auth_user();
$app();
