// 1. install package dio terlebih dahulu, dan import ke sini
import 'dart:convert';

import 'package:dio/dio.dart';

// 2. menggunakan asyncronous untuk ambil data api
Future<void> main() async {
  // 3. inisasikan sebuah package Dio
  Dio dio = Dio();

  /* 4. variable dio dapat diakses berbagai method salah 
  satunya get untuk mengambil data dari http request */
  var response = await dio.get('http://localhost:3000');
  print('status code : ${response.statusCode}');
  var dataResponse = response.data;
  // 5. Cek hasil response
  print(dataResponse);

  // soal 1
  // tampilkan message / pesan dari response yang didapat
  print(dataResponse[0]);
  // print(dataResponse['sandwich']);

  // soal 2
  // tampilkan semua data dari response yang didapat
  // tidak termasuk message / pesan
  // clue dataResponse[..]

  // soal 3
  // tampilkan data pada urutan pertama saja
  // clue dataResponse[..][..]

  // soal 4
  // tampilkan tulisan Hot Lava Ramene
  // clue dataResponse[..][..][..]
}
