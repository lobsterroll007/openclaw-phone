# OpenClaw Phone Workspace

This repository tracks the documentation, SOPs, customer assets, and automation plans for the OpenClaw Phone offering.

- **Docs site:** https://lobsterroll007.github.io/openclaw-phone/
- **Source location:** `projects/openclaw-phone/`
- **Stack:** MkDocs + Material theme, auto-deployed via GitHub Actions to the `gh-pages` branch.

## Development
1. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
2. Preview locally:
   ```bash
   mkdocs serve
   ```
3. Deploy (CI automatically deploys on push to `main`):
   ```bash
   mkdocs gh-deploy --force
   ```
