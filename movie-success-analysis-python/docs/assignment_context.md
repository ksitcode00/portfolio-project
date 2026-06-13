# Assignment Context

This project was created for STA 141B as an end-to-end Python data analysis project. The assignment emphasized building a dataset programmatically, cleaning and combining multiple sources, visualizing patterns, and applying statistical modeling to answer a substantive question.

## Project Framing

The analysis asks how movie characteristics relate to two outcomes:

- Audience reception, represented by user rating and a binary "good user score" indicator.
- Commercial performance, represented by worldwide gross revenue.

## Workflow Summary

1. Scrape movie budget and gross data from The Numbers.
2. Scrape movie metadata from IMDb search pages.
3. Standardize movie titles and merge records across sources.
4. Add external context, including prior Oscar winners and franchise/IP status.
5. Clean categorical fields and engineer modeling variables.
6. Create visual summaries for numeric and binary predictors.
7. Fit and diagnose logistic and linear regression models.

## Public Portfolio Adjustments

The original folder contained intermediate notebooks, local caches, SQLite files, and exploratory drafts. This public version keeps the final notebook and compact derived CSV files, then adds documentation so the project is easier to understand from GitHub.

Some notebook cells note that they are not fully rerunnable because they depended on changing website output or on index positions from the original scrape. Those notes are preserved because they accurately document the reproducibility limitations and decisions in the original analysis.
