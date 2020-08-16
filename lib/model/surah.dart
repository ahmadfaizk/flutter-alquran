import 'package:alquran/model/models.dart';
import 'package:equatable/equatable.dart';

class Surah extends Equatable {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final int numberOfAyahs;
  final String revelationType;
  final List<Ayah> ayahs;

  Surah(
      {this.number,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.numberOfAyahs,
      this.revelationType,
      this.ayahs});

  factory Surah.fromJson(Map<String, dynamic> json) {
    List<Ayah> ayahs = [];
    if (json['ayahs'] != null) {
      for (int i = 0; i < json['ayahs'].length; i++) {
        ayahs.add(Ayah.fromJson(json['ayahs'][i]));
      }
    }
    return Surah(
        number: json['number'],
        name: json['name'],
        englishName: json['englishName'],
        englishNameTranslation: json['englishNameTranslation'],
        numberOfAyahs: json['numberOfAyahs'],
        revelationType: json['revelationType'],
        ayahs: ayahs);
  }

  @override
  List<Object> get props => [number, name];

  @override
  String toString() {
    return name;
  }
}
