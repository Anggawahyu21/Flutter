class Kelompok {
  Kelompok({required this.idKelompokTanaman, required this.namaKelompok});
  int idKelompokTanaman;
  String namaKelompok;
  factory Kelompok.fromJson(Map<String, dynamic> json) => Kelompok(
      idKelompokTanaman: json["id_kelompok_plant"],
      namaKelompok: json["nama_kelompok"] == null
          ? ''
          : json["nama_kelompok"].toString());
  Map<String, dynamic> toJson() => {
        "id_kelompok_plant": idKelompokTanaman,
        "nama_kelompok": namaKelompok,
      };
}
