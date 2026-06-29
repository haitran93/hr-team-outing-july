# HR Team Outing — July · setup

A single-file web app (`index.html`). Hosts on GitHub Pages; data lives in a free
Supabase project so profiles + shout-outs persist and sync across everyone.

Until you add Supabase keys it runs on **your browser's local storage only** —
good for a test, but nothing is shared. Two short setups make it real:

---

## A · Database (Supabase — free, ~3 min, no credit card)

1. **supabase.com** → sign in → **New project**. Name it `hr-team-outing-july`,
   set a database password, pick the closest region, create.
2. When it finishes building, open **SQL Editor → New query**. Open `schema.sql`
   from this folder, copy all of it, paste, click **Run**. You should see "Success".
3. Open **Project Settings → API** and copy:
   - **Project URL** — e.g. `https://abcdxyz.supabase.co`
   - **anon / public** key — the long string under "Project API keys"
4. Open `index.html`, find the CONFIG block near the top of the `<script>`:
   ```js
   const SUPABASE_URL = "";       // paste Project URL here
   const SUPABASE_ANON_KEY = "";  // paste anon key here
   ```
   Paste both between the quotes, save the file.

## B · Hosting (GitHub Pages — free, ~3 min)

1. **github.com** → **New repository** → name it `hr-team-outing-july` →
   Public → **Create repository**.
2. On the repo page → **Add file → Upload files**. Drag in `index.html`
   (the one with your keys), plus `schema.sql` and `SETUP.md` if you like.
   Commit.
3. **Settings → Pages** → under "Build and deployment", Source = **Deploy from a
   branch**, Branch = **main** / **/(root)** → **Save**.
4. Wait ~1 min, refresh. Your live URL appears at the top:
   `https://<your-username>.github.io/hr-team-outing-july/`

## C · Hand out passcodes

1. Open your live URL → **I'm the organizer** (bottom of the sign-in card).
2. Set an organizer passcode (first time only — light gate, not real security).
3. **Passcodes** tab → **Generate codes for everyone missing one** →
   **Export passcodes CSV**.
4. Privately send each teammate their handle + 6-digit code. They sign in with
   those; their card and shout-outs save and reload next visit.

---

## Editing the team
- Roster, accent colors, and interest options are arrays at the top of the
  `<script>` in `index.html` (`ROSTER`, `ACCENTS`, `INTERESTS`).

## Good to know
- Security is intentionally light: the anon key is visible in page source and a
  6-digit code is guessable. Fine for an internal outing — don't store anything
  sensitive.
- **Clear submissions** (organizer toolbar) wipes cards + recognition but keeps
  passcodes.
- To re-deploy after an edit, just upload the changed `index.html` again — Pages
  redeploys automatically.
