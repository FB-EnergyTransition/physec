{BBOXCENTER}
{BPANEL|paneltitle::Antwort-Option bearbeiten}

{BFORMSTART|answeroption}
{HIDDEN|action|editdo}
{HIDDEN|object_id|{%id}}
{HIDDEN|form_token|{%form_token}}

{BTEXT|answertext|{*answertext}|texttitle::Text}
{BTEXT|description|{*description}|texttitle::Beschreibung}
{BSELECT|mark|{%mark}|texttitle::Bewertung
[good]Gut
[weak]Schwach
[bad]Kritisch
[neutral]Neutral}


{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Zurück|question/edit/{%enc_question}}

{/BPANEL}
{/BBOXCENTER}


{BBOXCENTER bboxsize::12}
{BPANEL|paneltitle::Empfehlungen}
{BLINKADD|Neue Empfehlung|category/new/{%id}}

{%subliste}

{/BPANEL}
{/BBOXCENTER}
