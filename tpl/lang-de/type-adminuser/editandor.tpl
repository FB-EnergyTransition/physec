{BBOXCENTER}
{BPANEL|paneltitle::{%type}-Verknüpfung bearbeiten}
{BLINKADD|Neue Bedingung|question/newcondition/{%object_id}/{%idx}}
{BLINKADD|Neue UND-Verknüpfung|question/newand/{%object_id}/{%idx}}
{BLINKADD|Neue OR-Verknüpfung|question/newor/{%object_id}/{%idx}}

{BFORMSTART|question}
{HIDDEN|action|editcondition}
{HIDDEN|object_id|{%id}}
{HIDDEN|form_token|{%form_token}}

{%questionlist}

{/BPANEL}
{/BBOXCENTER}