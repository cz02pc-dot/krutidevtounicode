# KrutiDev to Unicode Blog

A static multi-page blog site focused on Kruti Dev, Unicode conversion, Hindi typography, and typing workflows.

## Included

- `index.html` home page
- 12 long-form blog pages (1500+ words each)
- Topic-specific featured images in `images/`
- Shared styles in `style.css`
- Shared JS in `script.js`

## Publish on GitHub Pages

### Option A (No Git installed)

1. Create a new **public** repository on GitHub (for example: `krutidev-unicode-blog`).
2. In the new repo, click **Add file > Upload files**.
3. Upload all files/folders from this project (including `.github/workflows/deploy-pages.yml`).
4. Commit to the `main` branch.
5. Open **Actions** tab and wait for workflow **Deploy Static Site to GitHub Pages** to finish.
6. Your site will be live at:
   - `https://<your-username>.github.io/<repo-name>/`

### Option B (Using Git CLI)

```bash
git init
git add .
git commit -m "Initial website"
git branch -M main
git remote add origin https://github.com/<your-username>/<repo-name>.git
git push -u origin main
```

Then wait for the Pages workflow to deploy.

## Notes

- If you change article content/images, commit and push again to redeploy.
- If updates are not visible, hard refresh the browser (`Ctrl+F5`).
