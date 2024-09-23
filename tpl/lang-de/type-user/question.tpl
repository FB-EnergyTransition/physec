{BBOXCENTER bboxsize::12}
{BPANEL|paneltitle::{*questiontext}}

%if({%show_description})
  <small>{%description}</small> <br><br>

{BFORMSTART|user_questions}
{HIDDEN|action|answer}
{HIDDEN|question|{%question_id}}
{HIDDEN|form_token|{%form_token}}

{%answers}

{BFORMSUBMIT|class::center-block}
{BFORMSUBMIT|name::button|value::previous|buttontext::Zurück|class::center-block}
{BFORMEND}

{/BPANEL}
{/BBOXCENTER}
