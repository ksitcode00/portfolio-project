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

## Result Workbook Organization

The original analysis used two Excel result workbooks to organize the statistical outputs for review.

The first workbook focused on exploratory and descriptive results. It contained raw and log-scale pollutant summaries, before-vs-after log-transformation review, lung-function correlations, health-outcome group differences, non-health group differences, descriptive statistics by household characteristics, and subgroup analyses such as electricity-only and focus-vs-regular comparisons.

The second workbook focused on modeling results. It organized univariate logistic regression outputs, pollutant-specific screening, wheezing/cough/phlegm/breathlessness models, FVC/FEV1/PEF ratio analyses, mediation analyses, lung-disease models, and multivariable regression summaries.

These workbooks were used as intermediate analytical products: they made it easier to compare candidate predictors, review tables and graphs, track subgroup findings, and decide which outputs belonged in the manuscript-facing tables and figures.

## Model Selection

The modeling workflow used both univariate screening and multivariable selection.

First, candidate variables were evaluated one at a time. For binary health outcomes, the workflow used univariate logistic regression with likelihood-ratio tests. For continuous pollutant outcomes, the workflow used log-transformed linear models and F-tests where appropriate. This stage was used to understand which pollutant, health, lung-function, and household variables showed evidence of association before fitting larger models.

Second, multivariable models used a fixed-plus-backward-selection approach. Four variables were treated as a priori fixed variables and were forced into the main models:

- cookstove type
- electricity access
- focus vs regular village-program group
- indoor vs outdoor kitchen location

Other household predictors, including education, income, roof material, kitchen ventilation, and household size, were treated as selectable candidates.

I implemented this using custom backward-selection functions in R. The logistic version used `drop1()` likelihood-ratio or F tests depending on the detected model family and dispersion; the linear-model version used `drop1()` F tests. The functions preserved all locked variables and only removed selectable predictors. Candidate variables were retained at `p <= 0.20`, a liberal threshold used for purposeful model-building so potentially important confounders were not removed too aggressively.

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
