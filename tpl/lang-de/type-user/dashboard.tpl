<br>
{BLINK|Fragebogen neu starten|user_questions}
<br><br>

{BBOX}
{BCOL|boxsize::6}

{BPANEL|paneltitle::Status Fragenkatalog}

{%graph}

{/BPANEL}


{/BCOL}

{BCOL}
{BPANEL|paneltitle::Ergebnisse}

{%resultgraph}

{/BPANEL}
{/BCOL}

{BCOL|boxsize::12}

{BPANEL|paneltitle::Empfehlungen}

%if(!{%hide_results}):
{BFORMSTART|user_questions}
{HIDDEN|action|saveresults}

<table class="recommendation-table">
<tr><th>Umgesetzt</th><th>Maßnahme</th><th>Video</th><th>Link</th><th>Dokument</th></tr>
{%recommendations}
</table>

<br>

{BFORMSUBMIT}
{BFORMEND}
%else:
Gratulation, sie haben alle Empfehlungen umgesetzt!
%endif;

{/BPANEL}
{/BCOL}
{/BBOX}