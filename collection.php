<?php
require_once __DIR__ . '/vendor/autoload.php';

use booosta\Framework as b;
b::load();

include_once 'incl/classes.php';


class App extends booosta\usersystem\Webappadmin
{
  protected $fields = 'disabled,name,edit,delete';
  protected $header = 'Aktiv,Name,Edit,Delete';
  protected $use_subtablelink = false;
  #protected $use_datatable = true;

  protected $subname = 'question,class';
  protected $boolfields = '!disabled';

  protected $sub_fields = ['class,qtext,type,edit,delete', 'name,edit,delete'];
  protected $sub_header = ['Kategorie,Frage,Typ,Edit,Delete', 'Name,Edit,Delete'];
  protected $sub_default_order = ['ordernum', 'ordernum'];
  protected $sub_foreign_keys = ['class'];
  
  protected $checkbox_fields = 'disabled';
  protected $subtable_sortable = true;


  protected function before_add_($data, $obj)
  {
    if($data['disabled'] == 0) $this->DB->query('update collection set disabled=1');
  }

  protected function before_edit_($id, $data, $obj)
  {
    if($data['disabled'] == 0) $this->DB->query('update collection set disabled=1 where id<>?', $id);
  }

  protected function action_overview()
  {
    $this->maintpl = $this->get_overview();
  }

  protected function action_download()
  {
    $writer = $this->makeInstance('pdfwriter', $this->get_overview());
    $writer->download('Fragebogen.pdf');
  }

  protected function get_overview()
  {
    $result = [];
    $title = $this->DB->value('collection', $this->id);
    $html = "<h1>Fragen zum Fragebogen $title</h1>";

    $sql = 'select r.rtext, ao.answertext, q.qtext 
            from question q left join answeroption ao on q.id=ao.question left join category c on ao.id=c.answeroption left join result r on c.id=r.category 
            where q.collection=?';

    $data = $this->DB->query_arrays($sql, $this->id);
    foreach($data as $d) $result[$d['qtext']][$d['answertext']][] = $d['rtext'];

    foreach($result as $qtext => $answers):
      $html .= "<li>$qtext <ul>";
      
      foreach($answers as $answertext => $rtexts):
        if($answertext == '') continue;

        $html .= "<li>$answertext <ul>";

        foreach($rtexts as $rtext) if($rtext) $html .= "<li>$rtext</li>\n";

        $html .= "</ul></li>\n";
      endforeach;

      $html .= "</ul></li>\n";
    endforeach;

    return "<ul>$html</ul>";
  }
}

$app = new App('collection');
$app->auth_user();
$app();
