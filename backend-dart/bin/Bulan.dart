import 'dart:io';

void main() {

  int? hari;

  stdout.write ('Masukan angka: ');
  hari = int.parse(stdin.readLineSync()!);

  switch (hari){
    case 1:
      print("January");
      break;

    case 2:
      print("Febuary");
      break;

    case 3:
      print("Maret");
      break;
    
    case 4:
      print("April");
      break;

    case 5:
      print("Mey");
      break;

    case 6:
      print("Juni");
      break;

    case 7:
      print("July");
      break;

    case 8:
      print("Agustus");
      break;

    case 9:
      print("September");
      break;

    case 10:
      print("Oktober");
      break;

    case 11:
      print("November");
      break;
    
    case 12:
      print("December");
      break;
    
    default :
      print('Tidak ada dalam bulan');
      break;
  }
}