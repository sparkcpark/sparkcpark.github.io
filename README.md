# Christine Park — personal website

A Quarto website for an about page, publications, and a blog, ready to deploy to GitHub Pages.

## 1. Preview locally

Install [Quarto](https://quarto.org/docs/get-started/), then run:

```bash
quarto preview
```

## 2. Personalize it

Search the project for `YOUR_`, `[your`, and `[Your` placeholders. At minimum:

- Update the biography and research summary in `index.qmd` and `about.qmd`.
- Replace the example in `publications.bib` with real BibTeX entries.
- Add `assets/christine-park-cv.pdf`, or remove the CV link.
- Replace the GitHub, LinkedIn, and email links in `_quarto.yml`.
- Add a real photo if desired; the `CP` monogram works as a deliberate fallback.

## 3. Publish with GitHub Pages

1. Create a new GitHub repository and push this directory to its `main` branch.
2. In the repository, open **Settings → Pages**.
3. Under **Build and deployment**, choose **GitHub Actions** as the source.
4. Push a commit. The included workflow renders and publishes the site.
5. Replace `website.site-url` in `_quarto.yml` with the URL GitHub gives you.

## 4. Connect a custom domain

Once you own the domain:

1. In **Settings → Pages → Custom domain**, enter the domain.
2. Follow GitHub's displayed DNS instructions at your registrar.
3. Enable **Enforce HTTPS** once the certificate is ready.
4. Update `website.site-url` in `_quarto.yml`.

With this GitHub Actions workflow, configure the domain in the repository settings; a `CNAME` file is not required.

## 5. Enable Umami analytics

1. Create a free Umami Cloud account and add the deployed website.
2. Copy `includes/umami.html.example` to `includes/umami.html`.
3. Replace `REPLACE_WITH_UMAMI_WEBSITE_ID` with the ID Umami provides.
4. Add this line under `format: html:` in `_quarto.yml`:

```yaml
include-in-header: includes/umami.html
```

The tracking snippet is intentionally inactive in the starter.
