{BBOXCENTER}
{BPANEL|paneltitle::Edit categorizer}

{BFORMSTART|collection}
{HIDDEN|action|editcategorizerdo}
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
{BTEXT|value|{%value}|texttitle::Value|help::Boolean = 0 or 1}
{BFORMGRP|Category}{%categorysel}{/BFORMGRP}

{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Back|javascript:history.go(-1);}

{/BPANEL}
{/BBOXCENTER}