# Methods Summary

## Analysis Goal

The analysis estimated whether Integrated Domestic Energy System cookstove households had lower indoor pollutant concentrations than traditional cookstove households and whether household characteristics helped explain exposure differences.

## Data Preparation

The original R Markdown workflow cleaned household survey fields, recoded categorical variables, constructed respiratory outcomes, created lung-function indicators, and separated pollutant outcomes into 24-hour and cooking-period measures.

Important derived variables included:

- cookstove type: IDES vs traditional
- electricity access
- focus vs regular village-program group
- indoor vs outdoor kitchen location
- grouped education, income, roof material, and household size
- cough, phlegm, breathlessness, and wheezing outcomes
- FEV1, FVC, and PEF ratio indicators
- log-transformed pollutant outcomes

## EDA and Assumption Checking

Pollutant variables were evaluated using density plots, Q-Q plots, and group-wise descriptive summaries. The raw pollutant outcomes were right-skewed, so the main adjusted models used log-transformed pollutant outcomes.

Group comparisons used parametric or nonparametric tests depending on distributional assumptions and group structure.

## Pollutant Regression Models

Adjusted pollutant models used log-transformed pollutant concentrations as continuous outcomes. Coefficients were exponentiated to produce concentration ratios and then translated into percent differences.

This made the results interpretable as:

```text
percent difference = (exp(beta) - 1) * 100
```

The main exposure was IDES vs traditional cookstove use. Core adjustment variables included electricity access, village-program group, kitchen location, and other household predictors.

## Logistic Regression

Logistic regression models evaluated binary respiratory and lung-function outcomes. Outcomes included wheezing, cough, phlegm, breathlessness, and composite lung-disease indicators.

Diagnostics included checks for multicollinearity, influential observations, dispersion, and model fit.

## Mediation Analysis

Mediation analysis explored whether pollutant concentrations could act as mediators between cookstove type and health outcomes. The workflow estimated ACME, ADE, and total effects, with bootstrap confidence intervals.

Mediators included individual pollutant variables and PCA-based combined pollutant components for 24-hour and cooking-period exposure windows.

## Causal-Inference Sensitivity Analysis

The observational design limits causal claims. To strengthen interpretation, the workflow included:

- propensity score estimation
- stabilized inverse probability weighting
- covariate balance diagnostics
- weighted outcome models
- effective sample size review
- E-value sensitivity analysis

These analyses were used to assess robustness and sensitivity to confounding, not to convert the study into a randomized design.

