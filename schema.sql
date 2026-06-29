-- ZaloPay Team Card — Supabase schema
-- Run this in your Supabase project: SQL Editor → New query → paste → Run.

create table if not exists members (
  handle      text primary key,
  passcode    text not null,
  created_at  timestamptz default now()
);

create table if not exists profiles (
  handle      text primary key,
  data        jsonb not null,
  updated_at  timestamptz default now()
);

create table if not exists recognition (
  from_handle text primary key,
  data        jsonb not null,
  updated_at  timestamptz default now()
);

create table if not exists app_config (
  key   text primary key,
  value text
);

-- Row Level Security. This is an INTERNAL team tool, so we allow the public
-- anon key full access. Anyone who can read the page can read/write these
-- tables — fine for a team outing, NOT for sensitive data.
alter table members     enable row level security;
alter table profiles    enable row level security;
alter table recognition enable row level security;
alter table app_config  enable row level security;

create policy "anon members"     on members     for all using (true) with check (true);
create policy "anon profiles"    on profiles    for all using (true) with check (true);
create policy "anon recognition" on recognition for all using (true) with check (true);
create policy "anon app_config"  on app_config  for all using (true) with check (true);
