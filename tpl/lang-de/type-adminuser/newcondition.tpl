{BBOXCENTER}
{BPANEL|paneltitle::Neue Bedingung}

{BFORMSTART|question}
{HIDDEN|action|newconditiondo}
{HIDDEN|object_id|{%object_id}}
{HIDDEN|idx|{%idx}}
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
{%valuefield}
{BTEXT|value|texttitle::Wert (falls im Dropdown nichts passendes enthalten ist)}

{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Zurück|javascript:history.go(-1);}

{/BPANEL}
{/BBOXCENTER}