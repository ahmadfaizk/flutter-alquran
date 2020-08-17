import 'dart:convert';
import 'package:alquran/model/models.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  final String _baseUrl = "http://api.alquran.cloud/v1";
  final http.Client httpClient;

  RemoteDataSource({this.httpClient});

  Future<MultipleResponse<Surah>> getListSurahs() async {
    String url = "$_baseUrl/surah";
    var response = await httpClient.get(url);
    var object = json.decode(response.body);

    List<Surah> surahs = List<Surah>();
    for (int i = 0; i < object['data'].length; i++) {
      surahs.add(Surah.fromJson(object['data'][i]));
    }
    object['data'] = surahs;

    return MultipleResponse<Surah>.fromJson(object);
  }

  Future<SingleResponse<Surah>> getDetailSurah(int number) async {
    String url = "$_baseUrl/surah/$number";
    var response = await httpClient.get(url);
    var object = json.decode(response.body);
    var surah = Surah.fromJson(object['data']);
    object['data'] = surah;
    return SingleResponse<Surah>.fromJson(object);
  }
}
