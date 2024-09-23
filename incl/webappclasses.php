<?php
namespace booosta\webapp;

class Webapp extends Webappbase
{
	protected function init()
  {
    parent::init();

		if($this->user_class == 'adminuser'):
			$questions = $this->get_questionlist();
			$this->TPL['sidebar_content'] = $questions;
		endif;
	}

	protected function get_questionlist()
	{
		$result = '<ul>';

		$questions = $this->DB->query_index_array('select q.id, q.qtext from question q, collection c where q.collection=c.id and c.disabled=0');
		foreach($questions as $id => $text):
			$id = $this->encID($id);
			$text = substr($text, 0, 70);

			$result .= "<li>{LINK|$text|/question/edit/$id}</li>";
		endforeach;

		return $result . '</ul>';
	}
}
