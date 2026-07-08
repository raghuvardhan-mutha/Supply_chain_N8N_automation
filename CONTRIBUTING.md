# Contributing

This is a personal portfolio project built to demonstrate an end-to-end supply chain analytics pipeline (n8n → Supabase → Quadratic). It isn't actively seeking external contributors, but suggestions and questions are welcome.

## Reporting Issues

If you spot a bug, a data inconsistency, or a broken link in the docs, please open a [GitHub Issue](../../issues) with:

- What you expected vs. what happened
- Steps to reproduce (if applicable)
- Which file/query/dashboard is affected

## Suggesting Improvements

Ideas for additional KPIs, dashboard views, or pipeline enhancements are welcome as Issues — see [`docs/09_Future_Enhancements.md`](docs/09_Future_Enhancements.md) for the current roadmap before suggesting something already planned.

## Pull Requests

If you'd like to submit a fix (e.g. a SQL correction or a documentation typo):

1. Fork the repo and create a branch from `main`.
2. Keep changes focused — one fix or feature per PR.
3. If you change the schema in [`sql/01_create_tables.sql`](sql/01_create_tables.sql), update [`docs/04_Data_Dictionary.md`](docs/04_Data_Dictionary.md) and [`workflow.json`](workflow.json) to match.
4. Open a PR describing the change and why.

## Local Setup

See [`docs/setup`](docs/setup) for step-by-step guides to reproduce the n8n, Supabase, and Gmail OAuth setup locally.

## Code of Conduct

Be respectful and constructive. This is a learning project, and questions are always welcome.
