{BBOXCENTER}
{BPANEL|paneltitle::New condition}

{BFORMSTART|question}
{HIDDEN|action|newconditiondo}
{HIDDEN|object_id|{%object_id}}
{HIDDEN|form_token|{%form_token}}

{BFORMGRP|Question}{%questionsel}{/BFORMGRP}
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
{BTEXT|value|texttitle::Value|help::Boolean = 0 or 1}

{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Back|javascript:history.go(-1);}

{/BPANEL}
{/BBOXCENTER}