# Methods Summary

## Research Context

The accepted study examined short-term health impacts of heat waves and dust storms among adults living with non-communicable diseases in a refugee-camp setting. Data were collected across three survey phases aligned with seasonal heat-wave periods.

## Analytical Framing

The core analytical question was whether the probability of reporting climate-related health effects changed across survey phases after accounting for repeated observations from the same person and adjusting for patient and household characteristics.

## R Workflow

1. Read the cleaned study data and the heat-wave/dust-storm severity-score file.
2. Select the phase-specific demographic, clinical, exposure, symptom, and severity fields needed for analysis.
3. Standardize categories such as income group, household size, household area, and survey phase.
4. Reshape heat-wave and dust-storm records from wide format into long repeated-measures datasets.
5. Clean symptom text and map responses into common symptoms and broader clinical categories.
6. Create indicators for key NCD histories, including hypertension, asthma, thyroid disease, and cardiovascular disease.
7. Fit GLMM models for subject-specific inference with participant random intercepts.
8. Fit GEE models for population-averaged inference with robust standard errors.
9. Compare time specifications and working-correlation choices.
10. Report odds ratios, confidence intervals, p-values, model diagnostics, and pairwise phase contrasts.

## Interpretation Pattern

The manuscript interpretation was that reported heat-wave and dust-storm impacts were highest during the hottest study period and lower in later phases. Heat-wave impacts were most clearly connected to asthma, hypertension, cardiovascular conditions, dyspnea, and fatigue. Dust-storm impacts were most clearly connected to asthma, dyspnea, and allergy-related symptoms.
