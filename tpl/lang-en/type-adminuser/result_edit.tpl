{BBOXCENTER}
{BPANEL|paneltitle::Edit Result}

{BFORMSTART|result}
{HIDDEN|action|editdo}
{HIDDEN|object_id|{%id}}
{HIDDEN|form_token|{%form_token}}

{BTEXT|file|{*file}|texttitle::File}
{BTEXTAREA|rtext|10|texttitle::Rtext
{*rtext}}
{BTEXT|video|{*video}|texttitle::Video}


{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Back|javascript:history.go(-1);}

{/BPANEL}
{/BBOXCENTER}
