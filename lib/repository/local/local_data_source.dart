import 'dart:convert';
import 'package:alquran/model/models.dart';
import 'package:flutter/services.dart';

class LocalDataSouce {
  Future<List<Chapter>> getListChapters() async {
    var jsonString = await rootBundle.loadString('assets/chapters.json');
    var object = json.decode(jsonString)['chapters'];

    List<Chapter> chapters = [];
    for (int i = 0; i < object.length; i++) {
      chapters.add(Chapter.fromJson(object[i]));
    }

    return chapters;
  }

  Future<Surah> getDetailSurah(int number) async {
    var jsonString = await rootBundle.loadString('assets/quran-simple.json');
    var object = json.decode(jsonString)['data']['surahs'][number - 1];
    return Surah.fromJson(object);
  }
}
