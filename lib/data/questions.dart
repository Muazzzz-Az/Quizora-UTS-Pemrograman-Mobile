import '../models/question.dart';

const List<Question> quizQuestions = [
  Question(
    category: 'Flutter',
    prompt: 'Widget Flutter yang tidak menyimpan state internal yang berubah adalah...',
    options: ['StatefulWidget', 'StatelessWidget', 'InheritedWidget', 'StreamBuilder'],
    correctIndex: 1,
    explanation: 'StatelessWidget cocok untuk UI yang bergantung pada konfigurasi dan tidak mengelola state yang berubah sendiri.',
  ),
  Question(
    category: 'Dart',
    prompt: 'Kata kunci untuk membuat variabel yang nilainya ditetapkan sekali adalah...',
    options: ['var', 'dynamic', 'final', 'late var'],
    correctIndex: 2,
    explanation: 'Variabel final hanya dapat diberi nilai satu kali.',
  ),
  Question(
    category: 'Flutter',
    prompt: 'File konfigurasi utama untuk dependensi dan aset Flutter adalah...',
    options: ['main.json', 'pubspec.yaml', 'assets.xml', 'flutter.config'],
    correctIndex: 1,
    explanation: 'pubspec.yaml mendefinisikan dependensi, aset, font, dan metadata proyek.',
  ),
  Question(
    category: 'Dart',
    prompt: 'Manakah koleksi yang menyimpan elemen berurutan dan dapat diakses melalui indeks?',
    options: ['List', 'Set', 'Map', 'Record'],
    correctIndex: 0,
    explanation: 'List menyimpan elemen dalam urutan dan mendukung akses melalui indeks.',
  ),
  Question(
    category: 'Flutter',
    prompt: 'Fungsi setState() digunakan untuk...',
    options: [
      'Menghapus aplikasi',
      'Memberi warna otomatis',
      'Memberi tahu Flutter bahwa state widget berubah',
      'Mengunduh paket'
    ],
    correctIndex: 2,
    explanation: 'setState memberi tahu framework untuk membangun ulang bagian UI yang terdampak.',
  ),
  Question(
    category: 'Git',
    prompt: 'Perintah Git untuk merekam perubahan ke riwayat lokal adalah...',
    options: ['git push', 'git commit', 'git clone', 'git status'],
    correctIndex: 1,
    explanation: 'git commit menyimpan snapshot perubahan ke riwayat repository lokal.',
  ),
  Question(
    category: 'Flutter',
    prompt: 'Paket Flutter yang umum digunakan untuk state management pada proyek ini adalah...',
    options: ['provider', 'cupertino_icons', 'http_parser', 'path_provider_android'],
    correctIndex: 0,
    explanation: 'Provider membantu menyediakan state ke widget dan memberi notifikasi saat state berubah.',
  ),
  Question(
    category: 'Dart',
    prompt: 'Operator yang digunakan untuk mengakses nilai default ketika ekspresi di kiri null adalah...',
    options: ['!!', '??', '=>', '::'],
    correctIndex: 1,
    explanation: 'Operator ?? menghasilkan nilai di sebelah kanan jika ekspresi di sebelah kiri bernilai null.',
  ),
  Question(
    category: 'Flutter',
    prompt: 'Widget yang membantu menyusun elemen secara vertikal adalah...',
    options: ['Row', 'Stack', 'Column', 'Align'],
    correctIndex: 2,
    explanation: 'Column menata child dalam arah vertikal.',
  ),
  Question(
    category: 'Git',
    prompt: 'Perintah untuk melihat status perubahan pada working tree adalah...',
    options: ['git status', 'git init', 'git merge', 'git log --all --delete'],
    correctIndex: 0,
    explanation: 'git status menampilkan perubahan yang belum di-commit dan status staging.',
  ),
];
