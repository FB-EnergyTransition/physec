{BBOXCENTER}
{BPANEL|paneltitle::Edit Collection}

{BFORMSTART|collection}
{HIDDEN|action|editdo}
{HIDDEN|object_id|{%id}}
{HIDDEN|form_token|{%form_token}}

{BTEXT|name|{*name}|texttitle::Name}
{BCHECKBOX|disabled|{%disabled}|texttitle::Disabled}


{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Back|/collection}

{/BPANEL}
{/BBOXCENTER}

%if({%subtables_in_edit}):
  {BBOXCENTER|bboxsize::12}
  {BPANEL|paneltitle::Question}

  {BLINKADD|New question|question/new/{%id}}

  {%subliste}
  {/BPANEL}
  {/BBOXCENTER}
%endif;
