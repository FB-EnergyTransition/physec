<?php
require_once __DIR__ . '/vendor/autoload.php';

use booosta\Framework as b;
b::load();

include_once 'incl/classes.php';

class App extends booosta\usersystem\Webappadmin
{
  protected $fields = 'name,qtext,type,edit,delete';
  protected $header = 'Name,Frage,Typ,Edit,Delete';
  protected $use_subtablelink = false;
  protected $subname = 'answeroption';
  protected $supername = 'collection';
  protected $foreign_keys = ['class'];
  
  #protected $checkbox_fields = '';
  protected $null_fields = ['ordernum', 'class'];
  protected $urlhandler_action_paramlist = ['new' => 'action/collection', 'newcondition' => 'action/object_id/idx', 'editcondition' => 'action/object_id/idx', 
                                            'deletecondition' => 'action/object_id/idx', 'newand' => 'action/object_id/idx', 'newor' => 'action/object_id/idx'];
  protected $sub_fields = 'answertext,mark,edit,delete';
  protected $sub_header = 'Text,Gewichtung,Edit,Delete';
  protected $sub_translate_fields = 'mark';

  protected $subtable_sortable = true;
  protected $sub_default_order = 'ordernum';


  protected function before_action_new()
  {
    $collection_id = $this->decID($this->VAR['collection']);
    $this->foreign_keys['class']['clause'] = "collection='$collection_id'";
  }

  protected function before_add_($data, $obj)
  {
    $newordernum = $this->DB->query_value('select coalesce(max(ordernum), 0)+1 from question');
    $obj->set('ordernum', $newordernum);

    if($data['name'] != '' && $data['qtext'] == '') $obj->set('qtext', $data['name']);
    if($data['qtext'] != '' && $data['name'] == '') $obj->set('name', $data['qtext']);
  }

  protected function before_action_edit()
  {
    $collection_id = $this->get_data('collection');
    $this->foreign_keys['class']['clause'] = "collection='$collection_id'";
  }

  protected function after_action_edit()
  {
    if($this->get_data('type') == 'bool' || $this->get_data('type') == 'text') $this->TPL['subtables_in_edit'] = false;
    if($this->get_data('type') == 'bool') $this->TPL['is_boolean'] = true;

    $id = $this->encID($this->id);
    $obj = $this->get_dbobject();
    $conditions = $obj->get('conditions');

    foreach($conditions as $idx => $condition)
      if(is_a($condition, 'Condition')):
        $value = $condition->value() ?: $this->DB->query_value('select answertext from answeroption where id=?', $condition->link());

        $data[] = ['question' => $this->DB->query_value('select substr(qtext, 1, 100) as name from question where id=?', $condition->question()), 'operator' => $condition->operator(), 'value' => $value,
                   'edit' => "{LINK|Bearbeiten|/question/editcondition/$id/$idx}", 'delete' => "{LINK|Löschen|/question/deletecondition/$id/$idx}"];
      else:  // CondAND or CondOR
        $data[] = ['question' => get_class($condition), 'operator' => '', 'value' => '',
                   'edit' => "{LINK|Bearbeiten|/question/editcondition/$id/$idx}", 'delete' => "{LINK|Löschen|/question/deletecondition/$id/$idx}"];
      endif;

    #b::debug($data);
    $table = $this->makeInstance('datatable', 'conditions', $data, true);
    $this->TPL['conditionlist'] = $table->get_html();

    $this->TPL['collection'] = $this->encID($obj->get('collection'));
  }

  protected function before_edit_($id, $data, $obj)
  {
    $enc_id = $this->encID($id);
    if($data['class'] == null) $this->raise_error('Kategorie ist verpflichtend anzugeben', "/question/edit/$enc_id");
  }

  protected function action_newand($or = false)
  {
    $operator = $or ? new CondOR() : new CondAND();
    $obj = $this->get_dbobject();
    $conditions = $obj->get('conditions') ?? [];

    $cond = $this->getConditionOnIndex($conditions, $this->VAR['idx']);

    if(is_array($cond)) $conditions[] = $operator;
    else $cond?->add($operator);

    $obj->set('conditions', $conditions);
    $obj->update();
    
    $index = sizeof($conditions) - 1;

    if($this->VAR['idx']) $indexstr = $this->VAR['idx'] . "-$index";
    else $indexstr = $index;

    $this->maintpl = \booosta\webapp\FEEDBACK;
    $this->goback = true;
    $id = $this->encID($this->id);
    $this->backpage = "/question/editcondition/$id/$indexstr";
  }

  protected function action_newor()
  {
    $this->action_newand(true);
  }

  protected function action_newcondition()
  {
    $collection = $this->DB->query_value('select collection from question where id=?', $this->id);
    $type = $this->DB->query_value('select type from question where id=?', $this->id);
    $quest = $this->DB->query_index_array('select id, substr(qtext, 1, 100) as name from question where collection=? and id<>? order by ordernum', [$collection, $this->id]);

    $questions = [];
    foreach($quest as $id => $value) $questions[$this->encID($id)] = $value;

    $sel = $this->makeInstance('ui_select', 'question', [0 => ''] + $questions);
    $sel->onchange("ui_select_link_ajaxload('/question/loadanswers/' + value)");
    $this->TPL['questionsel'] = $sel->get_html();

    $sel = $this->makeInstance('ui_select', 'link');
    $sel->set_ajaxload(true);
    $this->TPL['valuefield'] = $sel->get_html();

    $this->pass_vars_to_template('object_id,idx');
    $this->maintpl = 'newcondition.tpl';
  }

  protected function action_newconditiondo()
  {
    #b::debug($this->VAR);
    $question_id = is_numeric($this->VAR['question']) ? $this->VAR['question'] : $this->decID($this->VAR['question']);
    $link = is_numeric($this->VAR['link']) ? $this->VAR['link'] : $this->decID($this->VAR['link']);
    $value = $this->VAR['value'];

    $question = $this->makeInstance('Question', $question_id);
    if($question->getType() == 'text' || $question->getType() == 'bool') $link = null;

    $condition = new Condition($question_id, $this->VAR['operator'], $value, $link);
    $obj = $this->get_dbobject();
    $conditions = $obj->get('conditions') ?? [];

    $index = $this->VAR['idx'];
    if($index === null || $index === ''):
      $conditions[] = $condition;
    else:
      $ptr = $this->getConditionOnIndex($conditions, $this->VAR['idx']);
      $ptr?->add($condition);
    endif;

    $obj->set('conditions', $conditions);
    $obj->update();

    $this->maintpl = \booosta\webapp\FEEDBACK;
    $this->goback = true;
    $id = $this->encID($this->id);
    $this->backpage = "/question/edit/$id";
  }

  protected function action_editcondition()
  {
    $id = $this->VAR['object_id'];
    $this->id = $this->decID($id);

    $type = $this->DB->query_value('select type from question where id=?', $this->id);
    $collection = $this->DB->query_value('select collection from question where id=?', $this->id);
    $quest = $this->DB->query_index_array('select id, substr(qtext, 1, 100) as name from question where collection=? and id<>? order by ordernum', [$collection, $this->id]);

    $questions = [];
    $map = [];

    foreach($quest as $id => $value):
      $encid = $this->encID($id);
      $questions[$encid] = $value;
      $map[$id] = $encid;
    endforeach;

    $sel = $this->makeInstance('ui_select', 'question', [0 => ''] + $questions);

    $obj = $this->get_dbobject();
    $conditions = $obj->get('conditions') ?? [];
    $condition = $this->getConditionOnIndex($conditions, $this->VAR['idx']);

    if($condition === null) $this->raise_error("No condition found in question $id on index {$this->VAR['idx']}");

    if(is_a($condition, 'Condition')):
      $current = $map[$condition?->question()];

      $sel = $this->makeInstance('ui_select', 'question', $questions, $current);
      if($type == 'radio' || $type == 'check') $sel->onchange("ui_select_link_ajaxload('/question/loadanswers/' + value)");
      $this->TPL['questionsel'] = $sel->get_html();

      $options = $this->DB->query_index_array('select id, answertext from answeroption where question=?', $condition?->question());
      $sel = $this->makeInstance('ui_select', 'link', $options, $condition?->link());
      $sel->set_ajaxload(true);
      $this->TPL['valuefield'] = $sel->get_html();

      $this->TPL['operator'] = $condition?->operator();
      if(!$condition?->link()) $this->TPL['value'] = $condition?->value();

      $this->pass_vars_to_template('object_id,idx');
      $this->maintpl = 'editcondition.tpl';
    else:   // CondAND or CondOR
      $data = [];
      $operands = $condition?->operands() ?? [];
      #b::debug($operands);

      foreach($operands as $idx => $operand):
        #b::debug("idx: " . $this->VAR['idx']);
        $idxstr = $this->VAR['idx'] || $this->VAR['idx'] === '0' ? $this->VAR['idx'] . "-$idx" : $idx;

        if(is_a($operand, 'Condition')):
          $data[] = ['question' => $this->DB->query_value('select substr(qtext, 1, 100) as name from question where id=?', $operand->question()), 'operator' => $operand->operator(), 'value' => $operand->value(),
                     'edit' => "{LINK|Bearbeiten|/question/editcondition/$id/$idxstr}", 'delete' => "{LINK|Löschen|/question/deletecondition/$id/$idxstr}"];
        else:  // CondAND or CondOR
          $data[] = ['question' => get_class($operand), 'operator' => '', 'value' => '',
                     'edit' => "{LINK|Bearbeiten|/question/editcondition/$id/$idxstr}", 'delete' => "{LINK|Löschen|/question/deletecondition/$id/$idxstr}"];
        endif;
      endforeach;

      $table = $this->makeInstance('datatable', 'questions', $data, true);
      $this->TPL['questionlist'] = $table->get_html();

      $this->TPL['type'] = get_class($condition) == 'CondAND' ? $this->t('AND') : $this->t('OR');
      $this->pass_vars_to_template('object_id,idx');
      $this->maintpl = 'editandor.tpl';
    endif;
  }

  protected function action_editconditiondo()
  {
    $question = is_numeric($this->VAR['question']) ? $this->VAR['question'] : $this->decID($this->VAR['question']);
    $link = is_numeric($this->VAR['link']) ? $this->VAR['link'] : $this->decID($this->VAR['link']);

    $this->id = $this->decID($this->VAR['object_id']);
    $obj = $this->get_dbobject();
    $conditions = $obj->get('conditions') ?? [];

    $ptr = $this->getConditionOnIndex($conditions, $this->VAR['idx']);

    if(is_object($ptr) && is_a($ptr, 'Condition')):
      $ptr->question($question);
      $ptr->operator($this->VAR['operator']);
      $ptr->value($this->VAR['value']);
      $ptr->link($link);

      $obj->set('conditions', $conditions);
      $obj->update();
    endif;

    $this->maintpl = \booosta\webapp\FEEDBACK;
    $this->goback = true;
    $id = $this->encID($this->id);
    $this->backpage = "/question/edit/$id";
  }

  protected function action_deletecondition()
  {
    $this->id = $this->decID($this->VAR['object_id']);
    $obj = $this->get_dbobject();
    $conditions = $obj->get('conditions') ?? [];

    $index = $this->VAR['idx'];

    if(is_numeric($index)):
      unset($conditions[$index]);
      $conditions = array_values($conditions);  // reindex
    else:
      $ptr = $this->getConditionOnIndex($conditions, $index, 1);

      $a = explode('-', $index);
      $last_index = $a[array_key_last($a)];
      $ptr?->remove($last_index);
    endif;

    $obj->set('conditions', $conditions);
    $obj->update();

    $this->maintpl = \booosta\webapp\FEEDBACK;
    $this->goback = true;
    $id = $this->encID($this->id);
    $this->backpage = "/question/edit/$id";
  }

  protected function action_showconditions()
  {
    $obj = $this->get_dbobject();
    $conditions = $obj->get('conditions') ?? [];

    $browser = $this->makeInstance('objectbrowser', $conditions);
    $browser->objecteditlink("question/editcondition/$this->encid/{id}");
    $this->TPL['browser'] = $browser->get_html();

    $this->maintpl = 'objectbrowser.tpl';
  }

  protected function action_loadanswers()
  {
    $result = [];
    $sql = 'select id, answertext from answeroption where question=?';
    $options = $this->DB->query_index_array($sql, $this->id);
    #b::debug("id: " . $this->id);

    foreach($options as $id => $option) $result[] = ['id' => $this->encID($id), 'name' => $option];
    #b::debug($result);

    header('Content-Type: application/json; charset=utf-8');
    print json_encode($result);
    $this->no_output = true;
  }

  protected function getConditionOnIndex($var, $index, $skip = 0)    // $skip = skip the last n elements of $index
  {
    #b::debug($var); b::debug("index: $index, skip: $skip");
    if($index === null || $index === '') return $var;

    if(str_contains($index, '-')):
      $ptr = $var;
      $indexes = explode('-', $index);

      if($skip > 0) $indexes = array_splice($indexes, 0, $skip * -1);

      foreach($indexes as $idx)
        if(is_array($ptr)) $ptr = $ptr[$idx];
        else $ptr = $ptr?->operands()[$idx];

      return $ptr;
    else:
      return $var[$index];
    endif;
  }
}

$app = new App('question');
$app->auth_user();
$app();
