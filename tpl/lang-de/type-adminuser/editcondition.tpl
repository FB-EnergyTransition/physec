{BBOXCENTER}
{BPANEL|paneltitle::Bedingung bearbeiten}

{BFORMSTART|question}
{HIDDEN|action|editconditiondo}
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
{%valuefield}
{BTEXT|value|{%value}|texttitle::Wert (falls im Dropdown nichts passendes enthalten ist)}

{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Zurück|javascript:history.go(-1);}

{/BPANEL}
{/BBOXCENTER}