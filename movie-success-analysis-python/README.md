# Movie Success Analysis with Python

This project investigates what makes a movie successful from two angles: audience reception and box-office performance. Starting from raw web data, the analysis builds a movie-level dataset, cleans and standardizes titles across sources, engineers modeling features, visualizes relationships, and fits statistical models for user ratings and worldwide gross revenue.

This was originally completed as a UC Davis STA 141B final project and has been organized here as a professional portfolio project. The final notebook includes the data collection code, cleaning process, visual analysis, model diagnostics, and saved outputs.

## Questions Answered

1. What movie attributes are associated with stronger audience ratings?
2. What factors are associated with higher worldwide box-office gross?
3. Do budget, critic score, runtime, rating category, franchise status, Oscar history, and director structure help explain movie outcomes?
4. How can data from multiple public web sources be cleaned and merged into a usable analysis dataset?

## Short Answer

The analysis suggests that movie success is not explained by one variable alone. In the final worldwide-gross model, budget, strong user rating, franchise/IP status, critic score, runtime, release year, and rating category all show statistically meaningful relationships with log worldwide gross. The model explains about half of the variation in log worldwide gross, with an adjusted R-squared of about `0.512`.

For audience reception, the logistic-regression workflow finds critic score, worldwide gross, runtime, budget, and Oscar history for the lead actor to be meaningful predictors in the example model. The notebook also documents multicollinearity issues among rating-category dummy variables and uses reduced-model checks to make the modeling process more interpretable.

## Dataset Built

The notebook combines several public sources:

- The Numbers: production budget, domestic gross, and worldwide gross
- IMDb-style search pages: genre, MPAA rating, user rating, metascore, runtime, director, lead actor, and release year
- Academy Awards database: prior Oscar-winning actors and directors
- Business Insider franchise list: franchise/IP indicator

The saved notebook output shows the analysis pipeline moving through:

| Stage | Rows | Purpose |
| --- | ---: | --- |
| Budget/gross table | 5,640 | Movie budget and box-office data from The Numbers |
| IMDb metadata table | 1,659 | Movie-level metadata and rating features |
| Merged analysis table | 1,000 | Matched movies across budget/gross and metadata sources |
| Final modeling table | 933 | Cleaned, encoded, and transformed variables used for modeling |

## Methods

The project uses Python for the full analysis workflow:

- Web scraping and parsing with `requests`, `requests-cache`, `BeautifulSoup`, and `lxml`
- Data cleaning and title standardization with `pandas`, `numpy`, and regular expressions
- Feature engineering for log transforms, binary indicators, rating dummies, franchise status, Oscar history, and director count
- Exploratory visualization with `matplotlib`, `seaborn`, `plotnine`, and `plotly`
- Logistic regression for classifying stronger user ratings
- Linear regression for modeling log worldwide gross
- Regression diagnostics, VIF checks, outlier review, residual plots, QQ plots, and leverage plots with `statsmodels` and `scipy`

## Key Results

- The final linear model for `log_gross_wor` reports an adjusted R-squared of about `0.512`, meaning the selected features explain roughly half of the observed variation in log worldwide gross.
- Higher production budget is strongly associated with higher worldwide gross in the final model.
- Movies with stronger user ratings are associated with higher worldwide gross after controlling for the other modeled variables.
- Franchise/IP status is positively associated with worldwide gross, supporting the idea that established movie properties tend to have stronger commercial reach.
- Critic score and runtime have smaller but statistically significant positive relationships with worldwide gross in the final model.
- The diagnostic output reports a Durbin-Watson statistic of about `1.871`, which the notebook interprets as no major residual autocorrelation issue.
- Some Oscar-history variables are not significant in the final worldwide-gross model, which is useful evidence that prestige signals do not automatically translate into box-office performance after other factors are considered.
- The notebook flags reproducibility limitations for genre-related columns because website updates changed index-dependent genre handling. Those limitations are documented rather than hidden.

See [docs/results_summary.md](docs/results_summary.md) for a more detailed interpretation of the model outputs.

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

The notebook contains saved outputs, so the analysis and visual results can be reviewed without rerunning every scrape. Some collection cells may require updates if public websites have changed their HTML structure or access behavior since the original project.

## How To Run

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
jupyter notebook notebooks/movie_success_analysis.ipynb
```

## Portfolio Skills Demonstrated

- Building a dataset from public web sources
- Cleaning messy real-world text fields and movie titles
- Joining data from multiple sources with inconsistent naming
- Engineering interpretable modeling features
- Explaining model assumptions, diagnostics, and limitations
- Communicating statistical findings for a non-technical reader

## Notes

This public version intentionally keeps the final notebook and compact derived CSV files while excluding earlier drafts, local caches, checkpoint notebooks, and SQLite intermediates. The goal is to make the project easy for recruiters, hiring managers, and collaborators to understand quickly while preserving the full analytical workflow.
