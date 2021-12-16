import 'package:flutter/material.dart';
import 'package:latihan_1/Models/kelompok.dart';
import 'package:latihan_1/Models/tanaman.dart';
import 'package:latihan_1/Services/apiStatic.dart';

class InputTanaman extends StatefulWidget {
  final Tanaman tanaman;
  InputTanaman({required this.tanaman});
  @override
  _InputTanamanState createState() => _InputTanamanState();
}

class _InputTanamanState extends State<InputTanaman> {
  final _formkey = GlobalKey<FormState>();
  late TextEditingController kdPlant, nama, harga, deskripsi, foto;
  late List<Kelompok> _kelompok = [];
  late int idKelompok = 0;
  bool _isupdate = false;
  void getKelompok() async {
    final respose = await ApiStatic.getKelompokTanaman();
    setState(() {
      _kelompok = respose.toList();
    });
  }

  @override
  void initState() {
    kdPlant = TextEditingController();
    nama = TextEditingController();
    harga = TextEditingController();
    deskripsi = TextEditingController();
    getKelompok();
    if (widget.tanaman.idPlant != 0) {
      kdPlant = TextEditingController(text: widget.tanaman.kdPlant);
      nama = TextEditingController(text: widget.tanaman.nama);
      harga = TextEditingController(text: widget.tanaman.harga);
      deskripsi = TextEditingController(text: widget.tanaman.deskripsi);

      idKelompok = widget.tanaman.idKelompokTanaman;
      _isupdate = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isupdate ? Text('Ubah Data') : Text('Input Data'),
      ),
      body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextFormField(
                        controller: kdPlant,
                        validator: (u) => u == "" ? "Wajib Diisi" : null,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.code),
                          hintText: 'Kode Tanaman',
                          labelText: 'Kode Tanaman',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextFormField(
                        controller: nama,
                        validator: (u) => u == "" ? "Wajib Diisi" : null,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.perm_identity),
                          hintText: 'Nama Tanaman',
                          labelText: 'Nama Tanaman',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextFormField(
                        controller: harga,
                        validator: (u) => u == "" ? "Wajib Diisi" : null,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.attach_money),
                          hintText: 'Harga',
                          labelText: 'Harga',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextFormField(
                        controller: deskripsi,
                        keyboardType: TextInputType.multiline,
                        validator: (u) => u == "" ? "Wajib Diisi" : null,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.article),
                          hintText: 'Deskripsi',
                          labelText: 'Deskripsi',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: DropdownButtonFormField(
                        value: idKelompok == 0 ? null : idKelompok,
                        hint: Text("Pilih Kelompok"),
                        decoration: const InputDecoration(
                          icon: Icon(Icons.category_rounded),
                        ),
                        items: _kelompok.map((item) {
                          return DropdownMenuItem(
                            child: Text(item.namaKelompok),
                            value: item.idKelompokTanaman.toInt(),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            idKelompok = value as int;
                          });
                        },
                        validator: (u) => u == null ? "wajib diisi" : null,
                      ),
                    ),
                    Divider(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50.0,
                      child: RaisedButton(
                        color: Colors.green,
                        child: Text(
                          'Simpan',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
