<<<<<<< HEAD
# Heat Wave and NCD Symptom Analysis with R

This project is a private portfolio draft for an accepted research publication on heat-wave and dust-storm impacts among adults with non-communicable diseases in a refugee-camp setting.
=======
# Longitudinal Analysis of Climate Related Health Symptoms Among Refugees With NCDs

This project is an applied public health statistics project based on an accepted research publication on heat-wave and dust-storm impacts among adults with noncommunicable diseases (NCDs) in Refugee Camp.

This is not positioned as a machine learning project. The strongest technical focus is longitudinal health-survey analysis: repeated measurements, symptom text cleaning, clinically meaningful outcome construction, GLMM/GEE modeling, odds ratios, confidence intervals, diagnostics, and public health interpretation.
>>>>>>> 761cddac4365a9a681da0a81ba9ecc169ec0e596

The main code artifact is an adapted copy of my original R Markdown analysis file:

```text
analysis/Heatwave_V1_original_research_code.Rmd
```

<<<<<<< HEAD
I kept the original analytical workflow, including the data cleaning, symptom grouping, wide-to-long reshaping, GLMM modeling, GEE modeling, model diagnostics, phase contrasts, and severity-score analysis. I only changed the GitHub copy where needed to remove local machine paths and a participant-specific manual correction line. The original files in my research folder were not edited.

## Purpose

The purpose of this project was to quantify how heat waves and dust storms affected symptom burden among patients with NCDs in a displaced, low-resource setting. The analysis was written for a manuscript, not just a portfolio exercise, so the code focuses on answering a real research question clearly enough to support publication tables and interpretation.

## Problem

Climate-linked extreme heat and dust exposure can worsen chronic disease symptoms, but there is limited quantitative evidence from refugee-camp settings. This project asked:

1. Did reported heat-wave and dust-storm impacts change across three survey phases?
2. Which symptoms were most strongly associated with heat and dust exposure?
3. Which patient groups, especially people with asthma, hypertension, or cardiovascular disease, appeared more vulnerable?
4. How should repeated observations from the same participants be modeled in R?

## What We Did

- Cleaned survey data collected across three phases aligned with heat-wave periods.
- Combined the cleaned study data with heat-wave and dust-storm symptom-severity scores.
- Reshaped wide phase-specific survey fields into long repeated-measures datasets.
- Converted free-text symptom responses into clinically meaningful binary symptom groups.
- Built separate heat-wave and dust-storm analysis datasets.
- Modeled binary outcomes with generalized linear mixed-effects models and generalized estimating equations.
- Compared random-intercept and random-slope specifications, then retained the random-intercept structure when the random-slope models showed boundary or singular-fit issues.
- Compared categorical, linear, and quadratic time specifications using AIC.
- Reported odds ratios, confidence intervals, p-values, phase contrasts, and model diagnostics.

## Skills Demonstrated

- R and R Markdown for applied public-health research
- `readr`, `dplyr`, `tidyr`, `stringr`, `purrr`, `lme4`, `geepack`, `emmeans`, and diagnostic packages
- Longitudinal survey data cleaning
- Repeated-measures modeling
- GLMM and GEE logistic regression
- Symptom text standardization and keyword-based clinical grouping
- Model-selection judgment using AIC and diagnostics
- Robust standard errors and phase-contrast interpretation
- Manuscript-oriented statistical reporting
- Privacy-aware handling of restricted human-subjects data

## Analysis Summary

Using the final manuscript as the writing reference, the main interpretation was that heat waves and dust storms were associated with measurable negative health impacts among adults with NCDs. Reported impacts were highest during the hottest study phase and generally declined in later phases as temperatures and dust conditions eased.

Heat-wave effects were most clearly connected to asthma, hypertension, cardiovascular conditions, dyspnea, and fatigue. Dust-storm effects were most clearly connected to asthma, dyspnea, and allergy-related symptoms. These findings supported the need for climate-adaptation planning, patient education, symptom surveillance, cooling access, shading, and dust-mitigation strategies in low-resource displacement settings.
=======
I kept the original analytical workflow, including data cleaning, symptom grouping, wide-to-long reshaping, GLMM modeling, GEE modeling, model diagnostics, phase contrasts, and severity-score analysis. I only changed the GitHub copy where needed to remove local machine paths and a participant-specific manual correction line. The original files in my research folder were not edited.

## 1. Project Overview

This project analyzes how heat waves and dust storms are associated with short-term symptom burden among adults with NCDs in Za'atari Refugee Camp. The goal is to translate a public health research paper into a reproducible statistical analysis workflow in R.

The study followed 660 adults across three heat-wave-aligned survey phases. The first phase corresponded to the most severe heat period, with temperatures reaching 43 degrees C. The second and third phases reached 37 degrees C and 35 degrees C, respectively.

## 2. Research Question

How do reported health impacts and symptoms change across three heat-wave-aligned survey phases, and which patient groups appear most vulnerable?

The wording is intentionally about reported impacts rather than exposure alone. The survey outcomes measure whether participants reported being affected by heat waves or dust storms and which symptoms they reported, not direct personal exposure measurements.

## 3. Data And Study Design

The project uses a prospective repeated-measures design. Adults with NCDs were surveyed across three seasonal phases aligned with heat-wave periods. The main outcomes include reported heat-wave impact, reported dust-storm impact, symptom indicators, and symptom-severity scores.

Symptoms were self-reported. The raw data are not shared in this repository because they contain participant-level clinical, demographic, household, and symptom information from a vulnerable population.

## 4. Data Cleaning Pipeline

The original survey data were stored in wide format, with repeated phase-specific fields for heat-wave and dust-storm questions. The R workflow:

- reads the cleaned study file and the symptom-severity score file
- standardizes income, household, demographic, and clinical categories
- separates heat-wave and dust-storm analysis datasets
- reshapes repeated T1/T2/T3 fields from wide format into long format
- cleans self-reported symptom text
- maps free-text symptoms into common symptoms and broader clinical categories
- creates NCD history indicators for hypertension, asthma, thyroid disease, and cardiovascular disease

This symptom text cleaning step is one of the strongest data-science pieces of the project because it turns messy self-reported health text into analyzable clinical features.

## 5. Exploratory Data Analysis

The analysis reviews participant demographics, NCD prevalence, symptom frequencies by phase, and the distribution of reported heat-wave and dust-storm impacts. These checks guided the modeling workflow and helped identify the main symptom outcomes to report.

Recommended recruiter-facing visuals for the next cleanup pass:

- symptom frequency plot for dyspnea, fatigue, headache, sweating, allergy, and hypertension across T1, T2, and T3
- distribution of reported heat-wave and dust-storm impacts by phase
- NCD prevalence summary for the study population

## 6. Statistical Modeling Strategy

Binary outcomes were modeled with logistic regression because the primary outcomes were yes/no indicators, such as whether a participant reported being affected or reported a specific symptom.

Repeated measurements required methods that account for within-person correlation. The workflow used:

- GLMM for subject-specific effects with participant random intercepts
- GEE for population-average effects, which are useful for public health interpretation

Covariates were treated as clinically and confounding-relevant adjustment variables, not selected only by univariate p-values. The core adjustment set included age group, gender, family size, monthly income, household area, and NCD category.

## 7. Model Selection And Diagnostics

The analysis compared random-intercept models with random-intercept-plus-slope models. Random-slope models were not retained when diagnostics showed singular or boundary fits and over-parameterization with only three time points.

The workflow also compared categorical, linear, and quadratic time specifications using AIC. Categorical phase was preferred for interpretability and because the survey phases corresponded to specific seasonal heat-wave periods.

For GEE models, the analysis considered working-correlation structure and used robust standard errors. Phase contrasts were reported as odds ratios with 95 percent confidence intervals.

## 8. Key Findings

The manuscript interpretation was that reported heat-wave and dust-storm impacts were highest during the hottest study period and generally declined in later phases as temperatures and dust conditions eased.

Key findings included:

- reported heat-wave impacts declined after T1, the hottest phase
- asthma was strongly associated with heat-wave-related dyspnea
- larger households were associated with higher fatigue odds during heat-wave periods
- dust-storm impacts declined after T1
- asthma was associated with higher odds of dust-storm-related dyspnea and allergy

These findings are framed as associations with reported impacts and symptoms, not strict causal effects.

## 9. Public Health Interpretation

The results support targeted climate-adaptation strategies for high-risk NCD patients in low-resource displacement settings. Practical implications include cooling access, shade, dust mitigation, patient education, symptom surveillance, and targeted support for patients with asthma or other chronic conditions that may worsen during extreme weather.

## 10. Limitations

Important limitations include:

- symptoms were self-reported
- objective clinical measures were not collected during interviews to verify symptom reports
- complete-case analysis may introduce selection bias if missingness is not random
- seasonal changes may confound phase comparisons
- many outcomes were tested, so some symptom-specific findings should be interpreted as exploratory
- p-values were two-sided and unadjusted
- associations should not be interpreted as strict causal effects

A future analysis cleanup could add a false discovery rate sensitivity table for the larger set of symptom models.

## 11. Reproducibility

The original data are restricted and are not included in this repository. Authorized users can place the required private files at:

```text
data/private/NCD_Data_clean_categories.csv
data/private/HW_DS_Severity_Scale.csv
```

Then open and run:

```text
analysis/Heatwave_V1_original_research_code.Rmd
```

The current R Markdown file preserves the original research workflow. Before using this for a public job-application portfolio, I would refactor it into cleaner scripts:

```text
R/01_data_cleaning.R
R/02_symptom_grouping.R
R/03_eda.R
R/04_glmm_models.R
R/05_gee_models.R
R/06_make_tables_figures.R
```

Suggested output folders for a public-facing version:

```text
outputs/tables/
outputs/figures/
```

## 12. Skills Demonstrated

- R programming
- R Markdown research workflow
- longitudinal survey data analysis
- messy health-survey data cleaning
- wide-to-long repeated-measures restructuring
- self-reported symptom text standardization
- clinical symptom categorization
- GLMM and GEE logistic regression
- model diagnostics and model-selection judgment
- odds-ratio and confidence-interval interpretation
- public health statistical communication
- privacy-aware handling of restricted human-subjects data
>>>>>>> 761cddac4365a9a681da0a81ba9ecc169ec0e596

## Publication Context

This analysis contributed to an accepted publication. My role included R-based data analysis and manuscript drafting support. The writing in this portfolio is based on the framing and interpretation from my final manuscript draft, while keeping restricted study data and internal manuscript files out of GitHub.

## Repository Contents

```text
.
|-- .gitignore
|-- analysis/
|   `-- Heatwave_V1_original_research_code.Rmd
|-- data/
|   `-- README.md
|-- docs/
|   |-- data_privacy.md
|   `-- methods_summary.md
|-- results/
|   `-- README.md
`-- README.md
```

<<<<<<< HEAD
## How To Run

The original data are restricted and are not included in this repository. Authorized users can place the required private files at:

```text
data/private/NCD_Data_clean_categories.csv
data/private/HW_DS_Severity_Scale.csv
```

Then open and run:

```text
analysis/Heatwave_V1_original_research_code.Rmd
```

=======
>>>>>>> 761cddac4365a9a681da0a81ba9ecc169ec0e596
## Data Note

The repo intentionally excludes participant-level data, original free-text responses, manuscript drafts, review files, and internal collaboration notes. See [docs/data_privacy.md](docs/data_privacy.md) for the release boundary.
