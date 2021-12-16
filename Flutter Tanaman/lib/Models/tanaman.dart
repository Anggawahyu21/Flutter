class Tanaman {
  Tanaman({
    required this.idPlant,
    required this.kdPlant,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.foto,
    required this.idKelompokTanaman,
    required this.namaKelompok,
    required this.createdAt,
    required this.updatedAt,
  });
  int idPlant;
  String kdPlant;
  String nama;
  String harga;
  String deskripsi;
  String foto;
  int idKelompokTanaman;
  String namaKelompok;
  String createdAt;
  String updatedAt;

  factory Tanaman.fromJson(Map<String, dynamic> json) => Tanaman(
        idPlant: json["id_plant"] as int,
        kdPlant: (json["kd_plant"] == null || json["kd_plant"] == '')
            ? ''
            : json["kd_plant"].toString(),
        nama: (json["nama_plant"] == null || json["nama_plant"] == '')
            ? ''
            : json["nama_plant"].toString(),
        harga: (json["harga"] == null || json["harga"] == '')
            ? ''
            : json["harga"].toString(),
        deskripsi: (json["deskripsi"] == null || json["deskripsi"] == '')
            ? ''
            : json["deskripsi"].toString(),
        foto: (json["foto"] == null || json["foto"] == '')
            ? ''
            : json["foto"].toString(),
        idKelompokTanaman: json["id_kelompok_plant"] as int,
        namaKelompok:
            (json["nama_kelompok"] == null || json["nama_kelompok"] == '')
                ? ''
                : json["nama_kelompok"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
      );
}
