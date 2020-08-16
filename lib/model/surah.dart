import 'package:equatable/equatable.dart';

class Surah extends Equatable {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final int numberOfAyahs;
  final String revelationType;

  Surah(
      {this.number,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.numberOfAyahs,
      this.revelationType});

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
        number: json['number'],
        name: json['name'],
        englishName: json['englishName'],
        englishNameTranslation: json['englishNameTranslation'],
        numberOfAyahs: json['numberOfAyahs'],
        revelationType: json['revelationType']);
  }

  @override
  List<Object> get props => throw UnimplementedError();
}
