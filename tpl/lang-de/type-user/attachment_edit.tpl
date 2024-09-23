{BBOXCENTER}
{BPANEL|paneltitle::Attachment bearbeiten}

{BFORMSTARTM|user_attachment}
{HIDDEN|action|editdo}
{HIDDEN|object_id|{%id}}
{HIDDEN|form_token|{%form_token}}


{BFILE|file|texttitle::Datei ersetzen}
{BCHECKBOX|keep|texttitle::alte Version beibehalten}
{BTEXT|filename|{*filename}|texttitle::Dateiname}

{BFORMSUBMIT|class::center-block}
{BFORMEND}

{BLINK|Zurück|javascript:history.go(-1);}
{/BPANEL}
{/BBOXCENTER}


%if({%subtables_in_edit}):
  {BBOXCENTER|bboxsize::12}
  {BPANEL|paneltitle::Alte Versionen}

  {%subliste}

  {/BPANEL}
  {/BBOXCENTER}
%endif;