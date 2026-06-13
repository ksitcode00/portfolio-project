# Heat Wave and NCD Symptom Analysis with R

This project is a public, sanitized portfolio version of an accepted research publication on heat-wave and dust-storm impacts among adults with non-communicable diseases in a refugee-camp setting.

The private research project used longitudinal survey data collected across three heat-wave-aligned phases. The public version does not include the original participant-level data, cleaned clinic dataset, manuscript drafts, or reviewer files. Instead, it shows the R workflow with synthetic data that mirrors the analytical structure without exposing sensitive information.

## Purpose

The goal is to show how I used R to move from messy longitudinal health-survey data to interpretable epidemiologic results for a manuscript. This project demonstrates reproducible data cleaning, repeated-measures modeling, symptom categorization, model comparison, visualization, and careful public communication of restricted research.

## Problem

Climate-linked heat waves and dust storms can worsen symptoms among patients with chronic diseases, but quantitative evidence from displaced and low-resource settings is limited. The study asked:

1. Do reported heat-wave and dust-storm health impacts change across survey phases?
2. Which NCD groups and symptoms are most associated with climate-related impacts?
3. How can repeated participant observations be modeled while accounting for within-person correlation?
4. How can sensitive human-subjects work be presented publicly without releasing restricted data?

## What This Public Project Does

- Generates synthetic panel data with the same broad structure as the research analysis.
- Cleans categorical and binary health-survey variables in R.
- Summarizes symptom rates across three survey phases.
- Fits generalized estimating equation models for population-averaged effects.
- Fits mixed-effects logistic models with participant random intercepts.
- Compares categorical, linear, and quadratic time specifications using AIC.
- Exports odds-ratio tables, phase summaries, model-comparison outputs, and a trend plot.

## Skills Demonstrated

- R programming for applied public-health analysis
- `dplyr`, `tidyr`, `stringr`, `ggplot2`, `geepack`, `lme4`, and `emmeans`
- Longitudinal data reshaping and repeated-measures design
- Symptom keyword grouping from survey response fields
- GEE logistic regression with robust standard errors
- GLMM logistic regression with random intercepts
- Odds-ratio and confidence-interval reporting
- Model selection with AIC
- Data privacy judgment for public portfolios
- Translating statistical results into publication-ready language

## Analysis Summary

In the accepted manuscript, the analysis found that climate-related health impacts were highest during the hottest phase and declined during later phases. Heat-wave impacts were most clearly associated with asthma, hypertension, cardiovascular conditions, dyspnea, and fatigue. Dust-storm impacts were most clearly associated with asthma, dyspnea, and allergy-related symptoms.

The public code recreates the same analytical pattern using synthetic data. The numeric outputs in this repository are examples from synthetic data and should not be interpreted as study findings.

## Publication Context

This project contributed to an accepted publication on heat, dust, and NCD symptom burden in a refugee-camp setting. My contribution included data analysis in R and manuscript drafting support. The GitHub version is intentionally sanitized so it can showcase the technical workflow while respecting participant privacy, collaborator confidentiality, and publication boundaries.

## Repository Contents

```text
.
|-- data/
|   `-- synthetic_ncd_heatwave_panel.csv
|-- docs/
|   |-- data_privacy.md
|   `-- methods_summary.md
|-- results/
|   |-- gee_odds_ratios.csv
|   |-- glmm_phase_contrasts.csv
|   |-- glmm_time_spec_aic.csv
|   |-- phase_prevalence.csv
|   `-- plots/
|       `-- synthetic_phase_symptom_trends.png
|-- scripts/
|   |-- 01_generate_synthetic_data.R
|   `-- 02_heatwave_ncd_analysis.R
`-- README.md
```

## How To Run

From this project folder:

```bash
Rscript scripts/01_generate_synthetic_data.R
Rscript scripts/02_heatwave_ncd_analysis.R
```

Required R packages:

```r
c("dplyr", "tidyr", "stringr", "ggplot2", "geepack", "lme4", "emmeans", "readr")
```

## Data Note

The real research data are not included. The included synthetic dataset is generated from scratch and is only meant to make the analysis code executable. See [docs/data_privacy.md](docs/data_privacy.md) for the public-release boundary.
