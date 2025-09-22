import 'dart:io';

void main() {
  print('Pilih operasi (1-4):');
  print('1. Penjumlahan');
  print('2. Pengurangan');
  print('3. Perkalian');
  print('4. Pembagian');
  
  int pilihan = int.parse(stdin.readLineSync()!);

  print('Masukkan angka pertama:');
  double angka1 = double.parse(stdin.readLineSync()!);
  print('Masukkan angka kedua:');
  double angka2 = double.parse(stdin.readLineSync()!);

  double hasil;
  switch (pilihan) {
    case 1:
      hasil = angka1 + angka2;
      print('Hasil penjumlahan = $hasil');
      break;
    case 2:
      hasil = angka1 - angka2;
      print('Hasil pengurangan = $hasil');
      break;
    case 3:
      hasil = angka1 * angka2;
      print('Hasil perkalian = $hasil');
      break;
    case 4:
      if (angka2 != 0) {
        hasil = angka1 / angka2;
        print('Hasil pembagian = $hasil');
      } else {
        print('Error: Pembagian dengan nol tidak diperbolehkan!');
      }
      break;
    default:
  }
}