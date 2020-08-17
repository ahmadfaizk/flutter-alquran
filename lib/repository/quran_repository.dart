import 'package:alquran/model/models.dart';
import 'package:alquran/repository/repository.dart';
import 'package:flutter/foundation.dart';

class QuranRepository implements QuranDataSource {
  final RemoteDataSource remoteDataSource;
  final LocalDataSouce localDataSouce;

  QuranRepository(
      {@required this.remoteDataSource, @required this.localDataSouce});

  @override
  Future<MultipleResponse<Surah>> getListSurahs() async {
    return await remoteDataSource.getListSurahs();
  }

  @override
  Future<Surah> getDetailSurah(int number) async {
    return await localDataSouce.getDetailSurah(number);
  }

  @override
  Future<List<Chapter>> getListChapters() async {
    return await localDataSouce.getListChapters();
  }
}
