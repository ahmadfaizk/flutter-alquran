import 'package:equatable/equatable.dart';

class Verse extends Equatable {
  final int id;
  final int verseNumber;
  final int chapterId;
  final String verseKey;
  final String textMadani;
  final String textIndopak;
  final String textSimple;
  final int juzNumber;
  final int hizbNumber;
  final int pageNumber;

  const Verse(
      {this.id,
      this.verseNumber,
      this.chapterId,
      this.verseKey,
      this.textMadani,
      this.textIndopak,
      this.textSimple,
      this.juzNumber,
      this.hizbNumber,
      this.pageNumber});

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
        id: json['id'],
        verseNumber: json['verse_number'],
        chapterId: json['chapter_id'],
        verseKey: json['verse_key'],
        textMadani: json['text_madani'],
        textIndopak: json['text_indopak'],
        textSimple: json['text_simple'],
        juzNumber: json['juz_number'],
        hizbNumber: json['hizb_number'],
        pageNumber: json['page_number']);
  }

  @override
  List<Object> get props => [id];
}
