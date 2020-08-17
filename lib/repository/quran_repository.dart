import 'package:alquran/model/models.dart';
import 'package:alquran/repository/repository.dart';

class QuranRepository implements QuranDataSource {
  final RemoteDataSource remoteDataSource;

  QuranRepository({this.remoteDataSource});

  @override
  Future<MultipleResponse<Surah>> getListSurahs() async {
    return await remoteDataSource.getListSurahs();
  }

  @override
  Future<SingleResponse<Surah>> getDetailSurah(int number) async {
    return await remoteDataSource.getDetailSurah(number);
  }
}
