import 'dart:math'; // untuk membuat angka acak pada ID pemesanan

// ================= KELAS ABSTRAK TRANSPORTASI =================
// Kelas ini menjadi induk (abstrak) untuk semua jenis transportasi
abstract class Transportasi {
  String id, nama; // atribut umum
  double _tarifDasar; // bersifat private (enkapsulasi)
  int kapasitas; // jumlah maksimal penumpang

  // Konstruktor
  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);

  // Getter untuk tarif dasar
  double get tarifDasar => _tarifDasar;

  // Method abstrak (harus diimplementasikan oleh kelas turunan)
  double hitungTarif(int jumlahPenumpang);

  // Method abstrak untuk menampilkan info
  void tampilInfo();
}

// ================= KELAS TURUNAN: TAKSI =================
class Taksi extends Transportasi {
  double jarak; // jarak perjalanan (km)

  // konstruktor taksi
  Taksi(String id, String nama, double tarifDasar, int kapasitas, this.jarak)
      : super(id, nama, tarifDasar, kapasitas);

  // Menghitung tarif berdasarkan jarak
  @override
  double hitungTarif(int jumlahPenumpang) => tarifDasar * jarak;

  // Menampilkan informasi taksi
  @override
  void tampilInfo() =>
      print("Taksi: $nama | Tarif Dasar: $tarifDasar | Jarak: $jarak km");
}

// ================= KELAS TURUNAN: BUS =================
class Bus extends Transportasi {
  bool adaWifi; // apakah bus memiliki wifi

  Bus(String id, String nama, double tarifDasar, int kapasitas, this.adaWifi)
      : super(id, nama, tarifDasar, kapasitas);

  // Menghitung tarif berdasarkan jumlah penumpang dan ada/tidaknya wifi
  @override
  double hitungTarif(int jumlahPenumpang) =>
      (tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 0);

  // Menampilkan informasi bus
  @override
  void tampilInfo() =>
      print("Bus: $nama | Tarif Dasar: $tarifDasar | Wifi: ${adaWifi ? 'Ya' : 'Tidak'}");
}

// ================= KELAS TURUNAN: PESAWAT =================
class Pesawat extends Transportasi {
  String kelas; // Ekonomi atau Bisnis

  Pesawat(String id, String nama, double tarifDasar, int kapasitas, this.kelas)
      : super(id, nama, tarifDasar, kapasitas);

  // Menghitung tarif berdasarkan kelas penerbangan
  @override
  double hitungTarif(int jumlahPenumpang) =>
      tarifDasar * jumlahPenumpang * (kelas == "Bisnis" ? 1.5 : 1.0);

  // Menampilkan informasi pesawat
  @override
  void tampilInfo() =>
      print("Pesawat: $nama | Tarif Dasar: $tarifDasar | Kelas: $kelas");
}

// ================= KELAS PEMESANAN =================
// Kelas ini menyimpan data pemesanan pelanggan
class Pemesanan {
  String idPemesanan, namaPelanggan;
  Transportasi transportasi;
  int jumlahPenumpang;
  double totalTarif;

  // Konstruktor
  Pemesanan(this.idPemesanan, this.namaPelanggan, this.transportasi,
      this.jumlahPenumpang, this.totalTarif);

  // Menampilkan struk pemesanan
  void cetakStruk() {
    print("\n=== Struk Pemesanan ===");
    print("ID       : $idPemesanan");
    print("Nama     : $namaPelanggan");
    print("Kendaraan: ${transportasi.nama}");
    print("Penumpang: $jumlahPenumpang");
    print("Total    : Rp${totalTarif.toStringAsFixed(0)}");
  }
}

// ================= FUNGSI GLOBAL =================

// Fungsi untuk membuat objek pemesanan baru
Pemesanan buatPemesanan(Transportasi t, String nama, int jumlahPenumpang) {
  // hitung total tarif sesuai jenis transportasi
  double total = t.hitungTarif(jumlahPenumpang);
  // buat ID acak untuk pemesanan
  String id = "ORD-${Random().nextInt(9999)}";
  // kembalikan objek Pemesanan
  return Pemesanan(id, nama, t, jumlahPenumpang, total);
}

// Fungsi untuk menampilkan semua data pemesanan
void tampilSemuaPemesanan(List<Pemesanan> daftar) {
  print("\n=== Daftar Semua Pemesanan ===");
  for (var p in daftar) {
    p.cetakStruk();
  }
}

// ================= PROGRAM UTAMA (MAIN) =================
void main() {
  // Membuat objek dari setiap jenis transportasi
  var taksi = Taksi("T001", "BlueBird", 8000, 4, 12); // jarak 12 km
  var bus = Bus("B001", "TransJakarta", 5000, 40, true); // ada wifi
  var pesawat =
      Pesawat("P001", "Garuda Indonesia", 1500000, 180, "Bisnis"); // kelas bisnis

  // Membuat daftar pemesanan pelanggan
  var daftar = [
    buatPemesanan(taksi, "Bayu Putra", 2),
    buatPemesanan(bus, "Andi Pratama", 3),
    buatPemesanan(pesawat, "Siti Aisyah", 2)
  ];

  // Menampilkan semua data pemesanan
  tampilSemuaPemesanan(daftar);
}