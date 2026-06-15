# Applied Longitudinal Survey Modeling With R

This project is an applied public health statistics portfolio project based on a real accepted research study. The GitHub-facing version is intentionally generalized so it can demonstrate the statistical workflow without using the exact study title, site name, population label, manuscript keywords, or restricted participant-level data.

The main code artifact is an adapted copy of my original R Markdown analysis file:

```text
analysis/original_research_analysis.Rmd
```

The original analytical workflow is preserved: data cleaning, symptom grouping, wide-to-long restructuring, repeated-measures modeling, GLMM/GEE modeling, diagnostics, phase contrasts, and severity-score analysis. The GitHub copy removes local machine paths and a participant-specific manual correction line. The original research-folder files were not edited.

## 1. Project Overview

This project analyzes repeated health-survey data from adults with chronic conditions in a resource-limited setting. The goal is to translate an applied public health research study into a reproducible statistical analysis workflow in R.

The study used three survey phases tied to changing environmental conditions. The analysis focuses on how reported health impacts and symptoms changed over time and which participant groups appeared more vulnerable.

## 2. Research Question

How do reported health impacts and symptoms change across repeated survey phases, and which participant groups appear most vulnerable?

The wording is intentionally about reported impacts rather than direct measured exposure. The survey outcomes measure whether participants reported being affected and which symptoms they reported.

## 3. Data And Study Design

The project uses a prospective repeated-measures survey design. Adults with chronic conditions were surveyed across three phases. The main outcomes include reported event impact, symptom indicators, and symptom-severity scores.

Symptoms were self-reported. The raw data are not shared in this repository because they contain participant-level clinical, demographic, household, and symptom information from a vulnerable population.

## 4. Data Cleaning Pipeline

The original survey data were stored in wide format, with repeated phase-specific fields. The R workflow:

- reads the cleaned study file and the symptom-severity score file
- standardizes income, household, demographic, and clinical categories
- separates related event-specific analysis datasets
- reshapes repeated T1/T2/T3 fields from wide format into long format
- cleans self-reported symptom text
- maps free-text symptoms into common symptoms and broader clinical categories
- creates chronic-condition history indicators used for adjustment

This symptom text cleaning step is one of the strongest data-science pieces of the project because it turns messy self-reported health text into analyzable clinical features.

## 5. Exploratory Data Analysis

The analysis reviews participant demographics, chronic-condition prevalence, symptom frequencies by phase, and the distribution of reported impacts. These checks guided the modeling workflow and helped identify the main symptom outcomes to report.

Recommended recruiter-facing visuals for the next cleanup pass:

- symptom frequency plot for the main symptom categories across the three phases
- distribution of reported impacts by phase
- chronic-condition prevalence summary for the study population
- forest plot of odds ratios for the main repeated-measures models

## 6. Statistical Modeling Strategy

Binary outcomes were modeled with logistic regression because the primary outcomes were yes/no indicators, such as whether a participant reported being affected or reported a specific symptom.

Repeated measurements required methods that account for within-person correlation. The workflow used:

- GLMM for subject-specific effects with participant random intercepts
- GEE for population-average effects, which are useful for public health interpretation

Covariates were treated as clinically and confounding-relevant adjustment variables, not selected only by univariate p-values. The core adjustment set included age group, gender, family size, monthly income, household area, and chronic-condition category.

## 7. Model Selection And Diagnostics

The analysis compared random-intercept models with random-intercept-plus-slope models. Random-slope models were not retained when diagnostics showed singular or boundary fits and over-parameterization with only three time points.

The workflow also compared categorical, linear, and quadratic time specifications using AIC. Categorical phase was preferred for interpretability because the phases represented distinct survey periods.

For GEE models, the analysis considered working-correlation structure and used robust standard errors. Phase contrasts were reported as odds ratios with 95 percent confidence intervals.

## 8. Key Findings

The manuscript interpretation was that reported health impacts were highest during the most intense study period and generally declined in later phases.

Key findings included:

- reported impacts declined after the first phase
- respiratory history was strongly associated with breathing-related symptoms
- larger households were associated with higher fatigue odds during the study period
- allergy-related and breathing-related symptoms showed clear repeated-measures patterns

These findings are framed as associations with reported impacts and symptoms, not strict causal effects.

## 9. Public Health Interpretation

The results support targeted adaptation strategies for high-risk chronic-condition patients in resource-limited settings. Practical implications include environmental risk mitigation, patient education, symptom surveillance, and targeted support for patients whose conditions may worsen during acute environmental stressors.

## 10. Limitations

Important limitations include:

- symptoms were self-reported
- objective clinical measures were not collected during interviews to verify symptom reports
- complete-case analysis may introduce selection bias if missingness is not random
- seasonal or period effects may confound phase comparisons
- many outcomes were tested, so some symptom-specific findings should be interpreted as exploratory
- p-values were two-sided and unadjusted
- associations should not be interpreted as strict causal effects

A future analysis cleanup could add a false discovery rate sensitivity table for the larger set of symptom models.

## 11. Reproducibility

The original data are restricted and are not included in this repository. Authorized users can place the required private files at:

```text
data/private/cleaned_study_data.csv
data/private/symptom_severity_scores.csv
```

Then open and run:

```text
analysis/original_research_analysis.Rmd
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

## Publication Context

This analysis contributed to an accepted research publication. My role included R-based data analysis and manuscript drafting support. The writing in this portfolio keeps the technical workflow understandable while avoiding exact manuscript identifiers and restricted study materials.

## Repository Contents

```text
.
|-- .gitignore
|-- analysis/
|   `-- original_research_analysis.Rmd
|-- data/
|   `-- README.md
|-- docs/
|   |-- data_privacy.md
|   `-- methods_summary.md
|-- results/
|   `-- README.md
`-- README.md
```

## Data Note

The repo intentionally excludes participant-level data, original free-text responses, manuscript drafts, review files, and internal collaboration notes. See [docs/data_privacy.md](docs/data_privacy.md) for the release boundary.
