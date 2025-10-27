import 'dart:math';

// Kelas Abstak Transportasi
abstract class Transportasi {
  String id, nama;
  double _tarifDasar;
  int kapasitas;

  // konstruktor untuk inisialisasi objek transportasi
  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);

  double get tarifDasar => _tarifDasar; //getter untuk tarifDasar

  //metode abstrak yang harus diiimplementasikan oleh kelas turunan
  double hitungTarif(int jumlahPenumpang);
  void tampilInfo();

}

// kelas turunan pertama : taksi
class Taksi extends Transportasi {
  double jarak;

  //konstruktor taksi, menerima jarak perjalanan
  Taksi(String id, String nama, double tarifDasar, int kapasitas, this.jarak)
      :super(id, nama, tarifDasar, kapasitas);

  //menghitung tarif berdasarkan jarak
  @override
  double hitungTarif(int jumlahPenumpang) => tarifDasar * jarak;

  @override
  void tampilInfo() => print ("Taksi: $nama | Tarif: $tarifDasar | jarak: $jarak km");
  }

//kelas turunan kedua : BUS
class Bus extends Transportasi {
  bool adaWifi;

  // konstruktor Bus, menerima informasi wifi
  Bus(String id, String nama, double tarifDasar, int kapasitas, this.adaWifi)
    :super(id, nama, tarifDasar, kapasitas);

  // Menghitung tarif berdasarkan jumlah penumpang dan ada/tidaknya Wi-fi
  @override
  double hitungTarif(int jumlahPenumpang) =>
    tarifDasar * jumlahPenumpang + (adaWifi ? 5000 : 0);

  //menampilkan informasi bus
  @override
  void tampilInfo() => print("Bus: $nama | tarif: $tarifDasar |Wifi: ${adaWifi ? 'ya' : 'tidak'}");
  }

class Pesawat extends Transportasi {
  String kelas;

  //konstruktor pesawat, menerima kelas penerbangan
  Pesawat(String id, String nama, double tarifDasar, int kapasitas, this.kelas)
      : super(id, nama, tarifDasar, kapasitas);

  //Menghitung tarif jumlah penumpang dan kelas penerbangan
  @override
  double hitungTarif(int jumlahPenumpang) =>
    tarifDasar * jumlahPenumpang * (kelas == "Bisnis" ? 1.5 : 1.0);

  //menampilkan informasi pesawat
  void tampilInfo() => print("Pesawat: $nama | Tarif: $tarifDasar | $kelas");
  }

  //Kelas pemesanan
  class Pemesanan {
    String idPemesanan, namaPelanggan;
    Transportasi transportasi;
    int jumlahPenumpang;
    double totalTarif;

    Pemesanan(this.idPemesanan, this.namaPelanggan, this.transportasi,
        this.jumlahPenumpang, this.totalTarif);

    //Menampilkan Struk pemesanan
    void cetakStruk() {
      print("\n=== struk Pemesanan ===");
      print("ID       : $idPemesanan");
      print("Nama     : $namaPelanggan");
      print("Kendaraan: ${transportasi.nama}");
      print("Penumpang: $jumlahPenumpang");
      print("Total    : Rp${totalTarif.toStringAsFixed(0)}");
    }
  }

  //Fungsi global 
  Pemesanan buatPemesanan(Transportasi t, String nama, int jumlahPenumpang) {
    double total = t.hitungTarif(jumlahPenumpang);
    return Pemesanan("ORD-${Random().nextInt(9999)}", nama, t, jumlahPenumpang,total);
  }

  void tampilSemuaPemesanan(List<Pemesanan> daftar) =>
    daftar.forEach((p) => p.cetakStruk()); //Menampilkan semua pesan

  void main() {
    //membuat objek transportasi
    var daftar = [
      buatPemesanan(Taksi("T001", "BlueBird", 8000, 4, 12), "Bayu Purnama Dwi Putra", 2),
      buatPemesanan(Bus("B001", "TransTernate", 5000, 40, true), "William Lerens Domo", 3),
      buatPemesanan(Pesawat("P001", "Garuda Indonesia", 15000, 180, "Bisnis"), "Rizal Jabarudin", 2),
    ];

    tampilSemuaPemesanan(daftar);
  }