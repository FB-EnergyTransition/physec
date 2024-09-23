{BBOXCENTER}
{BPANEL|paneltitle::Neue Frage}

{BFORMSTART|question}
{HIDDEN|action|newdo}
{HIDDEN|form_token|{%form_token}}
{HIDDEN|collection|{%collection}}

{BTEXTAREA|qtext|4|texttitle::Frage-Text}
{BTEXTAREA|description|4|texttitle::Beschreibung}
{BSELECT|type|texttitle::Typ
radio
check
bool
text}
{BFORMGRP|Kategorie}{%list_class}{/BFORMGRP}

{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Zurück|javascript:history.go(-1);}

{/BPANEL}
{/BBOXCENTER}
