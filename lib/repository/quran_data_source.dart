import 'package:alquran/model/models.dart';

abstract class QuranDataSource {
  Future<MultipleResponse<Surah>> getListSurahs();
  Future<Surah> getDetailSurah(int number);
  Future<List<Chapter>> getListChapters();
}
