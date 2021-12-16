import 'dart:convert';
import 'package:latihan_1/Models/kelompok.dart';
import 'package:latihan_1/Models/tanaman.dart';
import 'package:http/http.dart' as http;

class ApiStatic {
  static final host = 'http://192.168.190.223/oplant/public';
  static final _token = "3|r2hOK7gh74Or6LKdIuRaBdS8fNW0rFzfLcN0Vlgr";
  static getHost() {
    return host;
  }

  static Future<List<Tanaman>> getTanaman() async {
    try {
      final response = await http.get(Uri.parse("$host/api/plant"), headers: {
        'Authorization': 'Bearer' + _token,
      });
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        // print(json);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        return parsed.map<Tanaman>((json) => Tanaman.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<List<Kelompok>> getKelompokTanaman() async {
    try {
      final response = await http.get(Uri.parse("$host/api/plant"), headers: {
        'Authorization': 'Bearer' + _token,
      });
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json.cast<Map<String, dynamic>>();
        return parsed.map<Kelompok>((json) => Kelompok.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
