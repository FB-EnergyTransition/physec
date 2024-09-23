{BBOXCENTER}
{BPANEL|paneltitle::Resultat bearbeiten}

{BFORMSTARTM|result}
{HIDDEN|action|editdo}
{HIDDEN|object_id|{%id}}
{HIDDEN|form_token|{%form_token}}

{BFORMGRP|Vorlage}{%list0_filelink}{/BFORMGRP}
{BCHECKBOX|attach|{*attach}|texttitle::Attachments anfügen}
{BTEXTAREA|rtext|10|texttitle::Text
{*rtext}}
{BTEXT|video|{*video}|texttitle::Video}
{BTEXT|link|{*link}|texttitle::Link}
{BTEXT|linkcaption|{*linkcaption}|texttitle::Link-Text}
{BFORMGRP|zugeordnete Frage (optional)}{%list0_question}{/BFORMGRP}


{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Zurück|javascript:history.go(-1);}

{/BPANEL}
{/BBOXCENTER}
