{BBOXCENTER}
{BPANEL|paneltitle::Frage bearbeiten}

{BFORMSTART|question}
{HIDDEN|action|editdo}
{HIDDEN|object_id|{%id}}
{HIDDEN|form_token|{%form_token}}

{BTEXTAREA|qtext|4|texttitle::Frage-Text
{*qtext}}
{BTEXTAREA|description|4|texttitle::Beschreibung
{*description}}
{BFORMGRP|Kategorie}{%list_class}{/BFORMGRP}

%if({%is_boolean}):
{BSELECT|mark_false|{%mark_false}|texttitle::Bewertung bei NEIN
[good]Gut
[weak]Schwach
[bad]Kritisch
[neutral]Neutral}

{BSELECT|mark_true|{%mark_true}|texttitle::Bewertung bei JA
[good]Gut
[weak]Schwach
[bad]Kritisch
[neutral]Neutral}
%endif;

{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Zurück|/collection/edit/{%collection}}

{/BPANEL}
{/BBOXCENTER}

%if({%subtables_in_edit}):
  {BBOXCENTER|bboxsize::12}
  {BPANEL|paneltitle::Antwort-Option}

  {BLINKADD|Neue Antwort-Option|answeroption/new/{%id}}

  {%subliste}
  
  <small>(Mit Drag & Drop sortieren)</small>
  {/BPANEL}
  {/BBOXCENTER}
%endif;

{BBOXCENTER|bboxsize::12}
{BPANEL|paneltitle::Bedingungen}

<small>Diese Frage wird nur angezeigt, wenn mindestens eine der hier definierten Bedingungen zutrifft. Diese Bedingungen können auch UND- bzw. ODER-verknüfpt werden. Wenn keine 
der Bedingungen zutrifft, wird die Frage im Fragebogen übersprungen. Wenn keine Bedingung ausgewählt wird, wird Frage auf jeden Fall angezeigt.</small>
<br><br>

{BLINKADD|Neue Bedingung|question/newcondition/{%id}}
{BLINKADD|Neue UND-Verknüpfung|question/newand/{%id}}
{BLINKADD|Neue ODER-Verknüpfung|question/newor/{%id}}

{%conditionlist}
  
<br>  <small>(Mit Drag & Drop sortieren)</small>
{/BPANEL}
{/BBOXCENTER}

{BLINK|Anzeige der Bedingungen (debug)|question/showconditions/{%id}}
