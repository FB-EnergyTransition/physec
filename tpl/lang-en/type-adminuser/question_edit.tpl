{BBOXCENTER}
{BPANEL|paneltitle::Edit Question}

{BFORMSTART|question}
{HIDDEN|action|editdo}
{HIDDEN|object_id|{%id}}
{HIDDEN|form_token|{%form_token}}

{BTEXT|name|{*name}|texttitle::Name}
{BTEXTAREA|qtext|4|texttitle::Text
{*qtext}}

{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Back|/collection/edit/{%collection}}

{/BPANEL}
{/BBOXCENTER}

%if({%subtables_in_edit}):
  {BBOXCENTER|bboxsize::12}
  {BPANEL|paneltitle::Answeroption}

  {BLINKADD|New answeroption|answeroption/new/{%id}}

  {%subliste}
  {/BPANEL}
  {/BBOXCENTER}
%endif;

{BBOXCENTER|bboxsize::12}
{BPANEL|paneltitle::Conditions}

{BLINKADD|New condition|question/newcondition/{%id}}

{%conditions}

{/BPANEL}
{/BBOXCENTER}
