create table if not exists public.focus_flow_profiles (
  pair_code text not null,
  profile_id text not null check (profile_id in ('me', 'friend')),
  state jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (pair_code, profile_id)
);

alter table public.focus_flow_profiles enable row level security;
grant usage on schema public to anon;
grant select, insert, update on table public.focus_flow_profiles to anon;
create policy "Pair members can read profiles" on public.focus_flow_profiles for select using (true);
create policy "Pair members can add profiles" on public.focus_flow_profiles for insert with check (true);
create policy "Pair members can update profiles" on public.focus_flow_profiles for update using (true) with check (true);
