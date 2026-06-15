# Data Privacy and Public-Release Notes

This folder contains a GitHub-ready copy of my original R analysis workflow, but it does not include restricted research data.

## What Is Included

- An adapted copy of the original R Markdown analysis file
- Documentation describing the research question, workflow, and interpretation
- Placeholder paths showing where authorized data should be placed locally

## What Is Withheld

- Participant-level source data
- The cleaned clinic-level CSV used in the restricted analysis environment
- The heat-wave and dust-storm severity-score CSV used in the restricted analysis environment
- Original free-text symptom responses
- Participant-specific manual correction IDs
- Internal manuscript drafts, review files, and correspondence
- Local machine paths from the original working script

## Why The Data Are Withheld

The underlying study involves human-subjects survey data from a vulnerable population. Even after direct identifiers are removed, participant-level clinical, demographic, household, and symptom fields should not be published in a portfolio repository.

The code remains useful because it shows the analytical decisions: cleaning, reshaping, symptom grouping, repeated-measures modeling, diagnostics, and publication-style reporting.

## Public Portfolio Direction

For a recruiter-facing public version, this project should use either code only, a synthetic sample dataset, a properly approved de-identified processed dataset, or final non-sensitive aggregate outputs. Raw participant-level records should not be uploaded unless explicit permission is granted.
