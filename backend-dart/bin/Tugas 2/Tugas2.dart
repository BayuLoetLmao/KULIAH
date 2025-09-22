import 'dart:io';

void main() {
  // Meminta input skor dari pengguna
  print('Masukkan skor ujian (0 - 100):');
  String? input = stdin.readLineSync();
  
  // Menangani jika input null atau tidak valid
  if (input == null || int.tryParse(input) == null) {
    print('Input tidak valid! Pastikan memasukkan angka.');
    return;
  }

  // Mengubah input menjadi tipe integer
  int score = int.parse(input);

  // Validasi skor, memastikan dalam rentang 0 - 100
  if (score < 0 || score > 100) {
    print('Skor tidak valid! Skor harus antara 0 dan 100.');
  } else {
    // Menentukan grade berdasarkan rentang skor
    String grade;
    if (score >= 85) {
      grade = 'A';
    } else if (score >= 70) {
      grade = 'B';
    } else if (score >= 60) {
      grade = 'C';
    } else if (score >= 50) {
      grade = 'D';
    } else {
      grade = 'E';
    }

    // Menampilkan skor dan grade
    print('Skor Anda: $score');
    print('Grade Anda: $grade');
  }
}