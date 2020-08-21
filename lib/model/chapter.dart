import 'package:alquran/model/translated_name.dart';
import 'package:alquran/model/verse.dart';
import 'package:equatable/equatable.dart';

class Chapter extends Equatable {
  final int id;
  final int chapterNumber;
  final bool bismillahPre;
  final int revelationOrder;
  final String revelationPlace;
  final String nameComplex;
  final String nameArabic;
  final String nameSimple;
  final int versesCount;
  final List<dynamic> pages;
  final TranslatedName translatedName;
  final List<Verse> verses;

  const Chapter(
      {this.id,
      this.chapterNumber,
      this.bismillahPre,
      this.revelationOrder,
      this.revelationPlace,
      this.nameComplex,
      this.nameArabic,
      this.nameSimple,
      this.versesCount,
      this.pages,
      this.translatedName,
      this.verses});

  factory Chapter.fromJson(Map<String, dynamic> json) {
    if (json['verses'] != null) {
      json['verses'] = List.generate(json['verses'].length,
          (index) => Verse.fromJson(json['verses'][index]));
    }
    return Chapter(
        id: json['id'],
        chapterNumber: json['chapter_number'],
        bismillahPre: json['bismillah_pre'],
        revelationOrder: json['revelation_order'],
        revelationPlace: json['revelation_place'],
        nameComplex: json['name_complex'],
        nameArabic: json['name_arabic'],
        nameSimple: json['name_simple'],
        versesCount: json['verses_count'],
        pages: json['pages'],
        translatedName: TranslatedName.fromJson(json['translated_name']),
        verses: json['verses']);
  }

  @override
  List<Object> get props => [id];
}
