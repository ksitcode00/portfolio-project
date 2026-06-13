# Data Privacy and Public-Release Notes

This folder is a public portfolio version of an accepted research project. It does not include the original survey dataset, the cleaned clinic-level data, respondent identifiers, free-text responses, manuscript drafts, review files, or local research-team notes.

The included CSV is synthetic. It was generated to preserve the analytical structure of the original project:

- repeated observations for the same participants across three survey phases
- heat-wave and dust-storm exposure indicators
- demographic and living-condition covariates
- NCD history indicators
- binary symptom outcomes and an ordinal symptom-severity score

The synthetic data should not be used for epidemiologic inference. Its purpose is to make the R workflow reviewable by recruiters, collaborators, and technical readers without disclosing restricted human-subjects data.

## What Is Public

- Reproducible R code for data generation, cleaning, summaries, GEE modeling, GLMM model comparison, and visualization
- Aggregate example outputs generated from synthetic data
- A project summary describing the research question, methods, and portfolio skills

## What Is Withheld

- Participant-level source data
- Original free-text symptom responses
- Internal manuscript files and reviewer correspondence
- Local file paths and collaboration notes
- Any direct copy of protected or restricted study material
