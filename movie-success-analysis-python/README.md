# Movie Success Analysis with Python

This project analyzes which observable movie attributes are associated with commercial performance and audience reception. It combines scraped movie budget/gross data, IMDb-style movie metadata, Oscar winner information, and franchise indicators, then uses Python for data cleaning, feature engineering, visualization, and statistical modeling.

The work was originally completed for UC Davis STA 141B and has been organized here as a public portfolio project showcasing Python data analysis skills.

## Project Questions

- Which movie features are associated with higher worldwide gross?
- Which features help distinguish movies with strong user ratings?
- How do budget, runtime, critic score, ratings, Oscar history, director structure, and franchise status relate to movie outcomes?

## What This Demonstrates

- Web scraping with `requests`, `BeautifulSoup`, and `lxml`
- Data cleaning and movie-title standardization
- Dataset merging across heterogeneous sources
- Feature engineering for binary indicators and log-transformed variables
- Exploratory visualization with `seaborn`, `matplotlib`, `plotnine`, and `plotly`
- Regression diagnostics with `statsmodels`
- Logistic regression model reduction and interpretation

## Repository Structure

```text
.
├── data/
│   ├── movie_budget_gross.csv
│   ├── movie_imdb_features.csv
│   └── movie_merged_sample.csv
├── docs/
│   ├── assignment_context.md
│   └── data_dictionary.md
├── notebooks/
│   └── movie_success_analysis.ipynb
├── .gitignore
├── README.md
└── requirements.txt
```

## Data Sources

The notebook builds and combines data from:

- The Numbers movie budget and gross pages
- IMDb movie search pages
- Academy Awards winner database
- Business Insider franchise list

The included CSV files are small derived datasets from the original project workflow. The notebook also preserves scraping and modeling code so reviewers can inspect the full process.

## How To Run

Create a virtual environment and install dependencies:

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

Then open:

```bash
jupyter notebook notebooks/movie_success_analysis.ipynb
```

Some scraping cells may need updates because public websites can change their HTML structure or access rules over time. The notebook includes saved outputs from the original analysis so the workflow and visual results are still reviewable.

## Key Outputs

- Cleaned movie-analysis datasets
- Distribution and relationship plots for user rating and worldwide gross
- Logistic regression workflow for predicting strong user ratings
- Linear regression diagnostics for worldwide gross
- Feature engineering around Oscar history, franchise status, movie rating, director count, and transformed numeric variables

## Notes

This is a cleaned public version of a course project. Earlier drafts, large scrape caches, checkpoint notebooks, and SQLite intermediates were intentionally omitted to keep the repository focused and easy to review.
