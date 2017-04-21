cd "C:\Users\Bence\Desktop\metrics2\project"
use data.dta

xtset subject period



//demean

egen mean_choice = mean(choice), by(subject)
generate demeaned_choice = choice- mean_choice

egen mean_response = mean(response), by(subject)
generate demeaned_response = response- mean_response

egen mean_struncert2 = mean(struncert2), by(subject)
generate demeaned_struncert2 = struncert2 - mean_struncert2

//gen data

gen pos3=0
replace pos3=1 if postion == 3
gen response_pos3 = response*pos3

gen pos2=0
replace pos2=1 if postion == 2
gen response_pos2 = response*pos2

*FOR ACADEMIC WRITING
//basic regression
regress response gender riskav CRT_sum sqCRT_sum Struncert2 i.postion
outreg2 using output.doc, replace ctitle(Model 1)

//basic figures 
graph box response, over(CRT_sum)
graph export boxplot.png

graph twoway (qfitci response CRT_sum) (scatter response CRT_sum)
graph export scatterplot_quadraticfit.png


*other models
regress response gender riskav CRT_sum sqCRT_sum Struncert2 i.postion period



	