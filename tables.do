cd "C:\Users\Bence\Desktop\metrics2\project\doc\build"

sutex choice response struncert2 crt_sum gender riskav if postion == 1 | postion == 2, lab nobs key(descstat) replace ///
file(descstat.tex) title("Summary statistics at the first and second positions") minmax


sutex choice response struncert2 crt_sum gender riskav if postion == 3, lab nobs key(descstat) replace ///
file(descstat2.tex) title("Summary statistics at the third position") minmax



graph drop _all
histogram response3 if choice==1, ytitle("") xtitle("Response time", size(small)) start(0) width(5) color(gs6) name(case1) plotregion(fcolor(white)) graphregion(fcolor(white))
graph export figure1.png
histogram response3 if choice==0, ytitle("") xtitle("Response time", size(small)) start(0) width(5) color(gs6) name(case2) plotregion(fcolor(white)) graphregion(fcolor(white))
graph export figure2.png


graph combine case1 case2, title("The distribution of response time" "if participants withdraw or wait", color(black)) plotregion(fcolor(white)) graphregion(fcolor(white))
graph export figure.png

