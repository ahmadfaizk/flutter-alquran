import 'package:alquran/model/models.dart';

abstract class QuranDataSource {
  Future<MultipleResponse<Surah>> getListSurahs();
}