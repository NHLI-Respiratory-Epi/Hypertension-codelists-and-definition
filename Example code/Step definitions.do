  
** Using your cohorts data for your defined study period**  
  sort patid obsdate
** Define time between prescriptions, we choose to only review prescriptions given on the same day, however you may choose an alternative**  
  by patid: generate BetweenPrescriptions = obsdate - obsdate[_n-1]
*This keep line has now been removed to ensure single therapies are retained.
**keep if BetweenPrescriptions==0 | BetweenPrescriptions[_n+1]==0
 
  by patid: gen litn=_n
  destring ACEi ARB CCB Thiazides, replace

  collapse (max) ACEi ARB CCB Thiazides, by(patid obsdate)
 **data standardisation** 
  replace ACEi=0 if ACEi==.
  replace ARB=0 if ARB==.
  replace CCB=0 if CCB==.
  replace Thiazides=0 if Thiazides==.
**count the total prescriptions given in one day (or your defined time between prescriptions)  
  generate Count=ACEi+ARB+CCB+Thiazides
  
  sort patid -Count
  by patid: gen litn=_n
  keep if litn==1
  drop litn

  generate Step=0
  replace Step=1 if Count==1 & (ACEi==1 | ARB==1 |CCB==1)
  replace Step=2 if Count==2 & (((ACEi==1 |ARB==1)&(CCB==1 | Thiazides==1)) | (CCB==1 & (ACEi==1 | ARB==1 |Thiazides==1)))
  replace Step=3 if Count==3 & ((ACEi==1 | ARB==1) & CCB==1 & Thiazides==1)
  
  
