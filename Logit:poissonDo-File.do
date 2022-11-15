logit damage c.AircraftNumberofengines c.year i.Season i.timeofday i.phase_of_flight i.Animal_type i.Animal_type#Season i.Animal_type#c.year
estat gof, group(20)
estimates store modelA
estat ic//AIC 1820.157
logit damage c.AircraftNumberofengines c.year i.Season i.timeofday i.phase_of_flight i.Animal_type i.Animal_type#Season
estat ic//AIC 1812.506
logit damage c.AircraftNumberofengines c.year i.Season i.timeofday i.phase_of_flight i.Animal_type i.Animal_type#c.year
estat ic
logit damage c.AircraftNumberofengines c.year i.Season i.timeofday i.phase_of_flight i.Animal_type 
estat ic//AIC 1823.701
logit damage c.AircraftNumberofengines c.year i.Season i.timeofday i.Animal_type i.Animal_type#Season
estat ic//1841.72
logit damage c.AircraftNumberofengines c.year i.Season i.phase_of_flight i.Animal_type i.Animal_type#Season
estat ic//1809.158
logit damage c.AircraftNumberofengines i.Season i.phase_of_flight i.Animal_type i.Animal_type#Season
estat ic//1821.395
logit damage c.year i.Season i.phase_of_flight i.Animal_type i.Animal_type#Season
estat ic//1860.215

use "C:\Users\chifu\Downloads\calilfornia_flights.dta", clear
poisson numberofcases c.year i.month i.timeofday i.phase_of_flight i.Animal_type
poisson numberofcases c.year i.month i.timeofday i.phase_of_flight i.Animal_type c.year#i.Animal_type i.month#i.Animal_type
estat gof
estimates store modelAA
poisson numberofcases c.year i.month i.timeofday i.phase_of_flight i.Animal_type i.month#i.Animal_type//P-Value of 0.0133 so year interaction is significant
estimates store modelBB
lrtest modelAA modelBB
poisson numberofcases c.year i.month i.timeofday i.phase_of_flight i.Animal_type c.year#i.Animal_type
estimates store modelCC
lrtest modelAA modelCC 
poisson numberofcases c.year i.Season i.timeofday i.phase_of_flight i.Animal_type c.year#i.Animal_type i.Season#i.Animal_type
estat gof
estimates store modelANEW
poisson numberofcases c.year i.Season i.timeofday i.phase_of_flight i.Animal_type i.Season#i.Animal_type
estimates store modelBNEW
lrtest modelANEW modelBNEW
poisson numberofcases c.year i.Season i.timeofday i.phase_of_flight i.Animal_type c.year#i.Animal_type
estimates store modelCNEW
lrtest modelANEW modelCNEW
