{BBOXCENTER}
{BPANEL|paneltitle::Neue Kategorisierung}

{BFORMSTART|collection}
{HIDDEN|action|newcategorizerdo}
{HIDDEN|object_id|{%object_id}}
{HIDDEN|form_token|{%form_token}}

{BFORMGRP|Frage}{%questionsel}{/BFORMGRP}
{BSELECT|operator|texttitle::Operator
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
{BTEXT|value|texttitle::Wert|help::Boolean = 0 oder 1}
{BFORMGRP|Kategorie}{%categorysel}{/BFORMGRP}

{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Zurück|javascript:history.go(-1);}

{/BPANEL}
{/BBOXCENTER}