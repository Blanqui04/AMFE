# i18n (Internationalization)

This folder contains translation files for all supported languages in the AMFE-S-Manager project.

- `ca/LC_MESSAGES/` — Catalan (default)
- `en/LC_MESSAGES/` — English
- `pl/LC_MESSAGES/` — Polish

Translation files are managed using Babel and follow the standard gettext structure:
- `.po` files: Editable translation files
- `.mo` files: Compiled binary files used by the application

## Workflow
1. Extract messages: `pybabel extract -o messages.pot ..`
2. Initialize new language: `pybabel init -i messages.pot -d . -l <lang>`
3. Update translations: `pybabel update -i messages.pot -d .`
4. Compile: `pybabel compile -d .`
