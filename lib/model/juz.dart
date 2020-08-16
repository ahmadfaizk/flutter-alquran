import 'package:alquran/model/ayah.dart';
import 'package:alquran/model/edition.dart';
import 'package:alquran/model/surah.dart';
import 'package:equatable/equatable.dart';

class Juz extends Equatable {
  final int number;
  final List<Ayah> ayahs;
  final List<Surah> surahs;
  final Edition edition;

  Juz({this.number, this.ayahs, this.surahs, this.edition});

  factory Juz.fromJson(Map<String, dynamic> json) {
    return Juz(
        number: json['number'],
        ayahs: json['ayahs'],
        surahs: json['surahs'],
        edition: json['edition']);
  }

  @override
  List<Object> get props => [number, ayahs, surahs, edition];
}
