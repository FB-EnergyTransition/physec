<?php
require_once __DIR__ . '/vendor/autoload.php';

use booosta\Framework as b;
b::load();

include_once 'incl/classes.php';


class App extends booosta\usersystem\Webappuser
{
  use Chart, Tools;

  protected function action_default()
  {
    $this->check_accepted();

    $this->maintpl = 'dashboard.tpl';

    $collection_id = $this->DB->query_value('select id from collection where disabled=0');
    #$collection = $this->makeInstance('Collection', $collection_id);

    $answerform_id = $this->DB->query_value('select id from answerform where user=? and collection=?', [$this->user_id, $collection_id]);
    if($answerform_id) $answerform = $this->makeInstance('Answerform', $answerform_id);

    if(!$answerform?->isFinished()) return;   // do not show graphs when answerform is not finished

    // show pie graph
    $this->TPL['graph'] = $this->makePieChart($answerform);

    // show result graph
    $answers = $answerform?->getAnswers();
    $map = ['good' => 2, 'weak' => 1, 'bad' => 0];
    $colormap = ['good' => '#00aa00', 'weak' => '#dd7700', 'bad' => '#dd0000'];
    $color = [];
    $score = [];

    foreach($answers as $answer):
      $mark = $answer?->getMark();
      #b::debug("mark: $mark for anwser " . $answer?->getId()); #b::debug($answer?->getId());
      if($mark == '' || $mark == 'neutral') continue;

      $class = $answer?->getClassName();
      $score[$class][] = $map[$mark];
    endforeach;
    #b::debug($score);

    foreach($score as $class => $scores):
      $value[$class] = round(50 * array_sum($scores) / count($scores));
      if($value[$class] < 5) $value[$class] = 5;

      if($value[$class] < 50) $color[$class] = $colormap['bad'];
      elseif($value[$class] < 70) $color[$class] = $colormap['weak'];
      else $color[$class] = $colormap['good'];
    endforeach;

    #if(sizeof($value) < 3) $value[''] = 0;   // workaround bug of Flot with one or two bars
    #b::debug($value);
    #$value = ['A' => ['Eins' => 1, 'zwei' => 2, 'drei' => 3], 'B' => ['Eins' => 3, 'zwei' => 2, 'drei' => 1]];

    $chart = $this->makeInstance("booosta\\graph2\\Bar2", 'ergebnisse', $value);
    $chart->set_title('Ergebnisse');
    $chart->hide_label();
    $chart->set_colors($color);
    $chart->set_stepsize(10);
    $chart->set_maxval(100);
    $chart->set_unit('%');
    #$chart->hide_hover();
    #$chart->y_labels([0 => '', 1 => $this->t('bad'), 2 => $this->t('weak'), 3 => $this->t('good')]);
    $this->TPL['resultgraph'] = $chart->get_html();
 
    // show result media (videos)
    $categories = $answerform?->getCategories() ?? [];
    $categories = $this->flatten_array($categories);
    #b::debug($categories);

    $videos = [];
    $pdfs = [];

    foreach($categories as $category_id):
      $category_id ??= 0;
      array_splice($videos, 0, 0, $this->DB->query_value_set("select video from result where category=? and video is not null and video<>''", $category_id));
      array_splice($pdfs, 0, 0, $this->DB->query_value_set("select file from result where category=? and filename is not null and filename<>''", $category_id));
    endforeach;

    #b::debug($videos);
    $parser = $this->get_templateparser();

    foreach($videos as $video)
      $this->TPL['videos'] .= $parser->parseTemplate('video.tpl', ['video_id' => $this->getVideoID($video)]);

    foreach($pdfs as $pdf)
      $this->TPL['documents'] .= $parser->parseTemplate('pdf.tpl', ['file' => $pdf]);

    $this->TPL['show_videos'] = sizeof($videos) > 0;
    $this->TPL['show_documents'] = sizeof($pdfs) > 0;

    $this->get_recommendations($answerform_id, 'recommendations');
  }

  protected function action_pdf()
  {
    $collection_id = $this->DB->query_value('select id from collection where disabled=0');
    $answerform_id = $this->DB->query_value('select id from answerform where user=? and collection=?', [$this->user_id, $collection_id]);

    $html = $this->get_answers_html($answerform_id);

    $writer = $this->makeInstance('pdfwriter', $html);
    $writer->download('Zwischenbericht ' . date('Y-m-d_H-i') . '.pdf');
  }
}

$app = new App();
$app->auth_user();
$app();