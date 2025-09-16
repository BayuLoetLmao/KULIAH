import 'dart:io';

void main() {
  print('Masukkan umur:');
  int umur = int.parse(stdin.readLineSync()!);

  if (umur >= 0 && umur <= 12) {
    print('Anda termasuk kategori Anak-anak');
  } else if (umur >= 13 && umur <= 17) {
    print('Anda termasuk kategori Remaja');
  } else if (umur >= 18 && umur <= 59) {
    print('Anda termasuk kategori Dewasa');
  } else if (umur >= 60) {
    print('Anda termasuk kategori Lansia');
  } else {
    print('Umur tidak valid');
  }
}
