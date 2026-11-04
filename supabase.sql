-- Supabase > SQL Editor'a yapıştırıp çalıştır.

create table if not exists public.events (
  id         bigint generated always as identity primary key,
  day        date    not null,
  title      text    not null,
  time       text    default '',
  cat        text    default 'not',
  created_at timestamptz default now()
);

create index if not exists events_day_idx on public.events (day);

alter table public.events enable row level security;

-- Yönetici kontrolü: sadece bu e-posta ile giriş yapmış kullanıcı
create or replace function public.is_artea_admin()
returns boolean
language sql stable
as $$
  select coalesce(auth.jwt() ->> 'email', '') = 'kursatbulut477@gmail.com'
$$;

-- Herkes okuyabilir
create policy "herkes okuyabilir" on public.events
  for select using (true);

-- Sadece yönetici ekleyebilir, değiştirebilir, silebilir
create policy "yonetici ekler" on public.events
  for insert with check (public.is_artea_admin());

create policy "yonetici gunceller" on public.events
  for update using (public.is_artea_admin()) with check (public.is_artea_admin());

create policy "yonetici siler" on public.events
  for delete using (public.is_artea_admin());
