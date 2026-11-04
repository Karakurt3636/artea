# Artea Takvim: kurulum

Dosyalar: `index.html` (site), `config.js` (Supabase bilgileri), `supabase.sql` (veritabanı + izinler).

## 1. Supabase (ücretsiz)
1. supabase.com > yeni proje aç.
2. **SQL Editor**: `supabase.sql` içeriğini yapıştır. Önce `SENIN_EPOSTAN@ornek.com` yerine kendi e-postanı yaz, sonra Run.
3. **Authentication > Users > Add user**: aynı e-posta + şifre ile kullanıcı oluştur (Auto Confirm işaretli).
4. **Authentication > Sign In / Providers**: "Allow new users to sign up" seçeneğini **kapat**. Böylece kimse kendine hesap açamaz.
5. **Project Settings > API**: `Project URL` ve `anon public` anahtarını `config.js` içine yapıştır.

## 2. Yayınlama (ücretsiz, hangisi kolay geliyorsa)
- **Netlify Drop**: app.netlify.com/drop sayfasına klasörü sürükle-bırak.
- **Cloudflare Pages** veya **GitHub Pages**: klasörü repoya koy, yayınla.
- Kendi alan adını sonradan bağlayabilirsin.

## 3. Kullanım
- Ziyaretçiler siteyi açar, sadece görür.
- Sen sağ üstteki **Yönetici girişi** ile girersin; güne tıklayıp not ekler/silersin.
- `config.js` doldurulmadan açarsan **deneme modu** çalışır (notlar sadece o tarayıcıda durur).

## Güvenlik notu
`anon` anahtarı sayfada görünür, bu normal. Yazma yetkisi anahtarda değil, `supabase.sql` içindeki kurallarda: sadece senin e-postanla giriş yapmış hesap ekleyip silebilir.
