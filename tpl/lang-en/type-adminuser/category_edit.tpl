{BBOXCENTER}
{BPANEL|paneltitle::Edit Category}

{BFORMSTART|category}
{HIDDEN|action|editdo}
{HIDDEN|object_id|{%id}}
{HIDDEN|form_token|{%form_token}}

{BTEXT|name|{*name}|texttitle::Name}


{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Back|javascript:history.go(-1);}

{/BPANEL}
{/BBOXCENTER}

%if({%subtables_in_edit}):
  {BBOXCENTER|bboxsize::12}
  {BPANEL|paneltitle::Result}

  {BLINKADD|New result|result/new/{%id}}

  {%subliste}
  {/BPANEL}
  {/BBOXCENTER}
%endif;
