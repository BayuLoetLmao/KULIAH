import 'dart:io';

void main(){
  print('masukkan angka:');
  int angka = int.parse(stdin.readLineSync()!);

  if (angka % 2 == 0){
    print('Angka $angka adalah Genap');
  } else {
    print('Angka $angka adalah Ganjil');
  }
}