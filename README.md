# Radiomics-based prediction of portal hypertension severity and of liver-related events using routine CT scans of patients with cirrhosis

**Hepatic venous pressure gradient (HVPG)** is the reference standard to diagnose portal hypertension. Elevated HVPG is predictive of hepatic decompensation and mortality [Ripoll, 2007], and its measurement is indicated for diagnosis, therapy monitoring and risk stratification.  However, HVPG measurement is invasive, relatively expensive and requires specialized medical infrastructure and expertise.  Therefore, a non-invasive alternative is highly desirable.

In this project, we developed a radiomics-based model for the non-invasive determination of HVPG > 10mmHg (clinically significant portal hypertension, CSPH) from abdominal CT scans.

<img src="https://user-images.githubusercontent.com/24319152/237040958-8ee75b95-eb99-4b91-a0b1-7c9071f80a96.png" style="width: 55vw; min-width: 330px;">

This work is published in <<<>>>


## Code base for analysis
This codebase is organized in 3 main folders:

### scripts_0preprocessing
  - clean the metadata
  - preprocess raw images
  - extract radiomics features

### scripts_1ml
  - explore the feature space
  - feature selection and batch correction
  - train and optimize a random forest classifier to predict for HVPG ≥10 mmHg
  - evaluate performance of the model
### scripts_cox (Lorenz Balcar/Bernhard Scheiner)
  - preform cox regression analysis for prognosis endpoints



## References
Ripoll, C. et al. Hepatic venous pressure gradient predicts clinical decompensation in patients with compensated cirrhosis. Gastroenterology 133, 481–488 (2007)
