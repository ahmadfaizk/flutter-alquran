import 'dart:convert';

import 'package:alquran/model/models.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  final String _baseUrl = "http://api.alquran.cloud/v1";
  final http.Client httpClient;

  RemoteDataSource({this.httpClient});

  Future<MultipleResponse<Surah>> getListSurahs() async {
    String url = "$_baseUrl/surah";
    var response = await http.get(url);
    var object = json.decode(response.body);

    List<Surah> surahs = [];
    object['data'].foreach((surah) => surahs.add(Surah.fromJson(surah)));
    object['data'] = surahs;

    return MultipleResponse.fromJson(object);
  }
}
