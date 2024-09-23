{BBOXCENTER}
{BPANEL|paneltitle::New Question}

{BFORMSTART|question}
{HIDDEN|action|newdo}
{HIDDEN|form_token|{%form_token}}
{HIDDEN|collection|{%collection}}
{BTEXT|name|texttitle::Name}
{BTEXTAREA|qtext|4|texttitle::Text}
{BSELECT|type|texttitle::Type
radio
check
bool
text}

{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Back|javascript:history.go(-1);}

{/BPANEL}
{/BBOXCENTER}
