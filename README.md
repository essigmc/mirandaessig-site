# mirandaessig.com

Personal site + food-service industry knowledge hub, built with [Astro](https://astro.build) and
hosted on GitHub Pages. Two environments: **production** (the live site) and a **lower environment**
(an automatic preview of every pull request).

## Run it locally

```bash
npm install     # first time only
npm run dev     # http://localhost:4321
npm run build   # production build into ./dist
```

Requires Node 20+.

> After your first `npm install`, commit the generated `package-lock.json`. Then we can switch the workflows from `npm install` to the faster, fully-reproducible `npm ci`.

## Structure

```
src/
  layouts/Base.astro        Shared shell: <head>, nav, footer, SEO tags
  pages/                    Each file = a page/route
    index.astro             Home
    work-with-me.astro      Consulting
    industry/index.astro    The Industry Hub (reads the "directory" collection)
    writing/                Blog index + [...slug] post template
    about, reading, longevity-pillars, long-strongs, 404
  content/
    config.ts               Schemas for the two collections
    writing/*.md            Blog posts
    directory/*.json        Industry hub entries (software / physical-tool / sop / player)
public/                     Static files served as-is (CNAME, robots.txt, images, /long-strongs/)
```

To add a blog post: drop a `.md` file in `src/content/writing/`.
To add an industry-hub entry: drop a `.json` file in `src/content/directory/`.

## The two environments

- **Production** — `.github/workflows/deploy.yml` runs on every push to `main`, builds the site, and
  publishes it to the `gh-pages` branch, which GitHub Pages serves at **https://mirandaessig.com**.
- **Lower environment (PR previews)** — `.github/workflows/preview.yml` runs on every pull request,
  builds a copy at the sub-path `/pr-preview/pr-N/`, and posts the preview link on the PR. Merge the
  PR and production updates automatically. Close it and the preview is torn down.

This means nothing reaches the live site without going through a preview you can look at first.

> Note: production uses `keep_files: true` so it doesn't wipe open previews. If a deleted page ever
> lingers in production, run the **Deploy to production** workflow manually after a clean build.

## One-time GitHub setup

1. Create a repo (e.g. `mirandaessig-site`) and push this folder to it.
2. **Settings → Pages** → Source: **Deploy from a branch** → Branch: `gh-pages` / `root`.
3. **Settings → Pages → Custom domain** → `mirandaessig.com`. Add DNS at your registrar:
   four `A` records for the apex pointing to `185.199.108.153`, `185.199.109.153`,
   `185.199.110.153`, `185.199.111.153`, and a `CNAME` for `www` → `<username>.github.io`.
   (The `public/CNAME` file keeps the domain attached on every deploy.)
4. Enable **Enforce HTTPS** once the domain verifies.
5. **Settings → Branches** → protect `main`: require a pull request before merging.

## Coming next

- Import the **Reading** notes from Notion.
- Rebuild **Longevity Pillars** as a visual from Notion.
- Import the **Airtable** food-automation database into the Industry Hub.
