# Data Dictionary

## `data/movie_budget_gross.csv`

Derived from The Numbers budget/gross pages.

| Column | Description |
| --- | --- |
| `Movie` | Standardized movie title with release year. |
| `Production Budget` | Estimated production budget in USD. |
| `Domestic Gross` | Domestic box-office gross in USD. |
| `Worldwide Gross` | Worldwide box-office gross in USD. |

## `data/movie_imdb_features.csv`

Derived from IMDb-style movie metadata after cleaning and feature engineering.

| Column | Description |
| --- | --- |
| `Title` | Movie title with release year. |
| `Genre` | Cleaned genre category used for analysis. |
| `Movie Rating` | MPAA-style rating category where available. |
| `User Rating` | Audience/user rating score. |
| `Meta Score` | Critic/metascore value. |
| `Duration in mins` | Runtime in minutes. |
| `Director` | Director name or list of names. |
| `Lead` | Lead actor listed for the movie. |
| `Year` | Release year. |
| `User Rating Good/Bad` | Binary indicator for stronger user rating. |
| `Meta Score Good/Bad` | Binary indicator for stronger critic score. |
| `Director Count 0/1` | Indicator for a single-director movie. |
| `Director Count` | Number of directors. |

## `data/movie_merged_sample.csv`

Merged project dataset containing budget/gross data and movie metadata. It is useful for quickly inspecting the joined analysis table without rerunning the full scrape.
