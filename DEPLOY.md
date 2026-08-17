# Getting your site onto GitHub (and live)

You do Step 1. I'll drive Steps 2 and 3 in your browser, and hand you the exact DNS records for your domain.

## Step 1 — Push the code (GitHub Desktop)

1. Install **GitHub Desktop** from https://desktop.github.com and sign in. (If you don't have a GitHub account yet, make a free one at https://github.com first.)
2. In GitHub Desktop: **File → Add Local Repository** and choose this folder (`mirandaessig-site`).
   - If it says the folder isn't a git repository, click **"create a repository"** and then **Create Repository**.
3. Bottom-left, type a summary like `first version` and click **Commit to main**.
4. Click **Publish repository** (top bar). Name it `mirandaessig-site`. Public or private is fine. Click **Publish**.

That creates the repo on GitHub and uploads everything. Your `node_modules` folder is skipped automatically.

*(Optional first: double-click `build-check.bat` to confirm the production build is clean before pushing.)*

## Step 2 — Turn the website on (I'll do this in your browser)

- GitHub builds the site automatically after the push.
- **Settings → Pages → Source: Deploy from a branch → `gh-pages` / `root`.**

## Step 3 — Your domain (I'll set it, you add the DNS)

- **Settings → Pages → Custom domain → `mirandaessig.com`.**
- At your domain registrar, add:
  - `A` record, host `@` → `185.199.108.153`
  - `A` record, host `@` → `185.199.109.153`
  - `A` record, host `@` → `185.199.110.153`
  - `A` record, host `@` → `185.199.111.153`
  - `CNAME` record, host `www` → `YOUR-USERNAME.github.io`
- Then tick **Enforce HTTPS** once it verifies (can take a bit).

## From now on

To update the site: edit files, then in GitHub Desktop hit **Commit**, then **Push**. It rebuilds itself.
