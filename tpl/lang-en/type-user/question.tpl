{BBOXCENTER bboxsize::12}
{BPANEL|paneltitle::{*questiontext}}

{BFORMSTART|user_questions}
{HIDDEN|action|answer}
{HIDDEN|question|{%question_id}}
{HIDDEN|form_token|{%form_token}}

{%answers}

{BFORMSUBMIT|class::center-block}
{BFORMEND}

{/BPANEL}
{/BBOXCENTER}
