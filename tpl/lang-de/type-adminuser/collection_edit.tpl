{BBOXCENTER}
{BPANEL|paneltitle::Fragebogen bearbeiten}

{BFORMSTART|collection}
{HIDDEN|action|editdo}
{HIDDEN|object_id|{%id}}
{HIDDEN|form_token|{%form_token}}

{BTEXT|name|{*name}|texttitle::Name}
{BCHECKBOX|disabled|{%disabled}|texttitle::Deaktiviert}


{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Zurück|/collection}

{/BPANEL}
{/BBOXCENTER}

%if({%subtables_in_edit}):
  {BBOXCENTER|bboxsize::12}
  {BPANEL|paneltitle::Frage}

  {BLINKADD|Neue Frage|question/new/{%id}}
  {BLINK|Übersicht ansehen|collection/overview/{%id}}
  {BLINK|Übersicht downloaden|collection/download/{%id}}

  {%subliste}

  <small>(Mit Drag & Drop sortieren)</small>
  {/BPANEL}
  {/BBOXCENTER}

  {BBOXCENTER|bboxsize::12}
  {BPANEL|paneltitle::Kategorien}

  {BLINKADD|Neue Kategorie|class/new/{%id}}

  {%subliste_1}

  {/BPANEL}
  {/BBOXCENTER}
%endif;
