🚀 HMS Antigravity: AI Destekli Hastane Randevu Sistemi

Bu proje, Google'ın Antigravity (Agentic IDE) ortamı kullanılarak, geleneksel yazılım geliştirme "sürtünmelerini" (manual coding, boilerplate) ortadan kaldırma felsefesiyle inşa edilmiştir. Proje, YZM301 Yazılım Gerçekleme ve Test dersindeki modern AI-Native pratiklerinin uygulamasını temsil eder.

🛠️ Teknoloji Stack (AI-Native)

Teknoloji

Kullanım

Geliştirme Metodu

Vibe Coding ile AI Ajanları (Agentic Development)

Backend (API)

Ruby on Rails 8 (API-only)

Veri Kontrolü

PostgreSQL

Frontend (Mock)

Single-File HTML / Vanilla JS / Tailwind CSS (Sürtünmesiz UI)

E2E Test

Cypress (UI ve API doğrulaması)

Seslendirme

ElevenLabs API (Demo video anlatımı)

Context

llms.txt (AI ajanları için Knowledge Base)

✨ Proje Özellikleri ve Başarı Kanıtları

Sıfır Sürtünme: Modeller ve endpoint'ler manuel yazılmamış, AI ajanlarına Context Engineering ile ürettirilmiştir.

Tam Otomasyon: Test süreçleri otomatikleştirilmiş, Postman scriptleri AI tarafından üretilmiştir.

Görsel Kanıt: Cypress ile UI etkileşimlerinin otomatik video kaydı alınmıştır.

Sınav Uyumu: TDD/BDD yaklaşımı benimsenmiş; BDD, iş gereksinimlerinin tanımlanmasında kullanılmıştır.

🎯 Test Kapsamı (Randevu Modülü)

Bu MVP (Minimum Viable Product), Randevu Oluşturma (POST /api/v1/appointments) iş akışına odaklanmıştır.

Senaryo

Durum

Açıklama

✅ 1

Başarılı

Yeni randevu oluşturma ve 201 dönme.

❌ 2

Çakışma

Aynı doktorun aynı saate ikinci kez randevu vermesini engelleme (422).

✅ 3

UI

Dashboard üzerinden form doldurma ve Yeşil Uyarı ile doğrulama.

🔑 Versiyonlama Stratejisi (SemVer)

Bu proje, Semantic Versioning (SemVer) standardına uyar: MAJOR.MINOR.PATCH.

MAJOR: Sadece API Kontratında Geriye Dönük Uyumsuzluk (Breaking Change) olduğunda artırılır (örn: Bir endpoint'in tamamen kaldırılması).

MINOR: Geriye dönük uyumlu yeni özellikler eklendiğinde artırılır (örn: Yeni bir endpoint eklenmesi).

PATCH: Geriye dönük uyumlu hata düzeltmeleri (Bug Fix) için artırılır.

🚀 Kurulum ve Çalıştırma

Gereksinimler: Ruby 3.2+, Rails 8+, PostgreSQL, Node.js (v16+).

Adımlar:

Repo Klonlama:

git clone [https://github.com/memirkincal/HSM-Antigravity.git](https://github.com/memirkincal/HSM-Antigravity.git)
cd HSM-Antigravity


Backend Kurulumu:

bundle install
rails db:create
rails db:migrate
rails db:seed  # Test verilerini yükler (Dr. House, Jane Doe)
rails s       # Rails server'ı başlat (http://localhost:3000)


Frontend ve Test Ortamını Hazırlama:

npm install
# http://localhost:3000 adresine giderek Dashboard'u görebilirsiniz.


Otomatik E2E Testi ve Video Kaydı:

# Testleri koşar ve cypress/videos altına video kaydı bırakır.
npx cypress run --browser chrome
