# Changelog

## Version 1.1.0

### Changed
- Reorganized repo into `data/`, `sql/`, `dashboards/`, `docs/`, `docs/setup/`, `images/`, `reference/`
- Standardized the `on_time_in_full` column name across the schema, SQL, and n8n workflow (previously `on time in full` with spaces in some places)
- Rewrote `README.md` as a concise landing page linking out to `docs/`
- Added numbered, sequential SQL scripts (`01_create_tables.sql` → `05_views.sql`)
- Added step-by-step setup guides for n8n, Supabase, and Gmail OAuth (`docs/setup/`)
- Grounded `07_Business_Insights.md` and `08_Recommendations.md` in actual dashboard figures instead of generic placeholders
- Sanitized `workflow.json` (removed personal credential IDs and instance ID before publishing)
- Cropped dashboard/table screenshots to remove personal email, project URLs, and browser/taskbar chrome

### Added
- `CONTRIBUTING.md` content
- `docs/setup/` guides for local n8n, Supabase, and Gmail OAuth setup
- Table screenshot cross-references in the data dictionary

## Version 1.0.0

### Added
- End-to-end n8n workflow
- Gmail automation
- Supabase PostgreSQL database
- Quadratic dashboard
- KPI calculations
- Business documentation
- SQL scripts
- GitHub project structure

Project released as Version 1.0.
