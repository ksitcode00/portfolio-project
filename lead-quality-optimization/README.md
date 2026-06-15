# Marketing Lead Quality Analysis and CPL Optimization

This project analyzes a marketing lead-generation dataset to evaluate lead quality trends, identify high and low performing segments, and assess whether improving lead quality could justify a higher cost per lead.

Completed in 2026.

## Project Overview

The analysis answers three business questions:

1. Whether lead quality changed over time and whether the pattern was statistically meaningful.
2. Which campaign, ad, placement, and lead characteristics were associated with lead quality.
3. Whether the advertiser's proposed CPL increase could be justified by improving lead quality from 8.0 percent to 9.6 percent.

## Business Problem

The advertiser is considering increasing CPL from $30 to $33 if lead quality improves from 8.0 percent to 9.6 percent. The analysis evaluates whether that tradeoff is economically attractive and which operational changes could help improve quality.

## Data Overview

Each row represents one generated lead. The dataset includes lead creation date, call status, ad creative information, publisher placement, partner source, campaign fields, debt level, address score, phone score, and state.

The raw lead-level dataset is not included in this public repository because it contains contact-level fields. The notebook keeps the analysis workflow visible while using a reproducible placeholder path for authorized local reruns.

## Lead Quality Definition

Call status was mapped into three groups. `Good` leads include `Closed`, `EP Sent`, `EP Received`, and `EP Confirmed`. `Bad` leads include unable to contact, invalid profile, and does not qualify. `Unknown` leads are kept separate because they do not clearly indicate good or bad quality.

For the business case, `Closed` is treated as the primary business KPI because it represents the advertiser's final success outcome. The broader `Good` lead rate is used as a secondary funnel-quality metric.

## Analytical Approach

I used Python to clean the data, validate categorical mappings, create grouped variables, summarize lead quality by month and segment, run statistical tests, fit logistic regression models, check model diagnostics, and evaluate CPL economics.

## Key Takeaways

Lead quality declined from April through July 2009, then partially recovered in August and September. Month-to-month differences were statistically significant overall, and the April to July decline was significant when tested directly.

Debt segment was the clearest person-level driver in the adjusted modeling. Ad size and design were useful in exploratory screening, while partner and campaign signals were more directional after adjustment.

Using `Closed` as the primary business KPI, the proposed economics were favorable. Moving from 8.0 percent to 9.6 percent quality while CPL rises from $30 to $33 improves cost per closed lead from $375 to about $344.

## Handling Unknown Outcomes

Many leads did not have a definitive good or bad outcome. I treated those records as `Unknown` rather than forcing them into the model. The trend and regression analyses focus on evaluated leads, so the conclusions are strongest for leads with observed outcomes. Unknown outcomes may not be missing at random, which is an important limitation for interpretation.

## Business Recommendations

- Reduce volume in weak large segments, especially lower-quality brand traffic and weaker partner mixes.
- Expand stronger credit-oriented inventory where there is enough scale.
- Test shifts toward better performing ad sizes and creative formats.
- Tighten qualification for lower-debt segments that show weaker downstream quality.
- Evaluate future changes using closed rate and cost per closed lead as the primary success metrics.

## Portfolio Context

This project is presented as a public portfolio version of an interview-style analytics challenge. Source-specific references, raw lead-level data, and original prompt materials have been removed. The public version focuses on the analytical workflow, modeling decisions, and business interpretation.

## Methods

- Data quality checks and categorical mapping validation
- Lead quality labeling from call status
- Monthly trend analysis with logistic regression and chi-square testing
- Segment-level EDA across campaign, partner, ad, and debt groups
- Univariate and adjusted logistic regression
- Model comparison with BIC and exploratory likelihood-ratio testing
- Scenario analysis for budget reallocation opportunities

## Limitations

- The analysis is observational and should not be interpreted as causal.
- Unknown outcomes are common, so evaluated-lead results may not represent all generated leads.
- Some marketing variables overlap strongly, especially partner and campaign fields.
- Some creative fields have missingness or small evaluated-lead sample sizes.
- Recommendations should be validated through A/B testing or controlled rollout before scaling.

## Skills Demonstrated

Python, pandas, data cleaning, exploratory data analysis, categorical feature engineering, chi-square testing, logistic regression, multiple testing correction, VIF diagnostics, model selection, business KPI analysis, scenario analysis, and executive communication.

## Repository Contents

- `Lead_Quality_Optimization_Portfolio_Project.ipynb`: sanitized public notebook with outputs cleared
- `README.md`: project summary and portfolio notes

## Data Note

The raw lead-level dataset is not included in this public repository because the source file contains contact-level fields. The notebook keeps the analysis logic visible and uses a relative placeholder path:

```python
data/lead_quality_dataset.xls
```

Anyone with authorized access to the dataset can place it at that path and rerun the notebook locally.
