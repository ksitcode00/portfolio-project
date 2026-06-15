# Methods Summary

## Research Context

<<<<<<< HEAD
The accepted study examined short-term health impacts of heat waves and dust storms among adults living with non-communicable diseases in a refugee-camp setting. Data were collected across three survey phases aligned with seasonal heat-wave periods.

## Analytical Framing

The core analytical question was whether the probability of reporting climate-related health effects changed across survey phases after accounting for repeated observations from the same person and adjusting for patient and household characteristics.
=======
The accepted study examined short-term health impacts of heat waves and dust storms among adults living with noncommunicable diseases in a refugee-camp setting. Data were collected from 660 adults across three survey phases aligned with seasonal heat-wave periods. T1 reached 43 degrees C, T2 reached 37 degrees C, and T3 reached 35 degrees C.

## Analytical Framing

The core analytical question was whether the probability of reporting heat-wave or dust-storm impacts changed across survey phases after accounting for repeated observations from the same person and adjusting for patient and household characteristics.

The wording matters: the models evaluate factors associated with reporting heat-wave or dust-storm impacts, not direct measured exposure.
>>>>>>> 761cddac4365a9a681da0a81ba9ecc169ec0e596

## R Workflow

1. Read the cleaned study data and the heat-wave/dust-storm severity-score file.
<<<<<<< HEAD
2. Select the phase-specific demographic, clinical, exposure, symptom, and severity fields needed for analysis.
=======
2. Select the phase-specific demographic, clinical, reported-impact, symptom, and severity fields needed for analysis.
>>>>>>> 761cddac4365a9a681da0a81ba9ecc169ec0e596
3. Standardize categories such as income group, household size, household area, and survey phase.
4. Reshape heat-wave and dust-storm records from wide format into long repeated-measures datasets.
5. Clean symptom text and map responses into common symptoms and broader clinical categories.
6. Create indicators for key NCD histories, including hypertension, asthma, thyroid disease, and cardiovascular disease.
7. Fit GLMM models for subject-specific inference with participant random intercepts.
8. Fit GEE models for population-averaged inference with robust standard errors.
<<<<<<< HEAD
9. Compare time specifications and working-correlation choices.
10. Report odds ratios, confidence intervals, p-values, model diagnostics, and pairwise phase contrasts.
=======
9. Compare random-intercept and random-slope structures, retaining random-intercept models when random-slope fits were singular or over-parameterized.
10. Compare categorical, linear, and quadratic time specifications.
11. Check GEE working-correlation choices.
12. Report odds ratios, confidence intervals, p-values, model diagnostics, and pairwise phase contrasts.

## Modeling Notes

GLMM and GEE answer complementary questions. GLMM estimates subject-specific associations, while GEE estimates population-average associations that are useful for public health interpretation.

Covariates should be described as clinically and confounding-relevant adjustment variables rather than variables selected only because they were significant in univariate models. The core adjustment set included age group, gender, family size, monthly income, household area, and NCD category.

Because many symptom outcomes were modeled, symptom-specific findings should be interpreted with care. The manuscript reports two-sided unadjusted p-values; a future sensitivity analysis could add false discovery rate adjustment.
>>>>>>> 761cddac4365a9a681da0a81ba9ecc169ec0e596

## Interpretation Pattern

The manuscript interpretation was that reported heat-wave and dust-storm impacts were highest during the hottest study period and lower in later phases. Heat-wave impacts were most clearly connected to asthma, hypertension, cardiovascular conditions, dyspnea, and fatigue. Dust-storm impacts were most clearly connected to asthma, dyspnea, and allergy-related symptoms.
