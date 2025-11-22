describe('HMS Antigravity - UI Demo', () => {
    it('Dashboard üzerinden Randevu Alma Senaryosu', () => {
        // 1. Adım: Dashboard'a git (public/index.html)
        cy.visit('/');

        // Yüklenmesini bekle (Form elemanlarını kontrol et)
        cy.get('#bookingForm').should('be.visible');

        // 2. Adım: Formu Doldur (Gerçek kullanıcı simülasyonu)
        // Doktor ID'sini temizle ve yaz
        cy.get('#doctor_id').clear().type('1');

        // Hasta ID'sini temizle ve yaz
        cy.get('#patient_id').clear().type('1');

        // Tarih seç (Gelecek bir tarih oluşturuyoruz)
        const tomorrow = new Date();
        tomorrow.setDate(tomorrow.getDate() + 2); // 2 gün sonrası
        // DateTime formatı: YYYY-MM-DDTHH:MM
        const dateString = tomorrow.toISOString().slice(0, 16);

        cy.get('#appointment_time').then($input => {
            $input.val(dateString); // datetime-local input'una değer ata
        });

        // 3. Adım: Butona Tıkla
        cy.get('#submitBtn').click();

        // 4. Adım: Görsel Doğrulama (Assert)
        // Yeşil alert kutusunun çıktığını ve içinde başarı mesajı olduğunu kontrol et
        cy.get('#alert-area')
            .should('be.visible')
            .and('contain', 'Randevu başarıyla oluşturuldu');

        // Log alanına işlemin düştüğünü kontrol et
        cy.get('#logs').should('contain', 'SUCCESS');
    });
});