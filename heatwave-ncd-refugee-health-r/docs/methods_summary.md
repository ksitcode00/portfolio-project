# Methods Summary

## Research Context

The accepted study examined short-term health impacts of heat waves and dust storms among adults living with non-communicable diseases in a refugee-camp setting. Data were collected across three survey phases aligned with seasonal heat-wave periods.

## Analytical Framing

The core analytical question was whether the probability of reporting climate-related health effects changed across survey phases after accounting for repeated observations from the same person and adjusting for patient and household characteristics.

## R Workflow Represented Here

1. Standardize categorical variables such as income group, household size, and survey phase.
2. Reshape repeated phase-specific fields into a long panel format.
3. Convert symptom text into clinically meaningful binary categories.
4. Summarize climate-related symptom burden by survey phase.
5. Fit population-averaged GEE logistic models for heat-wave, dust-storm, and symptom outcomes.
6. Fit subject-specific GLMM logistic models with participant random intercepts.
7. Compare categorical, linear, and quadratic time specifications using AIC.
8. Report odds ratios, confidence intervals, and phase contrasts.

## Interpretation Pattern

The original accepted manuscript found that reported health impacts were highest during the hottest survey period and lower in later phases. Heat-wave impacts were most clearly connected to asthma, hypertension, cardiovascular conditions, dyspnea, and fatigue. Dust-storm impacts were most clearly connected to asthma, dyspnea, and allergy-related symptoms.

The public scripts reproduce that style of analysis using synthetic data only.
