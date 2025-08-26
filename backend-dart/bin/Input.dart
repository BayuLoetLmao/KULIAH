import 'dart:io';

void main(List<String> args){

  String? name;

  int? usia;

  stdout.write("Masukkan nama anda: ");

  name = stdin.readLineSync();

  stdout.write("Masukkan usia anda: ");

  usia = int.parse(stdin.readLineSync()!);

  print(name);

  print(usia);
}