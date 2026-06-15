# Movie Success Modeling with Web Scraped Data

This project is an end-to-end Python data science pipeline for analyzing movie success. I collected movie budget, revenue, rating, Oscar, franchise, and metadata features from multiple online sources, cleaned and matched movie titles across datasets, engineered modeling features, and used statistical models to study audience rating quality and worldwide box-office performance.

The project was originally completed in 2022 as a UC Davis STA 141B final project. I have organized the final notebook and supporting documentation here as a professional portfolio project that highlights data collection, messy-data cleaning, feature engineering, interpretable modeling, diagnostics, and communication.

## Project Scope

This is a post-release explanatory analysis, not a pre-release forecasting model. Some variables used here, such as user rating, Metascore, and worldwide gross, are only available after a movie is released. They are useful for understanding relationships among movie outcomes and features, but they should not be interpreted as features for predicting commercial success before release.

## Research Questions

1. Can movie characteristics help explain audience rating quality?
2. Can production budget, release year, critic score, movie rating, franchise status, and Oscar-related features help explain worldwide box-office gross?
3. Which features appear most useful for understanding movie success?
4. How can multiple messy public web sources be cleaned and merged into one movie-level analytical dataset?

## Executive Summary

Movie success is not explained by one factor alone. The final worldwide-gross model suggests that production budget, stronger user rating, franchise/IP status, critic score, runtime, release year, and movie rating category all help explain variation in log worldwide gross. The model explains about half of the variation in log worldwide gross, with an adjusted R-squared of about `0.512`.

For audience rating quality, the logistic-regression workflow shows that critic score, worldwide gross, runtime, budget, and prior Oscar recognition for the lead actor are meaningful signals in the example model. The project also documents multicollinearity issues among some dummy variables and uses VIF checks and reduced-model diagnostics to make the modeling process more transparent.

## Data Sources

The project combines several public sources:

| Source | Information Used |
| --- | --- |
| The Numbers | Production budget, domestic gross, worldwide gross |
| IMDb-style search pages | Genre, movie rating, user rating, Metascore, duration, director, lead actor, release year |
| Academy Awards database | Prior Oscar-winning actors and directors |
| Business Insider franchise list | Franchise/IP indicator |

## Data Collection Pipeline

The notebook uses `requests`, `requests-cache`, `lxml`, `BeautifulSoup`, regular expressions, and `pandas` to scrape, parse, cache, and structure movie-level data. The pipeline includes page extraction, table parsing, source-specific text formatting, title standardization, and feature construction.

The saved notebook output shows the pipeline moving through these stages:

| Stage | Rows | Purpose |
| --- | ---: | --- |
| Budget/gross table | 5,640 | Movie budget and box-office data from The Numbers |
| IMDb metadata table | 1,659 | Movie-level metadata and rating features |
| Merged analysis table | 1,000 | Matched movies across budget/gross and metadata sources |
| Final modeling table | 933 | Cleaned, encoded, and transformed variables used for modeling |

## Data Cleaning and Entity Matching

A key challenge was matching movie titles across sources. The project standardizes titles by uppercasing text, normalizing punctuation, removing special characters, handling apostrophes, cleaning encoding issues, and manually resolving inconsistent title formats. This step was necessary because movie names and years often differ slightly across The Numbers, IMDb, Oscar data, and franchise lists.

## Feature Engineering

The analysis creates numeric, binary, and categorical modeling features, including:

- Production budget and worldwide gross
- Log-transformed budget, worldwide gross, runtime, and year
- User rating and binary strong-user-rating indicator
- Metascore and binary critic-score indicator
- MPAA-style rating dummy variables
- Director count and single-director indicator
- Prior Oscar-winning lead actor indicator
- Prior Oscar-winning director indicator
- Franchise/IP indicator

## Modeling Approach

The notebook fits two main types of models:

- Logistic regression to model whether a movie receives a strong user rating.
- Linear regression to model log worldwide gross.

It also includes custom helper functions for model reduction, coefficient review, VIF checks, residual diagnostics, QQ plots, leverage analysis, outlier review, and model comparison.

## Key Findings

- The final linear model for `log_gross_wor` reports an adjusted R-squared of about `0.512`, meaning the selected features explain roughly half of the observed variation in log worldwide gross.
- Higher production budget is strongly associated with higher worldwide gross.
- Movies with stronger user ratings are associated with higher worldwide gross after controlling for the other modeled variables.
- Franchise/IP status is positively associated with worldwide gross, which supports the idea that established movie properties tend to have stronger commercial reach.
- Critic score and runtime have smaller but statistically significant positive relationships with worldwide gross in the final model.
- The diagnostic output reports a Durbin-Watson statistic of about `1.871`, which the notebook interprets as no major residual autocorrelation issue.
- Prior Oscar status for the lead actor and director does not clearly explain worldwide gross after controls in the final model.
- The modeling workflow surfaces multicollinearity concerns, especially around rating dummies and some transformed variables, which is an important diagnostic finding rather than something to hide.

See [docs/results_summary.md](docs/results_summary.md) for a fuller interpretation of the saved model outputs.

## Reproducibility Notes

This analysis was originally completed in 2022. Public websites change over time, so some scraping code may require maintenance before being rerun. The repository includes frozen processed CSV files and the final notebook with saved outputs so readers can still review the original analysis, code, and results.

Some original notebook sections note that genre-related code became difficult to rerun because IMDb indexing changed after the original scrape. In a production version, I would separate the project into scripts such as `scrape_numbers.py`, `scrape_imdb.py`, `clean_titles.py`, `build_features.py`, and `modeling.py`, then run the final analysis from frozen processed datasets.

## Future Improvements

If I were rebuilding this project today, I would improve it in five areas:

- Make the notebook run from top to bottom using frozen raw and processed data snapshots.
- Split data collection, cleaning, feature engineering, EDA, and modeling into separate notebooks or Python modules.
- Add a formal train/test split and cross-validation.
- Report predictive metrics such as RMSE or MAE for gross modeling and AUC, accuracy, precision, and recall for user-rating classification.
- Reduce multicollinearity by dropping reference dummy categories, reconsidering `log_year`, centering or standardizing continuous variables, and testing regularized models such as Ridge, Lasso, or penalized logistic regression.

## Repository Structure

```text
.
├── data/
│   ├── movie_budget_gross.csv
│   ├── movie_imdb_features.csv
│   └── movie_merged_sample.csv
├── docs/
│   ├── assignment_context.md
│   ├── data_dictionary.md
│   └── results_summary.md
├── notebooks/
│   └── movie_success_analysis.ipynb
├── README.md
└── requirements.txt
```

## How To Review

For a quick review, start with this README and [docs/results_summary.md](docs/results_summary.md).

For the complete analysis, open:

```bash
notebooks/movie_success_analysis.ipynb
```

The notebook contains saved outputs, so the analysis and visual results can be reviewed without rerunning every scrape.

## How To Run

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
jupyter notebook notebooks/movie_success_analysis.ipynb
```

## Skills Demonstrated

- Python data analysis with `pandas` and `numpy`
- Web scraping with `requests`, `requests-cache`, `BeautifulSoup`, and `lxml`
- Regular expressions and text normalization
- Data cleaning and movie-title entity matching
- Feature engineering and one-hot encoding
- Exploratory visualization with `matplotlib`, `seaborn`, `plotnine`, and `plotly`
- Logistic regression and linear regression
- VIF analysis, residual diagnostics, QQ plots, outlier review, and leverage analysis
- Statistical communication and limitation-aware interpretation
