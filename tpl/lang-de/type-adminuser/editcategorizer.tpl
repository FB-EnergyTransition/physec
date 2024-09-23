{BBOXCENTER}
{BPANEL|paneltitle::Kategorisierung bearbeiten}

{BFORMSTART|collection}
{HIDDEN|action|editcategorizerdo}
{HIDDEN|object_id|{%object_id}}
{HIDDEN|idx|{%idx}}
{HIDDEN|form_token|{%form_token}}

{BFORMGRP|Frage}{%questionsel}{/BFORMGRP}
{BSELECT|operator|{%operator}|texttitle::Operator
==
!=
<
<=
>
>=
# ==
# !=
# <
# <=
# >
# >=}
{BTEXT|value|{%value}|texttitle::Wert|help::Boolean = 0 oder 1}
{BFORMGRP|Kategorie}{%categorysel}{/BFORMGRP}

{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Zurück|javascript:history.go(-1);}

{/BPANEL}
{/BBOXCENTER}