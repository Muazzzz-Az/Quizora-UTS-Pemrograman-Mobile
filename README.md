# Quizora — Aplikasi Kuis Pilihan Ganda

Aplikasi Flutter untuk UTS Pemrograman Mobile. Alur aplikasi: **Splash Screen → Biodata → Home → Quiz → Result**. Pertanyaan disimpan secara lokal; tidak menggunakan database.

## 1. Identitas Mahasiswa — wajib dilengkapi

- **Nama:** [ISI NAMA LENGKAP]
- **NIM:** [ISI NIM]
- **Lab:** [ISI PM 1 ATAU PM 3]

## 2. Informasi Aplikasi

- **Nama aplikasi:** Quizora
- **Deskripsi:** Aplikasi kuis pilihan ganda dengan profil peserta, progres pertanyaan, perhitungan skor, dan ulasan jawaban.
- **Fitur:**
  - Splash screen pembuka.
  - Form biodata: nama wajib, NIM dan program studi opsional.
  - Home dengan sapaan personal dan tombol mulai kuis.
  - 10 pertanyaan pilihan ganda tentang Flutter, Dart, dan Git.
  - Navigasi soal sebelumnya/berikutnya dan indikator progres.
  - Validasi agar soal harus dijawab sebelum lanjut.
  - Hasil berupa skor, jumlah benar/salah, serta review dan pembahasan.
  - State kuis dikelola dengan Provider selama sesi berlangsung.
  - Tema terang dan gelap.
  - Layout responsif dengan batas lebar konten untuk layar lebih lebar.

## 3. Teknologi

- Flutter dan Dart
- Provider (`ChangeNotifier`) untuk state management
- Material 3
- Custom font Lato

## 4. Cara Menjalankan

Buka folder proyek ini di VS Code. Jika folder belum memiliki konfigurasi platform Android/Web, jalankan sekali:

```powershell
flutter create .
flutter pub get
flutter run
```

Untuk menjalankan pada perangkat Android yang sudah terdeteksi, gunakan `flutter devices` untuk melihat ID perangkat, lalu `flutter run -d ID_PERANGKAT`.

## 5. Dokumentasi Screenshot — wajib dilengkapi dengan screenshot asli

Simpan screenshot dari aplikasi yang benar-benar berjalan ke `docs/screenshots/`, lalu centang dan pastikan file tersedia sebelum push ke GitHub.

- [ ] Splash Screen — `docs/screenshots/splash.png`
- [ ] Biodata — `docs/screenshots/biodata.png`
- [ ] Home — `docs/screenshots/home.png`
- [ ] Quiz — `docs/screenshots/quiz.png`
- [ ] Result — `docs/screenshots/result.png`

## 6. Mockup / Prototype — wajib diisi

Link Figma atau prototype: **[TEMPELKAN LINK MOCKUP/PROTOTYPE]**

## 7. Video Presentasi — wajib diisi

Link video Google Drive (durasi maksimal 10 menit): **[TEMPELKAN LINK VIDEO]**

Pastikan izin akses Google Drive memungkinkan dosen/asisten membuka video.

## 8. Kredit Aset

- **Font Lato:** font kustom yang disertakan di `assets/fonts/`. Cantumkan sumber unduhan resmi dan lisensi font yang digunakan saat finalisasi repository.
- **Ikon:** Material Icons yang disediakan oleh Flutter SDK.
- **Gambar eksternal:** tidak ada gambar eksternal yang digunakan dalam versi ini.

## 9. Catatan State Management

Jawaban dan indeks soal disimpan dalam `QuizProvider`, sehingga tetap tersedia saat berpindah halaman dan saat widget dibangun ulang selama sesi aplikasi masih berjalan. Uji rotasi perangkat sebelum pengumpulan untuk memastikan progres benar-benar tidak hilang pada perangkat target.

## 10. GitHub dan Pengumpulan

Repository harus berada di akun GitHub mahasiswa sendiri. Lakukan commit bertahap setiap fitur selesai; jangan hanya mengunggah seluruh proyek sekali di akhir. Setelah README, screenshot, mockup, dan tautan video dilengkapi, push perubahan terakhir dan kumpulkan **link repository GitHub** melalui Google Classroom sebelum deadline.
