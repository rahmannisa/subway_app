// 1. install package dio terlebih dahulu, dan import ke sini
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:subway_app/model/model.dart';

// 2. menggunakan asyncronous untuk ambil data api
class SubwayService {
  static Future<List<Subway>> getDataSubway() async {
    Dio dio = Dio();

    var response = await Dio().get('http://localhost:3000/sandwich');

    List<Subway> sandwich =
        (response.data as List).map((v) => Subway.fromJson(v)).toList();

    return sandwich;
  }
}
