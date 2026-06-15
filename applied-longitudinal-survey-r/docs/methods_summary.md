# Methods Summary

## Research Context

The accepted study examined short-term symptom burden among adults with chronic conditions in a resource-limited setting. Data were collected from 660 adults across three repeated survey phases tied to changing environmental conditions.

## Analytical Framing

The core analytical question was whether the probability of reporting health impacts changed across survey phases after accounting for repeated observations from the same person and adjusting for patient and household characteristics.

The wording matters: the models evaluate factors associated with reporting impacts and symptoms, not direct measured exposure.

## R Workflow

1. Read the cleaned study data and symptom-severity score file.
2. Select the phase-specific demographic, clinical, reported-impact, symptom, and severity fields needed for analysis.
3. Standardize categories such as income group, household size, household area, and survey phase.
4. Reshape repeated phase-specific records from wide format into long repeated-measures datasets.
5. Clean symptom text and map responses into common symptoms and broader clinical categories.
6. Create chronic-condition history indicators used for adjustment.
7. Fit GLMM models for subject-specific inference with participant random intercepts.
8. Fit GEE models for population-averaged inference with robust standard errors.
9. Compare random-intercept and random-slope structures, retaining random-intercept models when random-slope fits were singular or over-parameterized.
10. Compare categorical, linear, and quadratic time specifications.
11. Check GEE working-correlation choices.
12. Report odds ratios, confidence intervals, p-values, model diagnostics, and pairwise phase contrasts.

## Modeling Notes

GLMM and GEE answer complementary questions. GLMM estimates subject-specific associations, while GEE estimates population-average associations that are useful for public health interpretation.

Covariates should be described as clinically and confounding-relevant adjustment variables rather than variables selected only because they were significant in univariate models. The core adjustment set included age group, gender, family size, monthly income, household area, and chronic-condition category.

Because many symptom outcomes were modeled, symptom-specific findings should be interpreted with care. The manuscript reports two-sided unadjusted p-values; a future sensitivity analysis could add false discovery rate adjustment.

## Interpretation Pattern

The manuscript interpretation was that reported impacts were highest during the most intense study period and lower in later phases. Respiratory history, household size, breathing-related symptoms, fatigue, and allergy-related symptoms were important parts of the interpretation.
