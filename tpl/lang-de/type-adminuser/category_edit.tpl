{BBOXCENTER}
{BPANEL|paneltitle::Empfehlung bearbeiten}

{BFORMSTART|category}
{HIDDEN|action|editdo}
{HIDDEN|object_id|{%id}}
{HIDDEN|form_token|{%form_token}}

{BTEXT|name|{*name}|texttitle::Name}


{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Zurück|answeroption/edit/{%enc_answeroption}}

{/BPANEL}
{/BBOXCENTER}

%if({%subtables_in_edit}):
  {BBOXCENTER|bboxsize::12}
  {BPANEL|paneltitle::Empfehlungselemente}

  {BLINKADD|Neues Empfehlungselement|result/new/{%id}}

  {%subliste}
  {/BPANEL}
  {/BBOXCENTER}
%endif;
