import 'dart:io';

void main(){

  double? Panjang;
  double? Lebar;
  
  stdout.write("Masukkan panjang: ");

  Panjang = double.parse(stdin.readLineSync()!);

  stdout.write("Masukkan Lebar: ");

  Lebar = double.parse(stdin.readLineSync()!);

  double Luas = Panjang * Lebar;

  double panjangKeliling = 2 * (Panjang + Lebar);

  print("panjang = $Panjang");
  print("Lebar = $Lebar");
  print("Luas = $Luas");
  print("Panjang Keliling = $panjangKeliling");

}