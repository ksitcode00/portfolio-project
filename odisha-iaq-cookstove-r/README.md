# Household Air Pollution and Improved Cookstove Adoption in Rural Odisha

This project is a public portfolio draft for a submitted environmental-health manuscript on indoor air quality in rural Odisha, India. The analysis evaluates whether households using an Integrated Domestic Energy System (IDES) cookstove had lower household air pollution than households using traditional biomass cookstoves, while accounting for household infrastructure, electricity access, village-program context, and other exposure determinants.

The public GitHub version is intentionally privacy-aware. It summarizes the analytical workflow and selected aggregate findings while excluding raw participant-level data, manuscript files under review, and internal collaboration materials.

## Background

Household air pollution is a major public-health and environmental challenge in rural India, where many households continue to rely on solid biomass fuels and traditional cookstoves. Traditional biomass combustion can generate high levels of particulate matter and carbon monoxide, especially during cooking. Improved cookstove programs aim to reduce these exposures, but real-world indoor air quality depends on more than stove type alone. Adoption, maintenance, stove stacking, kitchen structure, household size, electricity access, ventilation, and other indoor combustion sources can all affect measured pollutant concentrations.

This project analyzes field data from rural Odisha to quantify indoor pollutant differences between IDES and traditional cookstove households and to identify household-level determinants of exposure.

## Setting and Study Design

The study was conducted among rural households in Odisha, India. Indoor air quality was monitored in households using either:

- traditional biomass cookstoves
- Integrated Domestic Energy System cookstoves

Pollutant concentrations were measured over full 24-hour monitoring windows and during observed cooking-period windows. Household surveys captured demographic, socioeconomic, behavioral, and structural characteristics, including electricity access, village/program group, kitchen location, roof material, household size, education, income, and other indoor pollution sources.

The analytic sample compared 105 IDES households with 75 traditional cookstove households.

## Research Questions

1. Are pollutant concentrations lower in IDES households than in traditional cookstove households?
2. Are differences stronger during cooking periods than over full 24-hour monitoring periods?
3. Which household, structural, and programmatic characteristics independently predict indoor pollutant concentrations?
4. Do pollutant exposures help explain relationships between cookstove type and respiratory health outcomes?
5. How robust are the findings under causal-inference sensitivity approaches appropriate for observational data?

## Data Cleaning and Feature Engineering

The original analysis required extensive cleaning and variable management before modeling. Major steps included:

- recoding household survey variables into interpretable categories
- grouping education, income, household size, roof material, kitchen location, and electricity variables
- cleaning invalid, missing, and special survey response codes
- constructing respiratory symptom outcomes for cough, phlegm, breathlessness, and wheezing
- deriving lung-function indicators from FEV1, FVC, and PEF ratios
- separating 24-hour pollutant outcomes from cooking-period pollutant outcomes
- log-transforming right-skewed pollutant concentrations before regression modeling

Pollutants analyzed included PM10, PM2.5, PM1, black carbon, and carbon monoxide.

## Exploratory Data Analysis

EDA was used to understand distributions, group differences, and modeling assumptions before fitting adjusted models. The workflow included:

- demographic and household-characteristic summary tables
- descriptive pollutant tables by cookstove type
- density plots and Q-Q plots before and after log transformation
- boxplots comparing pollutant levels across stove type, electricity access, kitchen location, roof material, household size, and other covariates
- bivariate group-difference testing using t-tests, ANOVA, Welch ANOVA, Mann-Whitney tests, and Kruskal-Wallis tests depending on assumptions

The EDA showed that pollutant outcomes were strongly right-skewed, supporting log-transformed pollutant models and effect-size reporting on the percent-difference scale.

## Result Workbooks and Analysis Outputs

I organized the statistical outputs into two Excel result workbooks that functioned as analysis review files rather than raw datasets.

The first workbook compiled the EDA and bivariate result layer. It included before-vs-after log-transformation plots, lung-function correlation summaries, health-outcome group differences, non-health group differences, raw and log-scale descriptive statistics by household characteristic, and subgroup analyses such as electricity-only households, focus vs regular villages, and income groups among households with electricity.

The second workbook organized the modeling layer. It included univariate logistic-regression output, pollutant-specific models, wheezing/cough/phlegm/breathlessness outcome models, FVC/FEV1/PEF ratio analyses, mediation-analysis tables, lung-disease models, pollutant-to-health pathways, and multivariable model summaries. These workbooks helped me track which variables were important in exploratory screening, which variables entered the multivariable stage, and how final model outputs should be translated into manuscript tables and figures.

## Statistical Modeling

### Model Selection Strategy

The modeling workflow used a two-stage selection strategy.

First, I ran univariate screening models to evaluate associations between outcomes and individual non-health, pollutant, respiratory, and lung-function predictors. For binary health outcomes, I used univariate logistic regression with likelihood-ratio testing. For continuous pollutant outcomes, I used linear models on log-transformed pollutant concentrations and F-tests where appropriate. These screening results were compiled in the result workbooks and used to understand candidate predictors before building multivariable models.

Second, I fit multivariable models using a fixed-plus-backward-selection structure. A core set of a priori variables was forced into the models because they represented the main study design and confounding structure:

- cookstove type
- electricity access
- focus vs regular village-program group
- indoor vs outdoor kitchen location

Additional household and structural predictors, such as education, income, roof material, kitchen ventilation, and household size, were treated as selectable candidate variables. I wrote a custom backward-selection function that kept the fixed variables in every model while removing only selectable terms with weaker evidence. The function used `drop1()` likelihood-ratio or F tests and retained selectable predictors at a liberal `p <= 0.20` threshold, which is commonly used during purposeful model-building to avoid prematurely excluding potential confounders.

### Adjusted Pollutant Models

For pollutant outcomes, I fit adjusted regression models using log-transformed pollutant concentrations as continuous outcomes. The main exposure was cookstove type, comparing IDES households with traditional cookstove households.

Core covariates included:

- cookstove type
- electricity access
- focus vs regular village-program group
- indoor vs outdoor kitchen location
- additional household and structural predictors retained through model screening and refinement

Because pollutant outcomes were modeled on the log scale, coefficients were exponentiated and interpreted as adjusted concentration ratios. I then converted concentration ratios into percent differences to make results easier to communicate.

### Logistic Regression for Health Outcomes

I also fit logistic regression models for respiratory and lung-function outcomes, including wheezing, cough, phlegm, breathlessness, and composite lung-disease indicators. These models evaluated associations between household exposures, pollutant concentrations, cookstove type, and health outcomes.

Model review included checks for multicollinearity, influential observations, residual behavior, and dispersion. Where appropriate, quasibinomial specifications were considered for under- or over-dispersion.

## Mediation Analysis

To explore possible exposure pathways, I implemented mediation analyses estimating whether pollutant concentrations mediated associations between cookstove type and respiratory outcomes.

The mediation workflow estimated:

- ACME: average causal mediation effect, or indirect effect
- ADE: average direct effect
- total effect
- bootstrap confidence intervals

I tested individual pollutant mediators and PCA-based combined pollutant components for both 24-hour and cooking-period exposure windows. This helped evaluate whether reduced pollutant exposure could plausibly explain part of the association between cookstove type and respiratory outcomes.

## Causal-Inference Sensitivity Analysis

Because this was an observational cross-sectional study, causal interpretation requires caution. I implemented causal-inference sensitivity analyses as robustness checks rather than as proof of causality.

The causal-inference workflow included:

- propensity score modeling
- stabilized inverse probability weighting
- covariate balance diagnostics
- survey-weighted outcome models
- effective sample size checks
- E-value sensitivity analysis for unmeasured confounding

These methods helped assess whether the estimated associations were sensitive to measured confounding and how strong unmeasured confounding would need to be to explain away selected associations.

## Key Results

IDES households had consistently lower pollutant concentrations than traditional cookstove households, especially during cooking periods.

In adjusted models, IDES use was associated with:

- 28% lower cooking-period PM10
- 36% lower cooking-period PM2.5
- 38% lower cooking-period PM1
- 43% lower cooking-period black carbon
- 17% lower cooking-period carbon monoxide

For 24-hour averages, reductions were smaller but still meaningful, with approximately 18-20% lower PM10, PM2.5, and PM1 in IDES households.

The analysis also showed that indoor air quality was shaped by more than cookstove type alone. Electricity access, village-program group, kitchen location, household size, and roof material all contributed to pollutant patterns.

## Model Interpretation

The strongest and most consistent finding was that IDES households had lower cooking-period particulate concentrations than traditional cookstove households. This suggests that the improved cookstove system was most strongly associated with reductions during the window when stove emissions are most direct.

The 24-hour reductions were smaller, which is consistent with real-world household air pollution being influenced by background sources, ventilation, stove stacking, and non-cooking household activities outside the cooking window.

Because the study is observational, I interpret the results as adjusted associations supported by sensitivity analyses, not as definitive causal effects. The causal-inference and mediation components are best understood as tools for strengthening interpretation, assessing robustness, and clarifying plausible pathways.

## Tools Used

- R and R Markdown
- `dplyr`, `tidyr`, `stringr`, `purrr`, and `tidyverse`
- `ggplot2` and `cowplot`
- `broom` and `knitr`
- `MASS`, `tableone`, and `logistf`
- `boot` and `mediation`
- `survey`, `cobalt`, and `EValue`

## Skills Demonstrated

- Environmental-health data analysis
- Cleaning complex field-survey data
- Feature engineering for household, exposure, and health variables
- Exploratory data analysis with tables and visual diagnostics
- Log transformation and model-assumption checking
- Interpretable regression modeling
- Logistic regression for health outcomes
- Mediation analysis with bootstrap uncertainty
- Propensity-score and IPW causal-inference sensitivity analysis
- Effect-size communication using percent differences and confidence intervals
- Privacy-aware public presentation of research code and findings

## Repository Contents

```text
.
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

Raw participant-level data, submitted manuscript drafts, internal review documents, and original result workbooks are not included in this public portfolio version. See [docs/data_privacy.md](docs/data_privacy.md) for the release boundary.
