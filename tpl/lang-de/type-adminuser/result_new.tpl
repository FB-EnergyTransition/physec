{BBOXCENTER}
{BPANEL|paneltitle::Neues Empfehlungselement}

{BFORMSTARTM|result}
{HIDDEN|action|newdo}
{HIDDEN|form_token|{%form_token}}
{HIDDEN|category|{%category}}

{BFORMGRP|Vorlage}{%list0_filelink}{/BFORMGRP}
{BCHECKBOX|attach|texttitle::Attachments anfügen}
{BTEXTAREA|rtext|10|texttitle::Text}
{BTEXT|video|texttitle::Video}
{BTEXT|link|texttitle::Link}
{BTEXT|linkcaption|texttitle::Link-Text}
{BFORMGRP|zugeordnete Frage (optional)}{%list0_question}{/BFORMGRP}

{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Zurück|javascript:history.go(-1);}

{/BPANEL}
{/BBOXCENTER}
