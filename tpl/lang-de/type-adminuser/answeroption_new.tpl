{BBOXCENTER}
{BPANEL|paneltitle::Neue Antwort-Option}

{BFORMSTART|answeroption}
{HIDDEN|action|newdo}
{HIDDEN|form_token|{%form_token}}
{HIDDEN|question|{%question}}

{BTEXT|answertext|texttitle::Text}
{BSELECT|mark|texttitle::Bewertung
[good]Gut
[weak]Schwach
[bad]Kritisch
[neutral]Neutral}

{BTEXT|newcategory|texttitle::Ergebnistext (optional)}

{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Zurück|javascript:history.go(-1);}

{/BPANEL}
{/BBOXCENTER}
