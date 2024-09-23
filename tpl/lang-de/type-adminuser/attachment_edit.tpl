{BBOXCENTER}
{BPANEL|paneltitle::Edit Attachment}

{BFORMSTART|attachment}
{HIDDEN|action|editdo}
{HIDDEN|object_id|{%id}}
{HIDDEN|form_token|{%form_token}}

{BFORMGRP|User}{%list_user}{/BFORMGRP}
{BTEXT|file|{*file}|texttitle::File}


{BFORMSUBMIT|class::center-block}
{BFORMEND}
{BLINK|Back|javascript:history.go(-1);}

{/BPANEL}
{/BBOXCENTER}
