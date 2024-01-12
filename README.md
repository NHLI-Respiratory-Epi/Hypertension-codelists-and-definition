# Defining hypertension in electronic healthcare records: SNOMED CT #

NICE Guidelines for hypertension medications
To define hypertension using prescriptions we used the guidelines available by NICE: **https://www.nice.org.uk/guidance/ng136/resources/visual-summary-pdf-6899919517**

##Data source##
These codelists were derived from the CPRD data dictionary, reported codes are in the form of SNOMED CT.

##Codelists##
**Observations**
The observation file provides the SNOMED CT codes which relate to hypertension, these were further subdivided into: 
	- invitation for hypertension monitoring, 
 	- self-controlled hypertension, 
	- review of hypertension, 
  - well controlled hypertension, 
  - moderate/poorly controlled hypertension

**Blood pressure readings**
These values were further subdivided into systolic and diastolic codes, when these codes have associated 'values' which are high (guidelines in brackets), they can indicate a patient has hypertension
	- Systolic (>130)
 	- Diastolic (>80)
	
**Prescriptions**
Both codes for medications prescribed for hypertension as well as resistant hypertension are included.
