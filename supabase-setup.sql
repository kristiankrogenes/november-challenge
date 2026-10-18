-- November 200: run the whole file once in Supabase → SQL Editor → New query → Run.

create table if not exists public.runs (
  id         uuid primary key default gen_random_uuid(),
  runner     text not null check (runner in ('Kristian', 'Peder', 'Erik', 'Lars', 'Jesper')),
  km         numeric(5, 2) not null check (km > 0 and km <= 100),
  date       date not null check (date between '2026-11-01' and '2026-11-30'),
  note       text check (char_length(note) <= 80),
  created_at timestamptz not null default now()
);

-- Anyone with the page link can read, add and delete runs (no login).
alter table public.runs enable row level security;

drop policy if exists "read runs"   on public.runs;
drop policy if exists "add runs"    on public.runs;
drop policy if exists "delete runs" on public.runs;

create policy "read runs"   on public.runs for select to anon using (true);
create policy "add runs"    on public.runs for insert to anon with check (true);
create policy "delete runs" on public.runs for delete to anon using (true);

grant select, insert, delete on public.runs to anon;

-- Live updates on the page when someone else logs a run.
do $$
begin
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime' and schemaname = 'public' and tablename = 'runs'
  ) then
    alter publication supabase_realtime add table public.runs;
  end if;
end $$;
