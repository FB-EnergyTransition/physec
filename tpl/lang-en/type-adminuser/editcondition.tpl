{BBOXCENTER}
{BPANEL|paneltitle::Edit condition}

{BFORMSTART|question}
{HIDDEN|action|editconditiondo}
{HIDDEN|object_id|{%object_id}}
{HIDDEN|idx|{%idx}}
{HIDDEN|form_token|{%form_token}}

{BFORMGRP|Question}{%questionsel}{/BFORMGRP}
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
{BTEXT|value|{*value}|texttitle::Value|help::Boolean = 0 or 1}

{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Back|javascript:history.go(-1);}

{/BPANEL}
{/BBOXCENTER}