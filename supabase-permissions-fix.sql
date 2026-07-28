-- Run this once in Supabase SQL Editor.
-- It allows this browser-only app to read and write the shared tracker table.
grant usage on schema public to anon;
grant select, insert, update on table public.focus_flow_profiles to anon;

-- Refresh Supabase's API schema cache.
notify pgrst, 'reload schema';
