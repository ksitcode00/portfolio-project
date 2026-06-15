# Heat Wave Symptom Analysis with R

This project is a private portfolio draft for an accepted research publication on heat-wave and dust-storm impacts among adults with non-communicable diseases in a refugee-camp setting.

The main code artifact is an adapted copy of my original R Markdown analysis file:

```text
analysis/Heatwave_V1_original_research_code.Rmd
```

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

## Data Note

The repo intentionally excludes participant-level data, original free-text responses, manuscript drafts, review files, and internal collaboration notes. See [docs/data_privacy.md](docs/data_privacy.md) for the release boundary.
