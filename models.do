cd "C:\Users\Bence\Desktop\metrics2\project"

logit choice response response_pos2 response_pos3 struncert2 period
outreg2 using logitoutput.doc, replace ctitle(logit model)

logit choice response response_pos2 response_pos3 struncert2 i.crt_sum riskav gender period
outreg2 using logitoutput.doc, append ctitle(logit+con)

xtlogit choice response response_pos2 response_pos3 struncert2 period, fe
outreg2 using logitoutput.doc, append ctitle(fixed effect)

xtlogit choice response response_pos2 response_pos3 struncert2 period, re
outreg2 using logitoutput.doc, append ctitle(random effect)


cd "C:\Users\Bence\Desktop\metrics2\project\doc\build"
logit choice response response_pos2 response_pos3 struncert2 period
outreg2 using logitoutput.tex, replace ctitle(logit model) tex(fragment pretty) 

logit choice response response_pos2 response_pos3 struncert2 i.crt_sum riskav gender period
outreg2 using logitoutput.tex, append ctitle(logit w/controls) tex(fragment pretty) 

xtlogit choice response response_pos2 response_pos3 struncert2 period, fe
outreg2 using logitoutput.tex, append ctitle(fixed effect) tex(fragment pretty) 
