<?php
use \booosta\Framework as b;

class Entity extends \booosta\base\Base
{
  public function __construct(protected $id) { parent::__construct(); }
  public function getId() { return $this->id; }
}


class Collection extends Entity
{
  protected $questions = [];
  protected $answerforms = [];
  

  public function getQuestions($answerform = null)
  {
    if(is_numeric($answerform)) $answerform = $this->makeInstance('Answerform', $answerform);
    
    $allquestions = $this->DB->query_index_array('select id, ordernum from question where collection=? order by ordernum', $this->id);
    foreach($allquestions as $question_id => $ordernum):
      $question = $this->makeInstance('Question', $question_id);
      if($question->conditions($answerform)) $this->questions[$ordernum] = $question;
    endforeach;
    
    return $this->questions;
  }
 
  public function getAnswerforms()
  {
    $forms = $this->DB->query_value_set('select id from answerform where collection=?', $this->id);
    foreach($forms as $form) $this->answerforms[] = $form;
 
    return $this->answerforms;
  }

  public function getCategory($answerform)
  {
    $result = [];
    $answers = $answerform?->getAnswers();

    foreach($answers as $answer) $result[] = $answer?->getCategoryId();

    return $result;
  }
}


class Answerform extends Entity
{
  public function getCollection()
  {
    $collection_id = $this->DB->query_value('select collection from answerform where id=?', $this->id);
    return $this->makeInstance('Collection', $collection_id);
  }

  public function getAnswer($question)
  {
    if(is_numeric($question)) $question = $this->makeInstance('Question', $question);
    #b::debug("id: $this->id, question_id: " . $question->getId());
    $answer_id = $this->DB->query_value('select id from answer where answerform=? and question=?', [$this->id, $question->getId()]);

    if($answer_id) return $this->makeInstance('Answer', $answer_id);
    return null;
  }

  public function getImplementations()
  {
    $obj = $this->getDataobject('answerform', $this->id);
    return $obj->get('implemented');
  }

  public function getAnswers()
  {
    $result = [];
    $answer_ids = $this->DB->query_value_set('select id from answer where answerform=?', $this->id);
    foreach($answer_ids as $answer_id) $result[] = $this->makeInstance('Answer', $answer_id);

    return $result;
  }

  public function getQuestions()
  {
    $result = [];
    $question_ids = $this->DB->query_value_set('select question from answer where answerform=?', $this->id);
    foreach($question_ids as $question_id) $result[] = $this->makeInstance('Question', $question_id);

    return $result;
  }

  public function countMarks()
  {
    $result = ['good' => 0, 'weak' => 0, 'bad' => 0];
    $answers = $this->getAnswers();

    foreach($answers as $answer) 
      if(array_key_exists($answer->getMark(), $result))
        $result[$answer->getMark()]++;

    return $result;
  }

  public function getCategories()
  {
    return $this->getCollection()?->getCategory($this);
  }

  public function isFinished()
  {
    return $this->DB->query_value('select finished from answerform where id=?', $this->getId()) == 1;
  }
}


class Answer extends Entity
{
  public function getQuestion()
  {
    $obj = $this->getDataobject('answer', $this->id);
    $question_id = $obj?->get('question');

    if($question_id) return $this->makeInstance('Question', $question_id);
  }

  public function getMark()
  {
    $obj = $this->getDataobject('answer', $this->id);

    if($this->getQuestion()?->getType() == 'bool'):
      $answer = $obj->get('atext');
      return $answer ? $this->getQuestion()?->getMarkTrue() : $this->getQuestion?->getMarkFalse();
    endif;

    if($answeroption_id = $obj->get('answeroption')):
      $answeroption = $this->getDataobject('answeroption', $answeroption_id);
      return $answeroption?->get('mark');
    else:  // there is no answeroption in the DB, maybe it is a checkbox and therefore in answer_option
      $worst_mark = '';

      $answer_options = $this->getDataobjects('answer_option', "answer='$this->id'");
      foreach($answer_options as $answer_option):
        $answeroption = $this->getDataobject('answeroption', $answer_option->get('answeroption'));
        $mark = $answeroption?->get('mark');

        // use the worst mark!
        if($mark == 'bad') return $mark;
        if($mark == 'weak') $worst_mark = $mark;
        if($mark == 'good' && $worst_mark != 'weak') $worst_mark = $mark;
      endforeach;

      if($worst_mark != '') return $worst_mark;
    endif;

    return null;
  }

  public function getCategoryId()
  {
    #$result = [];
    $obj = $this->getDataobject('answer', $this->id);

    $answeroption_id = $obj->get('answeroption');
    $category_ids = $this->DB->query_value_set('select id from category where answeroption=?', $answeroption_id);

    #foreach($category_ids as $category_id) $result[] = $this->makeInstance('Category', $category_id);

    return $category_ids;
  }

  public function getClassName()
  {
    return $this->DB->query_value('select c.name from class c, question q, answer a where a.id=? and a.question=q.id and q.class=c.id', $this->id);
  }

  protected function get($optiontext, $text = null)
  {
    #b::debug("$optiontext, $text");
    if($text === null) $text = $optiontext;

    $obj = $this->getDataobject('answer', $this->id);
    
    $options = $this->DB->query_value_set('select answeroption from answer_option where answer=?', $this->id);
    #b::debug("id: $this->id"); b::debug($options);
    if(sizeof($options) > 0):
      $result = [];

      foreach($options as $option):
        $answeroption = $this->getDataobject('answeroption', $option);
        $result[] = $answeroption->get($optiontext);
      endforeach;

      return $result;
    endif;

    // if there are no entries in answer_option, but it is a question of type "check", return array with no options
    if($this->getQuestion()?->getType() == 'check') return [];

    if($answeroption_id = $obj->get('answeroption')):
      $answeroption = $this->getDataobject('answeroption', $answeroption_id);
      return $answeroption->get($optiontext);
    endif;

    return $obj->get($text);
  }

  public function getValue() { return $this->get('answertext', 'atext'); }
  public function getIds() { return $this->get('id'); }
  public function getName() { return $this->get('name'); }
}


class Question extends Entity
{
  public function getName()
  {
    $obj = $this->getDataobject('question', $this->id);
    return $obj?->get('name');
  }

  public function getText()
  {
    $obj = $this->getDataobject('question', $this->id);
    return $obj?->get('qtext');
  }

  public function getType()
  {
    $obj = $this->getDataobject('question', $this->id);
    return $obj?->get('type');
  }
  public function getMarkFalse()
  {
    $obj = $this->getDataobject('question', $this->id);
    return $obj?->get('mark_false');
  }
  public function getMarkTrue()
  {
    $obj = $this->getDataobject('question', $this->id);
    return $obj?->get('mark_true');
  }

  // evaluates, if the condition of the question is met
  public function conditions(Answerform $form = null)
  {
    $obj = $this->getDataobject('question', $this->id);
    if(!is_object($obj) || !$obj->is_valid()) return false;
    
    $conditions = $obj->get('conditions');
    if(!is_array($conditions) || sizeof($conditions) == 0) return true;

    foreach($conditions as $condition)
      if($this->evaluate($condition, $form)) return true;
      
    return false;
  }
  
  protected function evaluate($condition, $form = null)
  {
    if(!is_object($condition)) return false;
    return $condition->evaluate($form);
  }

  public function get_html($answerform = null)
  {
    #b::debug(get_class($answerform));
    $obj = $this->getDataobject('question', $this->id);
    if(!is_object($obj) || !$obj->is_valid()) return '';
    
    $type = $obj->get('type');
    $tpl = "question.tpl";
    $atpl = "answer_$type.tpl";

    $parser = $this->topobj->get_templateparser();
    $answers = '';
    
    switch($type):
      case 'radio':
        $answeroptions = $this->DB->query_arrays('select * from answeroption where question=? order by ordernum', $this->id);
        $answerform_id = $answerform?->getAnswer($this)?->getIds();
        #b::debug($answerform_id);
        #b::debug(get_class($answerform?->getAnswer($this)));

        foreach($answeroptions as $option):
          $option['default'] = $option['id'] == $answerform_id ? 'checked' : '';
          $option['show_description'] = $option['description'] != '';
          if($option['description']) $option['description'] = '(' . $option['description'] . ')';
          $answers .= $parser->parseTemplate($atpl, $option);
        endforeach;
      break;
      case 'check':
        $answeroptions = $this->DB->query_arrays('select * from answeroption where question=? order by ordernum', $this->id);
        $answerform_ids = $answerform?->getAnswer($this)?->getIds() ?? [];
        #b::debug($answerform_ids);

        foreach($answeroptions as $option):
          $option['default'] = in_array($option['id'], $answerform_ids) ? 'checked' : '';
          #b::debug($option);
          $answers .= $parser->parseTemplate($atpl, $option);
        endforeach;
        #b::debug($answers);
      break;
      default:
        $default = $answerform?->getAnswer($this)?->getValue();
        $answers = $parser->parseTemplate($atpl, ['default' => $default]);
    endswitch;

    return $parser->parseTemplate($tpl, ['question_id' => $this->id, 'questiontext' => $obj->get('qtext'), 'description' => $obj->get('description'), 
                                         'show_description' => $obj->get('description') != '', 'answers' => $answers]);
  }
}


class Categorizer
{
  public function __construct(protected $condition = null, protected $category = null) {}
  public function condition($val = null) { if($val) $this->condition = $val; return $this->condition; }
  public function category($val = null) { if($val) $this->category = $val; return $this->category; }

  public function categorize($answerform) { return $this->condition?->evaluate($answerform) ? $this->category : null; }
}

abstract class Logic
{
  public function get_vars()
  {
    return get_object_vars($this);
  }
}

class Condition extends Logic
{
  public function __construct(protected $question = null, protected $operator = null, protected $value = null,
                              protected $link = null) {}

  public function question($val = null) { if($val !== null) $this->question = $val; return $this->question; }
  public function operator($val = null) { if($val !== null) $this->operator = $val; return $this->operator; }
  public function operands() { return []; }   // for compatibility with CondAND/CondOR
  public function value($val = null) { if($val !== null) $this->value = $val; return $this->value; }
  public function link($val = null) { if($val !== null) $this->link = $val; return $this->link; }

  public function linkvalue()
  {
    if($this->link):
      $answeroption = new Answeroption($this->link);
      return $answeroption?->getValue();
    endif;

    return $this->value;
  }

  public function evaluate(Answerform $form = null)
  {
    if($form === null) return false;

    $answer = $form->getAnswer($this->question);
    if($answer === null) return false;

    if($this->link === null):
      $answerval = $answer->getValue();
      if(!is_array($answerval)) $answerval = [$answerval];

      $compareval = $this->value;
    else:
      $answerval = $answer->getIds();
      if(!is_array($answerval)) $answerval = [$answerval];

      $compareval = $this->link;
    endif;

    // for checkboxes check # of checks
    switch($this->operator):
      case "# <":
        if(sizeof($answerval) < $compareval) return true;
      break;
      case "# <=":
        if(sizeof($answerval) <= $compareval) return true;
      break;
      case "# >":
        if(sizeof($answerval) > $compareval) return true;
      break;
      case "# >=":
        if(sizeof($answerval) >= $compareval) return true;
      break;
      case "# !=":
        if(sizeof($answerval) != $compareval) return true;
      break;
      case "# ==":
        if(sizeof($answerval) == $compareval) return true;
    endswitch;

    foreach($answerval as $val)
      switch($this->operator):
        case "<":
          if($val < $compareval) return true;
        break;
        case "<=":
          if($val <= $compareval) return true;
        break;
        case ">":
          if($val > $compareval) return true;
        break;
        case ">=":
          if($val >= $compareval) return true;
        break;
        case "!=":
          if($val != $compareval) return true;
        break;
        default:
          #b::debug("compare '$val' with '$this->value'");
          if($val == $compareval) return true;
      endswitch;

    return false;
  }
}


class CondAND extends Logic
{
  public function __construct(protected $operands = []) {}

  public function add($operand) { $this->operands[] = $operand; }
  public function operands() { return $this->operands; }

  public function remove($index) 
  { 
    unset($this->operands[$index]);
    $this->operands = array_values($this->operands);  // reindex
  }

  public function evaluate(Answerform $form = null)
  {
    foreach($this->operands as $operand):
      if(!is_object($operand)) continue;
      if(!$operand->evaluate($form)) return false;
    endforeach;

    return true;
  }
}


class CondOR extends Logic
{
  public function __construct(protected $operands = []) {}

  public function add($operand) { $this->operands[] = $operand; }
  public function operands() { return $this->operands; }

  public function remove($index) 
  { 
    unset($this->operands[$index]);
    $this->operands = array_values($this->operands);  // reindex
  }

  public function evaluate(Answerform $form = null)
  {
    foreach($this->operands as $operand):
      if(!is_object($operand)) continue;
      if($operand->evaluate($form)) return true;
    endforeach;

    return false;
  }
}


trait Chart
{
  protected function makePieChart($answerform)
  {
    $value = [];
    $marks = $answerform?->countMarks();
    foreach($marks as $idx => $mark) $value[$this->t($idx) . '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'] = $mark;
    #b::debug($marks);

    $chart = $this->makeInstance("booosta\\graph2\\Donut", 'antworten', $value);
    $chart->set_title('Status Fragenkatalog');
    $chart->set_colors(['#00aa00', '#dd7700', '#dd0000']);
    return $chart->get_html();
  }
}


trait Tools
{
  protected function getVideoID($url)
  {
    preg_match("#(?<=v=)[a-zA-Z0-9-]+(?=&)|(?<=v\/)[^&\n]+|(?<=v=)[^&\n]+|(?<=youtu.be/)[^&\n]+#", $url, $matches);
    return $matches[0];
  }

  protected function get_recommendations($answerform_id, $dest = 'output')
  {
    $collection_id = $this->DB->query_value('select id from collection where disabled=0');
    $collection = $this->makeInstance('Collection', $collection_id);

    #$colormap = ['good' => '00bb00', 'weak' => 'ff9400', 'bad' => 'ff0000'];

    if($answerform_id) $answerform = $this->makeInstance('Answerform', $answerform_id);
    $implementations = $answerform?->getImplementations() ?? [];

    unset($_SESSION['last_ordernum']);

    $parser = $this->get_templateparser();
    $category_ids = $collection?->getCategory($answerform);
    #b::debug($category_ids);

    $results = [];
    foreach($category_ids as $category_id)
      if(is_numeric($category_id)):
        $results = array_merge($results, $this->DB->query_arrays('select * from result where category=? order by ordernum', $category_id));
      elseif(is_array($category_id)):
        foreach($category_id as $cat_id)
          $results = array_merge($results, $this->DB->query_arrays('select * from result where category=? order by ordernum', $cat_id ?? 0));
      endif;

    $this->TPL['hide_results'] = true;

    $checkbox_tpl = '<td>{CHECKBOX|implemented[{%id}]|{%val}}</td>';

    #b::debug($results);
    foreach($results as $result):
      if($implementations[$result['id']] == 'on') continue;
      $this->TPL['hide_results'] = false;

      $html_video = '';
      $html_link = '';
      $html_file = '';
      $html_text = '';

      if($val = $result['video']):
        #b::debug("val: $val");
        $video_id = $this->getVideoID($val);

        if($video_id) $html_video = $parser->parseTemplate('result_video.tpl', ['video_id' => $video_id, 'text' => $result['rtext'], 'id' => $result['id'], 'val' => $implementations[$result['id']] == 'on']);
        else $html_video = "{LINK|Video|$val}";;
      endif;

      if($val = $result['link']):
        $html_link = $parser->parseTemplate('result_link.tpl', ['link' => $result['link'], 'text' => $result['linkcaption'], 'id' => $result['id'], 'val' => $implementations[$result['id']] == 'on']);
      endif;

      if($val = $result['filelink']):
        $file = $this->DB->query_value('select file from filelink where id=?', $val);
        #b::debug("treating file: $file");

        if($result['attach'] && str_ends_with($file, '.pdf')):
          #b::debug("attach to file: $file");
          $attachments = $this->DB->query_value_set('select file from attachment where user=?', $this->user_id);
          $filestr = '';
          foreach($attachments as $attachment) $filestr .= "upload/$attachment ";

          $pdfname = 'result_' . $this->encid($this->user_id) . '.pdf';
          system("pdfunite upload/$file $filestr upload/$pdfname");
          $file = $pdfname;
        endif;

        $html_file = $parser->parseTemplate('result_file.tpl', ['file' => $file, 'filename' => $result['filename'], 'text' => $result['rtext'], 'id' => $result['id'], 'val' => $implementations[$result['id']] == 'on']);
      endif;

      if($val = $result['rtext']):
        $showquestion = false;

        #$vars = ['text' => $val, 'id' => $result['id'], 'val' => $implementations[$result['id']] == 'on', 'showquestion' => $showquestion, 'question' => $question, 'answer' => $answer, 'color' => $colormap[$mark]];
        $vars = ['text' => $val, 'id' => $result['id'], 'val' => $implementations[$result['id']] == 'on', 'showquestion' => $showquestion];
        $html_text = $parser->parseTemplate('result_text.tpl', $vars);
      endif;

      $checkbox = $parser->parseTemplate($checkbox_tpl, ['id' => $result['id'], 'val' => $implementations[$result['id']] == 'on']);

      $html = "<tr>$checkbox";
      $html .= "<td>$html_text</td>";
      $html .= "<td>$html_video</td>";
      $html .= "<td>$html_link</td>";
      $html .= "<td>$html_file</td>";
      $html .= '</tr>';

      $this->TPL[$dest] .= $html;
    endforeach;

    // make graph
    $this->TPL['graph'] = $this->makePieChart($answerform);
  }

  protected function check_accepted()
  {
    if($this->user_id && $this->user_class == 'user'):
      $accepted = $this->DB->query_value('select accepted from user where id=?', $this->user_id);
      if(!$accepted) $this->redirect('/user_accept');;
    endif;
  }

  protected function flatten_array($array)
  {
    $return = [];
    array_walk_recursive($array, function($a) use (&$return) { $return[] = $a; });
    return $return;
  }

  protected function get_answers_html($answerform)
  {
    if(is_numeric($answerform)) $answerform = $this->makeInstance('Answerform', $answerform);

    $result = '';

    $answers = $answerform->getAnswers();
    foreach($answers as $answer):
      $question = $answer?->getQuestion();
      $result .= '<h3 class="h2_question">' . $question?->getText() . "</h3>\n";
      $result .= $answer?->getValue() . "\n";
    endforeach;

    return $result;
  }
}