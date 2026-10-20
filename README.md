# November 80

Kristian, Peder, Erik, Lars, Jesper, Carl, Harald and Daniel each run 80 km in November 2026. `index.html` is the whole site; runs are stored in Supabase.

## 1. Set up Supabase (5 min)

1. In [supabase.com/dashboard](https://supabase.com/dashboard), create a new project (the free plan is enough).
2. Open **SQL Editor → New query**, paste the contents of `supabase-setup.sql`, and click **Run**.
3. Open **Project Settings → API Keys** and copy:
   - the **Project URL** (`https://xxxx.supabase.co`)
   - the **anon / public** key (under *Legacy API keys*; the new *publishable* key also works)
4. In `index.html`, replace the two placeholder values near the top of the `<script>`:

   ```js
   const SUPABASE_URL = "https://xxxx.supabase.co";
   const SUPABASE_ANON_KEY = "eyJ...";
   ```

   The anon key is meant to be public. Never put the `service_role` / secret key in the page.

## 2. Publish on GitHub Pages

1. Create a new public repository on GitHub, e.g. `november-200`.
2. Upload `index.html` (drag it in under **Add file → Upload files**), or push it:

   ```bash
   git init && git add index.html README.md supabase-setup.sql
   git commit -m "November 200 tracker"
   git branch -M main
   git remote add origin https://github.com/<your-user>/november-200.git
   git push -u origin main
   ```

3. In the repo, go to **Settings → Pages**, set **Source** to *Deploy from a branch*, branch `main`, folder `/ (root)`, and save.
4. After a minute the page is live at `https://<your-user>.github.io/november-200/`. Share that link in the group chat.

## Good to know

- Anyone with the link can add and delete runs, no login. That's fine for a group of friends; just don't post the link publicly.
- The database only accepts the eight names, 0.1–100 km, and dates in November 2026.
- Free Supabase projects pause after a week with no activity. If the page says it can't load runs before November starts, open the project in the dashboard and click **Restore**.
- To check or fix data by hand: **Table Editor → runs** in Supabase.
