# Lead Quality Optimization

This project analyzes a lead-generation dataset to understand lead quality trends, identify segments associated with stronger outcomes, and evaluate whether operational changes could justify a higher cost per lead.

## Project Highlights

The notebook answers three business questions:

1. Whether lead quality changed over time and whether the pattern was statistically meaningful.
2. Which campaign, ad, placement, and lead characteristics were associated with lead quality.
3. Whether the advertiser's proposed CPL increase could be justified by improving lead quality from 8.0 percent to 9.6 percent.

## Key Takeaways

Lead quality declined from April through July 2009, then partially recovered in August and September. Month-to-month differences were statistically significant overall, and the April to July decline was significant when tested directly.

Debt segment was the clearest person-level driver in the adjusted modeling. Ad size and design were useful in exploratory screening, while partner and campaign signals were more directional after adjustment.

Using `Closed` as the primary business KPI, the proposed economics were favorable. Moving from 8.0 percent to 9.6 percent quality while CPL rises from $30 to $33 improves cost per closed lead from $375 to about $344.

## Portfolio Context

This project is presented as a public portfolio version of an interview-style analytics challenge. Company-specific references, raw lead-level data, and original prompt materials have been removed. The public version focuses on the analytical workflow, modeling decisions, and business interpretation.

## Methods

- Data quality checks and categorical mapping validation
- Lead quality labeling from call status
- Monthly trend analysis with logistic regression and chi-square testing
- Segment-level EDA across campaign, partner, ad, and debt groups
- Univariate and adjusted logistic regression
- Model comparison with BIC and exploratory likelihood-ratio testing
- Scenario analysis for budget reallocation opportunities

## Repository Contents

- `Lead_Quality_Optimization_Portfolio_Project.ipynb`: sanitized public notebook with outputs cleared
- `README.md`: project summary and portfolio notes

## Data Note

The raw lead-level dataset is not included in this public repository because the source file contains contact-level fields. The notebook keeps the analysis logic visible and uses a relative placeholder path:

```python
data/lead_quality_dataset.xls
```

Anyone with authorized access to the dataset can place it at that path and rerun the notebook locally.
