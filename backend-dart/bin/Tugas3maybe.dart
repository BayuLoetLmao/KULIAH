import 'dart:io';

void main() {
  final Map<int, String> mahasiswa = {};

  print('=== Input 10 Nama Mahasiswa ===');
  int i = 0;
  while (i < 10) {
    stdout.write('Masukkan nama mahasiswa ke-${i + 1}: ');
    final input = stdin.readLineSync()?.trim();
    if (input == null || input.isEmpty) {
      print('Nama tidak boleh kosong. Coba lagi.');
      continue;
    }
    mahasiswa[i] = input;
    i++;
  }

  print('\nData tersimpan (index -> nama):');
  mahasiswa.forEach((idx, nama) => print('[$idx] $nama'));

  print('\n=== Pencarian Nama (ketik q untuk keluar) ===');
  while (true) {
    stdout.write('Cari nama: ');
    final query = stdin.readLineSync()?.trim();
    if (query == null || query.isEmpty) {
      print('Input pencarian kosong. Coba lagi.');
      continue;
    }
    if (query.toLowerCase() == 'q') {
      print('Selesai.');
      break;
    }

    final List<int> indeksCocok = [];
    mahasiswa.forEach((idx, nama) {
      if (nama.toLowerCase() == query.toLowerCase()) {
        indeksCocok.add(idx);
      }
    });

    if (indeksCocok.isEmpty) {
      print("Nama '$query' tidak ditemukan.");
    } else {
      print("Nama '$query' ditemukan pada index: ${indeksCocok.join(', ')}");
    }
  }
}
